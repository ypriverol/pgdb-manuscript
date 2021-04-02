library(ggplot2)
library("dplyr")
library(tidyverse)
library(gapminder)

# Read the peptide intensities
intensity_data <- read.csv('all_out_triqler.tsv', header = TRUE, sep = "\t")

# Remove PTMs information and Sequence column
intensity_data$sequence = gsub("\\s*\\([^\\)]+\\)","",as.character(intensity_data$peptide))
intensity_data$sequence =  gsub("\\.","",as.character(intensity_data$sequence))
intensity_data$aa_length = nchar(intensity_data$sequence)

# Print the peptide length plot
p <- ggplot(intensity_data, aes(x=aa_length, color=Class)) + geom_density(alpha=.2, adjust = 4)  + xlab("Number of AAs") + ylab("Peptide Density") + theme_classic()
p
ggsave(file="aa-peptides.svg", plot=p, width=10, height=8)

# Print the percolator score distribution
p <- ggplot(intensity_data, aes(x=round(searchScore, digits = 2), color=Class)) + geom_density(alpha=.2)  + facet_grid(Class ~ ., scales="free") + xlab("Percolator q-value") + ylab("Number of peptides") + theme_classic()
ggsave(file="score-peptides.svg", plot=p, width=10, height=8)

# Compute the log intensitiy
intensity_data$log_intensity = log2(intensity_data$intensity)

normalit<-function(m){
    (m - min(m))/(max(m)-min(m))
}

intensity_data <- intensity_data %>% mutate(intensity_norm = normalit(log_intensity))

# Correct one cell-line annotation
intensity_data <- intensity_data %>% mutate(condition = ifelse(as.character(condition) == "A-549 cell", "A549", as.character(condition)))







sapply(split(intensity_data$aa_length, intensity_data$Class), mean)


intensity_data %>% ggplot(aes(x=Sample, y=intensity_norm, fill=condition)) + geom_boxplot() + xlab("Cell lines") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(intensity_data, aes(x=Class, y=log_intensity)) + geom_boxplot()+facet_wrap(~condition) +theme_classic()
