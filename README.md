# pgdb-manuscript

This repository contains the data analysis files associated with the publication:

```asciidoc
Generation of ENSEMBL-based proteogenomics databases boosts the identification of non-canonical peptides
Husen M. Umer, Yafeng Zhu, Julianus Pfeuffer, Timo Sachsenberg, Janne Lehtiö, Rui Branca, Yasset Perez-Riverol
bioRxiv 2021.06.08.447496; doi: https://doi.org/10.1101/2021.06.08.447496
```

The data generated in the publication can be found in the following url:
- http://ftp.pride.ebi.ac.uk/pride/data/proteomes/proteogenomics/pgdb-manuscript/

## Python notebooks

Two python notebooks were created to analyse the human and mouse data:

- Peptide_analysis.ipynb (Human)
- Peptide_analysis_mice.ipynb (Mice)

Additionally, a third notebook was created to analyse a benchmark of different settings and databases decoy algorithms (benchmark - http://ftp.pride.ebi.ac.uk/pride/data/proteomes/proteogenomics/cell-lines-benchmark/)

The python use as input the following fasta file: `UniProtr11Dec2019+Ensembl103+GENCODE33+RefSeq29May2020.proteins.fasta.gz`

This file can be found in the releases section of this repository (https://github.com/ypriverol/pgdb-manuscript/releases/download/1.0/UniProtr11Dec2019+Ensembl103+GENCODE33+RefSeq29May2020.proteins.fasta.gz)

## R code

The following scripts r-analysis.R and r-mice-analysis.R were used in the manuscript to generate the statistics and plots.

## Additional files

Additional files can be found here:

- Figures: Main figures of the manuscript.
- pepgenome-input: Files used to gnerate the genome coordinates.
- bed-files: bed files generated
- peptide-ids: The peptide identiication files Triqler and mzTab.
