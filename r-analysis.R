library(ggplot2)
library("dplyr")
library(tidyverse)
library(gapminder)
library(svglite)

# Read the peptide intensities
intensity_data <- read.csv('all_noncan_out_triqler.tsv', header = TRUE, sep = "\t")
full_intensity_data <- full_intensity_data %>% filter(Class != "contaminant")
intensity_data$sequence = gsub("\\s*\\([^\\)]+\\)","",as.character(intensity_data$peptide))
intensity_data$sequence =  gsub("\\.","",as.character(intensity_data$sequence))
intensity_data$aa_length = nchar(intensity_data$sequence)
intensity_data_filter <- intensity_data[!duplicated(intensity_data[c("condition", "sequence")]),]

#Read full intensity
full_intensity_data = read.csv('all_out_triqler.tsv', header = TRUE, sep = "\t", row.names=NULL)
full_intensity_data$Class[full_intensity_data$Class == "variant"] <- "mutation"
full_intensity_data <- full_intensity_data %>% filter(Class != "contaminant")
full_intensity_data$sequence = gsub("\\s*\\([^\\)]+\\)","",as.character(full_intensity_data$peptide))
full_intensity_data$sequence =  gsub("\\.","",as.character(full_intensity_data$sequence))
full_intensity_data$aa_length = nchar(full_intensity_data$sequence)
full_intensity_data_filter <- full_intensity_data[!duplicated(full_intensity_data[c("condition", "sequence")]),]

#sequences = as.list(unlist(read.csv("peptides_otherdbs.tsv")))
#full_intensity_data_filter$Class <- ifelse(full_intensity_data_filter$sequence %in%  sequences,"OTHER-REFS",full_intensity_data_filter$Class)


# Remove PTMs information and Sequence column

# Print the peptide length plot
p <- ggplot(full_intensity_data_filter, aes(x=aa_length, color=Class)) + geom_density(alpha=.2, adjust = 2)  + xlab("Number of AAs") + ylab("Peptide Density") + theme_classic() + theme(text = element_text(size = 25))
p
ggsave(file= "figures/aa-peptides.svg", plot=p, width=10, height=8)
aggregate( aa_length ~ Class, full_intensity_data_filter, mean )

# Print the percolator score distribution
small_intensity <- filter(full_intensity_data_filter, searchScore < 0.9 & searchScore > 0.4)
p <- ggplot(small_intensity, aes(y=round(searchScore, digits = 4), x=Class, color=Class)) + geom_violin()  + xlab("") + ylab("proteomicsLFQ quality score") + geom_boxplot(width=.1) + theme_classic() + theme(text = element_text(size = 25), legend.position = "none")
p
ggsave(file= "figures/score-filtered.svg", plot=p, width=15, height=8)

p <- ggplot(full_intensity_data_filter, aes(y=round(searchScore, digits = 4), x=Class, color=Class)) + geom_violin()  + xlab("") + ylab("proteomicsLFQ quality score") + geom_boxplot(width=.1) + theme_classic() + theme(text = element_text(size = 25), legend.position = "none")
p
ggsave(file= "figures/score-all.png", plot=p, width=15, height=8, dpi = 600)

# Compute the log intensitiy
intensity_data$log_intensity = log2(intensity_data$intensity)

normalit<-function(m){
    (m - min(m))/(max(m)-min(m))
}

intensity_data <- intensity_data %>% mutate(intensity_norm = normalit(log_intensity))

# Correct one cell-line annotation
intensity_data <- intensity_data %>% mutate(condition = ifelse(as.character(condition) == "A-549 cell", "A549", as.character(condition)))

# Number of move peptides per cell line
full_intensity_data_filter <- full_intensity_data_filter[!duplicated(intensity_data_filer[c("condition", "sequence")]),]
novel_data <- full_intensity_data_filter %>% select(condition, Class)

grouped_data <- aggregate(novel_data, by=list(novel_data$condition, novel_data$Class), FUN=length);
names(grouped_data)[1] <- "cell_lines"
names(grouped_data)[3] <- "Count"
names(grouped_data)[4] <- "2"
names(grouped_data)[2] <- "Class"
grouped_data <- grouped_data %>% select(cell_lines, Class, Count)
grouped_data <- grouped_data %>% filter(Class != "contaminant")
grouped_data <- grouped_data %>% filter(Class != "canonical")
grouped_data <- grouped_data %>% filter((Class == "mutation" & Count > 5) | (Class == "non_canonical" & Count > 500))

# make grouped bar plot
p <- ggplot(grouped_data) + geom_bar(aes(x = cell_lines, y = Count, fill = Class), stat = "identity",position="dodge") + theme_classic() + theme(axis.text.x = element_text(angle = 90), axis.text=element_text(size=15), axis.title=element_text(size=15),legend.text=element_text(size=15)) + labs(x = "Cell lines", y = "Number of peptides") +  theme(legend.position = c(0.6, 0.6)) + coord_flip()
p
ggsave(file= "figures/peptide-class.svg", plot=p, width=8, height=16)



intensity_data %>% ggplot(aes(x=Sample, y=intensity_norm, fill=condition)) + geom_boxplot() + xlab("Cell lines") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(intensity_data, aes(x=Class, y=log_intensity)) + geom_boxplot()+facet_wrap(~condition) +theme_classic()
