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
	plot_name=basename $file .bed; 
	Rscript --vanilla create_plot.R $file $plot_name; \
done 