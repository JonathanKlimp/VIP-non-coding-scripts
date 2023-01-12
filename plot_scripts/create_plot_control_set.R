#!/usr/bin Rscript
library(ggplot2)
library(reshape2)
library("optparse")

option_list <- list(
  make_option(c("-b", "--benign"), type="complex", default=NULL, 
              help="input file with the benign variants", metavar="character"),
  make_option(c("-p", "--pathogenic"), type="complex", default=NULL,
              help="input file with the pathogenc variants", metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

if (is.null(opt$benign) || is.null(opt$pathogenic)){
  print_help(opt_parser)
  stop("Two vcf files are required, one with benign variants, and one with pathogenic variants", call.=FALSE)
}

input_benign <- opt$benign
input_pathogenic <- opt$pathogenic

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

scores <- c("0", "1", "2", "3")
scores_pathogenic <- as.data.frame(table(gather_scores(all_annotations = all_annotations_pathogenic)))
scores_benign <- as.data.frame(table(gather_scores(all_annotations = all_annotations_benign)))


df <- data.frame(scores, scores_pathogenic$Freq, scores_benign$Freq)
colnames(df) <- c("score", "pathogenic", "benign")

score_df <- melt(df)

ggplot(score_df, aes(x = score, y= value, fill = variable), ylab="Count") +
  geom_bar(stat="identity", width=.5, position = "dodge")  +
  labs(title="Number of scored variants per score level", y = "Count", x = "Score")

ggsave("Variant_count_per_score.png", device = "png")
