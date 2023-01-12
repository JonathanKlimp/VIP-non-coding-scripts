#!/bin/bash
#SBATCH --job-name=remove_last
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/remove_last.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/remove_last.err
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

zcat /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf.gz | head -n -1 > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmp.vcf
bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmp.vcf
mv /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmp.vcf.gz /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf.gz