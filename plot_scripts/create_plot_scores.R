#!/usr/bin Rscript
library(ggplot2)
library(reshape2)
library("optparse")

option_list <- list(
  make_option(c("-i", "--input"), type="character", default=NULL, 
              help="input file with the variants", metavar="character"),
  make_option(c("-t", "--title"), type="character", default="Number of scored variants per score level",
              help="title of the plot", metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

if (is.null(opt$input)){
  print_help(opt_parser)
  stop("1 vcf files are required, together with a title", call.=FALSE)
}

input <- opt$input
title <- opt$title

variants_input <- read.table(input)

gather_scores <- function(all_annotations) {
  scores_benign <- c()
  for (i in 1:length(all_annotations)) {
    score_split <- strsplit(all_annotations[[i]][79], ",|;")
    scores <- append(scores, score_split[[1]][1])
  }
  return(scores)
}

all_annotations <- strsplit(variants_input$V8, "\\|")

scores <- c("0", "1", "2", "3", "4")
scores_input <- as.data.frame(table(gather_scores(all_annotations = all_annotations)))

df <- data.frame(scores, scores_input$Freq)
colnames(df) <- c("score", "variants")

score_df <- melt(df)
names(score_df)[names(score_df) == 'variable'] <- "Variant"

ggplot(score_df, aes(x = score, y= value, fill = Variant), ylab="Count") +
  geom_bar(stat="identity", width=.5, position = "dodge")  +
  geom_text(aes(label=value), position = position_dodge(width = 0.5), vjust = -0.25) +
  labs(title=title, y = "Count", x = "Score")

filename <- paste(title, ".png")
ggsave(filename, device = "png")
