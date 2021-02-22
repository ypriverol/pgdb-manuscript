import os

import pandas as pd
import glob
from typing import Any, Dict, List, Set
import pyopenms as oms
import matplotlib as plt


def ms_run_from_path(path: str, pattern: str):
  """
  Get MSRun from path
  """
  head, tail = os.path.split(path)
  tail = tail.replace(pattern, "")
  return tail

def getIDQuality( idxml_file : str ):
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
  props['step'] = step
  props['run'] = ms_run
  props['sample'] = sample
  return pd.DataFrame().append(props, ignore_index=True)

project_path = "/Users/yperez/work/proteogenomics/PXD005946-Sample-19-msgf-comet-bayesian"
project = 'PXD005946-Sample-19'

consensus_ids = 'consensus_ids'
dbs = 'dbs'
ids = 'ids'
logs = 'logs'
proteomics_lfq = 'proteomics_lfq'
raw_ids = 'raw_ids'

triqler_file = 'out_triqler.tsv'
mztab = 'out.mzTab'

consensus_pattern = '_consensus.idXML'
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

  consensus_path_filter = "{}/{}/{}{}".format(project_path, ids,sample, filter_pattern)
  if os.path.exists(consensus_path_filter):
    frames.append(create_df_metrics(getIDQuality(consensus_path_filter), sample, 'consensus Filter', project))

  comet_path = "{}/{}/{}{}".format(project_path, raw_ids, sample, comet_percolator_pattern)
  if os.path.exists(comet_path):
    frames.append(create_df_metrics(getIDQuality(comet_path), sample, 'comet', project))

  msgf_path = "{}/{}/{}{}".format(project_path, raw_ids, sample, msgf_percolator_pattern)
  if os.path.exists(msgf_path):
    frames.append(create_df_metrics(getIDQuality(msgf_path), sample, 'msgf', project))

merged_pd = pd.concat(frames)
merged_pd.plot.bar(stacked=True)
plt.pyplot.show()
print(merged_pd)
merged_pd.groupby('run').psms.value_counts().unstack(0).plot.barh()
print(merged_pd)
