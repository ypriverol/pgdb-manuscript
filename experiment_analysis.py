import getopt
import os
import sys

import click
import pandas as pd
import glob
from typing import Any, Dict, List, Set
import pyopenms as oms
from pandas import DataFrame
import seaborn as sns


def print_help():
  """
  Print the help of the tool
  :return:
  """
  ctx = click.get_current_context()
  click.echo(ctx.get_help())
  ctx.exit()

def ms_run_from_path(path: str, pattern: str):
  """
  Get MSRun from path
  """
  head, tail = os.path.split(path)
  tail = tail.replace(pattern, "")
  return tail

def generate_plots(merged_pd: DataFrame, project: str):
  plot = sns.barplot(x='run', y='psms', hue='step', data=merged_pd)
  plot.set(xticklabels=[])
  plot.figure.savefig("{}-{}.png".format(project, 'psms'))
  sns.barplot(x='run', y='pep-evidences', hue='step', data=merged_pd)
  plot.set(xticklabels=[])
  plot.figure.savefig("{}-{}.png".format(project, 'pep-evidences'))
  sns.barplot(x='run', y='unique-peptides', hue='step', data=merged_pd)
  plot.set(xticklabels=[])
  plot.figure.savefig("{}-{}.png".format(project, 'unique-peptides'))
  sns.barplot(x='run', y='proteins', hue='step', data=merged_pd)
  plot.set(xticklabels=[])
  plot.figure.savefig("{}-{}.png".format(project, 'proteins'))


def getIDQuality( idxml_file : str ):
  """
  Compute the identification quality metrics for an IdXML file
  """
  pro_ids = list()
  pep_ids = list()

  oms_id = oms.IdXMLFile()
  oms_id.load(idxml_file, pro_ids, pep_ids)

  psm_count: int = 0
  protein_evidence_count: int = 0
  spectrum_count = 0

  report = {}

  peptides_allhits: Set[str] = set()
  peptides: Set[str] = set()
  proteins: Set[str] = set()

  for pepi in pep_ids:
    if not pepi.empty():
      # TODO if not decoy and not under threshold
      spectrum_count += 1
      psm_count += len(pepi.getHits())
      for psm in pepi.getHits():
        peptides_allhits.add(psm.getSequence().toString())
      if pepi.getHits():
        peptides.add(pepi.getHits()[0].getSequence().toString())

  for proid in pro_ids:
    protein_evidence_count += len(proid.getHits())
    for p in proid.getHits():
      proteins.add(p.getAccession())

  report['p-evidences'] = protein_evidence_count
  report['proteins'] = len(proteins)
  report['psms'] = psm_count
  report['pep-evidences'] = spectrum_count
  report['unique-peptides'] = len(peptides)
  return report

def create_df_metrics(props: dict, ms_run: str, step: str, sample: str):
  """
  Distribution per msrun
  """
  props['step'] = step
  props['run'] = ms_run
  props['sample'] = sample
  return pd.DataFrame().append(props, ignore_index=True)


@click.command()
@click.option('--project_path', help='Project path')
@click.option('--project', help='Project name')
def main(project_path: str, project: str):

  if project_path is None or project is None:
    print_help()

  consensus_ids = 'consensus_ids'
  ids = 'ids'
  proteomics_lfq = 'proteomics_lfq'
  raw_ids = 'raw_ids'

  triqler_file = 'out_triqler.tsv'

  consensus_fdr_pattern = '_consensus_fdr.idXML'
  filter_pattern = '_consensus_fdr_filter.idXML'

  comet_percolator_pattern = '_comet_idx_feat_perc.idXML'
  msgf_percolator_pattern = '_msgf_idx_feat_perc.idXML'

  # Final results
  report_peptides_df = pd.DataFrame(
    pd.read_csv("{}/{}/{}".format(project_path, proteomics_lfq, triqler_file), sep='\t', header=0))
  print(report_peptides_df.head(2))

  runs = report_peptides_df['run'].nunique()
  num_peptides = len(report_peptides_df)
  avg = num_peptides / runs

  print("Number of peptides: {}, Avg. Peptides per run: {}".format(num_peptides, avg))
  file_names = glob.glob("{}/{}/*{}".format(project_path, ids, consensus_fdr_pattern))

  ms_runs = [ms_run_from_path(x, consensus_fdr_pattern) for x in file_names]
  print(ms_runs)

  # Get consensus filter and consensus
  frames = []
  for sample in ms_runs:

    consensus_path = "{}/{}/{}{}".format(project_path, ids, sample, consensus_fdr_pattern)
    if os.path.exists(consensus_path):
      frames.append(create_df_metrics(getIDQuality(consensus_path), sample, 'consensus FDR', project))

    consensus_path_filter = "{}/{}/{}{}".format(project_path, ids, sample, filter_pattern)
    if os.path.exists(consensus_path_filter):
      frames.append(create_df_metrics(getIDQuality(consensus_path_filter), sample, 'consensus Filter', project))

    comet_path = "{}/{}/{}{}".format(project_path, raw_ids, sample, comet_percolator_pattern)
    if os.path.exists(comet_path):
      frames.append(create_df_metrics(getIDQuality(comet_path), sample, 'comet', project))

    msgf_path = "{}/{}/{}{}".format(project_path, raw_ids, sample, msgf_percolator_pattern)
    if os.path.exists(msgf_path):
      frames.append(create_df_metrics(getIDQuality(msgf_path), sample, 'msgf', project))

  merged_pd = pd.concat(frames)
  generate_plots(merged_pd, project)


if __name__ == "__main__":
  main(sys.argv[1:])
