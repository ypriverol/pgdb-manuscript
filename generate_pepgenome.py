import csv
import pandas as pd

with open("all_out_triqler.tsv") as f:
    reader = csv.reader(f, delimiter="\t")
    d = list(reader)
    peptides = d[1:len(d)]
    peptides_dict = {}
    for peptide in peptides:
      key = (peptide[1],peptide[5])
      if key in peptides_dict:
        peptides_dict[key]["PSMs"]= peptides_dict[key]["PSMs"]+1
        if peptide[4]> peptides_dict[key]["Quant"]:
          peptides_dict[key]["Quant"] = peptide[4]
      else:
        peptides_dict[key] = {"PSMs":1, "Quant":peptide[4]}

    print("Experiment\tPeptide\tPSMs\tQuant")
    for key in peptides_dict:
      experiment = key[0]
      peptide = key[1]
      if peptide[0] == ".":
        lit = peptide.split(")")
        peptide = ")".join(lit[1:len(lit)])
        # print(peptide)

      psms = peptides_dict[key]["PSMs"]
      quant = peptides_dict[key]["Quant"]
      print(experiment + "\t" + peptide + "\t" + str(psms) + "\t" + str(quant))

