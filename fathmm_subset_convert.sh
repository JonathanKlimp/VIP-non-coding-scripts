#!/bin/bash
#SBATCH --job-name=Fathmm_subset_convert_scores_to_vcf
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/Fathmm_convert_subset_scores_to_vcf.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/Fathmm_convert_subset_scores_to_vcf.err
#SBATCH --time=05:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=10gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

bash /groups/solve-rd/tmp10/jklimp/scripts/tool_scores_scripts/subset_convert_score_vcf.sh -f /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.tsv.gz -t fathmm_MKL \
 -l /groups/solve-rd/tmp10/jklimp/green_db_tool_scores/