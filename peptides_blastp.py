import csv
with open("all_out.mzTab") as f:
    reader = csv.reader(f, delimiter="\t")
    d = list(reader)
    dict = {}
for peptide in d:
  if peptide[4] == "variant" or peptide[4] == "non_canonical":
     dict["{}_{}".format(peptide[0], peptide[4])] = peptide[0]

for key in dict:
    print ("{}".format(dict[key]))
