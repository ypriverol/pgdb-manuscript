import sys

import click
from typing import List
import requests
import re

from ratelimit import limits

FIFTEEN_MINUTES = 100

def print_help():
  """
  Print the help of the tool
  :return:
  """
  ctx = click.get_current_context()
  click.echo(ctx.get_help())
  ctx.exit()

@limits(calls=15, period=FIFTEEN_MINUTES)
def check_peptides_nextprot(peptide_list: List):
  """
  Check if the peptide sequence is in NextProt
  """
  for sequence in peptide_list:
    r = requests.get('https://api.nextprot.org/entries/search/peptide.json?peptide={}&no-variant-match=true'.format(sequence))
    if r.status_code == 200:
      data = r.json()
      if len(data) > 0:
         peptide_list[sequence]['nextprot'] = data[0]['uniqueName']
         peptide_list[sequence]['uniprot'] = data[0]['uniprotName']
    print("Peptide {} - Nextprot {}".format(sequence, peptide_list[sequence]['uniprot']))

  return peptide_list

@limits(calls=15, period=FIFTEEN_MINUTES)
def check_peptides_gpmdb(peptide_list: List):
  """
  Check the peptides in GPMDB and get the number of observations.
  """
  for sequence in peptide_list:
    r = requests.get('http://rest.thegpm.org/1/peptide/count/seq={}'.format(sequence))
    data = r.json()
    peptide_list[sequence]['gpmdb'] = data[0]
    # print("Peptide {} - GPMDB {}".format(sequence, data[0]))
  return peptide_list

def count_observations(data_proxi) -> int:
  count = 0
  if len(data_proxi) > 0:
    for key in data_proxi:
      count = count + int(key['countPSM'])
  return count

@limits(calls=15, period=FIFTEEN_MINUTES)
def check_peptides_proxi(peptide_list: List):
  """
  Count the number of observations in Proxi entry points MAssIVE or PeptideAtlas
  """
  print("Peptide\tGPMDB\tPeptideAtlas\tMassiVE")
  for sequence in peptide_list:
    massive_url = 'http://massive.ucsd.edu/ProteoSAFe/proxi/v0.1/peptidoforms?resultType=compact&peptideSequence={}'.format(sequence)
    result = requests.get(massive_url)
    if result.status_code == 200:
      data = result.json()
      peptide_list[sequence]['massive'] = count_observations(data)

    peptide_atlas = 'http://www.peptideatlas.org/api/proxi/v0.1/peptidoforms?resultType=compact&peptideSequence={}'.format( sequence)
    data = requests.get(peptide_atlas).json()
    peptide_list[sequence]['peptideatlas'] = count_observations(data)

    r = requests.get('http://rest.thegpm.org/1/peptide/count/seq={}'.format(sequence))
    data = r.json()
    peptide_list[sequence]['gpmdb'] = data[0]

    print("{}\t{}\t{}\t{}"
          .format(sequence, peptide_list[sequence]['gpmdb'], peptide_list[sequence]['peptideatlas'], peptide_list[sequence]['massive']))

  return peptide_list


def clean_peptide(peptide_mod: str):
  """
  Clean peptide sequence to remove the PTMs
  """
  peptide_mod = peptide_mod.replace(".", "").strip()
  return re.sub("[\(\[].*?[\)\]]", "", peptide_mod)


@click.command()
@click.option('--peptides_file', help='Peptides tsv file (one peptide sequence per line)')
def main(peptides_file: str):
  if peptides_file is None:
    print_help()

  peptides = {}
  with open(peptides_file) as fp:
    for cnt, line in enumerate(fp):
      if len(line) > 0:
        line = clean_peptide(line)
        if len(line) > 8:
          peptide = {'sequence': line, 'gpmdb': 0, 'peptideatlas': 0, 'pride': 0, 'massive': 0, 'nextprot':'', 'uniprot':''}
          peptides[line] = peptide

  #peptides = check_peptides_nextprot(peptides)
  # peptides = check_peptides_gpmdb(peptides)
  peptides = check_peptides_proxi(peptides)

  for sequence in peptides:
    peptide = peptides[sequence]
    print("Peptide {} GPMDB ({}) PeptideAtlas ({}) MassIVE ({}) NextProt ({}) Uniprot ({})"
          .format(peptide['sequence'], peptide['gpmdb'],peptide['peptideatlas'], peptide['massive'], peptide['nextprot'], peptide['uniprot']))

if __name__ == "__main__":
  main(sys.argv[1:])
