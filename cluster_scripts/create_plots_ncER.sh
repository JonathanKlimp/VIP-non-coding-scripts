#!/bin/bash
#SBATCH --job-name=create_plots
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/scripts/plot_scripts/create_plots_ncER.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/scripts/plot_scripts/create_plots_ncER.err
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=12gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load RPlus

for file in /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/ncER/*; do \
	echo "file: "$file
	file_name_full=${file%.bed};
	plot_title=$(basename ${file_name_full})
	plot_name="${plot_title}.png"
	echo "plot_name: ""$plot_name"
	echo "plot_title: ""$plot_title"
	Rscript --vanilla create_plot.R -f $file -o $plot_name -t $plot_title; \
done 