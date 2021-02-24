import sys

import click
from typing import List
import requests
import re


def print_help():
  """
  Print the help of the tool
  :return:
  """
  ctx = click.get_current_context()
  click.echo(ctx.get_help())
  ctx.exit()


def check_peptides_gpmdb(peptide_list: List):
  for sequence in peptide_list:
    r = requests.get('http://rest.thegpm.org/1/peptide/count/seq={}'.format(sequence))
    data = r.json()
    peptide_list[sequence]['gpmdb'] = data[0]
  return peptide_list


def count_observations(data_proxi) -> int:
  count = 0
  if len(data_proxi) > 0:
    for key in data_proxi:
      count = count + int(key['countPSM'])
  return count


def check_peptides_proxi(peptide_list: List):
  for sequence in peptide_list:
    massive_url = 'http://massive.ucsd.edu/ProteoSAFe/proxi/v0.1/peptidoforms?resultType=compact&peptideSequence={}'.format(sequence)
    result = requests.get(massive_url)
    if result.status_code == 200:
      data = result.json()
      peptide_list[sequence]['massive'] = count_observations(data)

    peptide_atlas = 'http://www.peptideatlas.org/api/proxi/v0.1/peptidoforms?resultType=compact&peptideSequence={}'.format( sequence)
    data = requests.get(peptide_atlas).json()
    peptide_list[sequence]['peptideatlas'] = count_observations(data)

  return peptide_list


def clean_peptide(peptide_mod: str):
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
        peptide = {'sequence': line, 'gpmdb': 0, 'peptideatlas': 0, 'pride': 0, 'massive': 0}
        peptides[line] = peptide

  peptides = check_peptides_gpmdb(peptides)
  peptides = check_peptides_proxi(peptides)

  for sequence in peptides:
    peptide = peptides[sequence]
    print("Peptide {} GPMDB ({}) PeptideAtlas ({}) MassIVE ({})"
          .format(peptide['sequence'], peptide['gpmdb'],peptide['peptideatlas'], peptide['massive']))


if __name__ == "__main__":
  main(sys.argv[1:])
