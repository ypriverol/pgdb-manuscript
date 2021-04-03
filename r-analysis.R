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

# Number of movel peptides per cell line
intensity_data_filer <- intensity_data[!duplicated(intensity_data[c("condition", "sequence")]),]
novel_data <- intensity_data_filer %>% select(condition, Class)

grouped_data <- aggregate(novel_data, by=list(novel_data$condition, novel_data$Class), FUN=length);
names(grouped_data)[1] <- "cell_lines"
names(grouped_data)[3] <- "Count"
names(grouped_data)[4] <- "2"
names(grouped_data)[2] <- "Class"
grouped_data <- grouped_data %>% select(cell_lines, Class, Count)
grouped_data <- grouped_data %>% filter(Class != "contaminant")
grouped_data <- grouped_data %>% filter(Class != "canonical")

# make grouped bar plot
p <- ggplot(grouped_data) + geom_bar(aes(x = cell_lines, y = Count, fill = Class), stat = "identity", position = "dodge")  + theme_minimal() + theme(axis.text.x = element_text(angle = 90)) + labs(x = "Cell lines", y = "Number of peptides")
ggsave(file="peptide-class.svg", plot=p, width=10, height=8)



intensity_data %>% ggplot(aes(x=Sample, y=intensity_norm, fill=condition)) + geom_boxplot() + xlab("Cell lines") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(intensity_data, aes(x=Class, y=log_intensity)) + geom_boxplot()+facet_wrap(~condition) +theme_classic()
