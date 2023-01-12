#!/bin/bash
#SBATCH --job-name=Fathmm_convert37
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/Fathmm_convert37.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/Fathmm_convert37.err
#SBATCH --time=15:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=7gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

bash /groups/solve-rd/tmp10/jklimp/scripts/tool_scores_scripts/convert_score_tsv_to_vcf.sh -f /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.tsv.gz -t fathmm \
 -l /groups/solve-rd/tmp10/jklimp/green_db_tool_scores/outfiles/