#!/usr/bin Rscript
library("ggplot2")
library("scales")
library("dplyr")
library("optparse")

option_list <- list(
  make_option(c("-f", "--file"), type="character", default=NULL, 
              help="input bed file name", metavar="character"),
  make_option(c("-o", "--output"), type="character", default="chr.png",
              help="output file name [default = %default]", metavar="character"),
  make_option(c("-t", "--title"), type="character", default = "chr statistics",
              help="title of the generated plot [default = %default]", metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

if (is.null(opt$file)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).bed", call.=FALSE)
}

input_file <- opt$file
plot_name <- opt$title
file_name <- opt$output

ncER_scores <- read.table(input_file, header=F, col.names=c("chr", "start", "stop", "score"))

df_scores <- data.frame(group=cut(ncER_scores$score / 100, c(0, 0.5, 0.7, 0.9, 1), labels = c("low","medium", "high", "very high")))
perc_low <- length(df_scores$group[df_scores$group == "low"]) / nrow(df_scores) * 100
perc_medium <- length(df_scores$group[df_scores$group == "medium"]) / nrow(df_scores) * 100
perc_high <- length(df_scores$group[df_scores$group == "high"]) / nrow(df_scores) * 100
perc_very_high <- length(df_scores$group[df_scores$group == "very high"]) / nrow(df_scores) * 100 
percentages <- c(perc_low, perc_medium, perc_high, perc_very_high)

scores_df <- data.frame(group=c("low", "medium", "high", "very high"), percentage=percentages)

scores_df %>% 
  count(group = factor(group), percentage = percentage) %>% 
  mutate(col4 = prop.table(percentage)) %>% 
  ggplot(aes(x = group, y = col4, label = scales::percent(col4))) + 
  geom_col(position = 'dodge') + 
  geom_text( vjust = 0) + 
  scale_y_continuous(labels = scales::percent) + 
  labs(title = plot_name, x = "score group", y = "Number in group") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  ) +
  scale_fill_discrete(name='Groups', 
                      breaks=c('low', 'medium', 'high', "very high"),
                      labels=c("low", "medium", "high", "very high"))

ggsave(file_name, device="png")

