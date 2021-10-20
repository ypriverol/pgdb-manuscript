import csv
import pandas as pd
import re

with open("all_out_pepgenome_unmapped.txt") as f:
    reader = csv.reader(f, delimiter="\t")
    peptides = list(reader)
    print("Experiment\tPeptide\tPSMs\tQuant")
    for peptide in peptides:
      if (peptide[0] == "No-Gene" and len(re.sub("[\(\[].*?[\)\]]", "", peptide[1])) > 8):
        experiment = peptide[4]
        sequence = peptide[1]
        if sequence == ".":
          lit = sequence.split(")")
          sequence = ")".join(lit[1:len(lit)])
          # print(peptide)
        psms = peptide[5]
        quant = peptide[6]
        print(experiment + "\t" + sequence + "\t" + str(psms) + "\t" + str(quant))
