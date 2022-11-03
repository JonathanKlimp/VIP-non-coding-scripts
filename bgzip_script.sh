#!/bin/bash
#SBATCH --job-name=bgzip_Fathmm
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/bgzip_Fathmm.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/bgzip_Fathmm.err
#SBATCH --time=03:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=5gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

#zcat /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz | bgzip -c > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz
#gunzip -c /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv.gz | bgzip -c > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz

#tabix -p bed /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz
#bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv
bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.tsv