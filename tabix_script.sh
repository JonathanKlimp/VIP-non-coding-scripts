#!/bin/bash
#SBATCH --job-name=make_tabix
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/make_tabix.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/make_tabix.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

#tabix /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv.gz
tabix -p vcf /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.tsv.gz