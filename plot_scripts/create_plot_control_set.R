#!/usr/bin Rscript
library(ggplot2)
library(reshape2)
library("optparse")

option_list <- list(
  make_option(c("-b", "--benign"), type="character", default=NULL, 
              help="input file with the benign variants", metavar="character"),
  make_option(c("-p", "--pathogenic"), type="character", default=NULL,
              help="input file with the pathogenc variants", metavar="character"),
  make_option(c("-t", "--title"), type="string", default="Number of scored variants per score level",
              help="title of the plot", metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

if (is.null(opt$benign) || is.null(opt$pathogenic)){
  print_help(opt_parser)
  stop("Two vcf files are required, one with benign variants, and one with pathogenic variants", call.=FALSE)
}

input_benign <- opt$benign
input_pathogenic <- opt$pathogenic
title <- opt$title

ncVarDB_benign <- read.table(input_benign)
ncVarDB_patho <-read.table(input_pathogenic)

gather_scores <- function(all_annotations) {
  scores_benign <- c()
  for (i in 1:length(all_annotations)) {
    score_split <- strsplit(all_annotations[[i]][79], ",|;")
    scores <- append(scores, score_split[[1]][1])
  }
  return(scores)
}

all_annotations_benign <- strsplit(ncVarDB_benign$V8, "\\|")
all_annotations_pathogenic <- strsplit(ncVarDB_patho$V8, "\\|")

scores <- c("0", "1", "2", "3", "4")
scores_pathogenic <- as.data.frame(table(gather_scores(all_annotations = all_annotations_pathogenic)))
scores_benign <- as.data.frame(table(gather_scores(all_annotations = all_annotations_benign)))


df <- data.frame(scores, scores_pathogenic$Freq, scores_benign$Freq)
colnames(df) <- c("score", "pathogenic", "benign")

score_df <- melt(df)
names(score_df)[names(score_df) == 'variable'] <- "Variant"

ggplot(score_df, aes(x = score, y= value, fill = Variant), ylab="Count") +
  geom_bar(stat="identity", width=.5, position = "dodge")  +
  scale_y_log10(breaks=c(0,25,75,150,250,7000)) +
  geom_text(aes(label=value), position = position_dodge(width = 0.5), vjust = -0.25) +
  labs(title=title, y = "Count", x = "Score")

filename <- paste(title, ".png")
ggsave(filename, device = "png")
