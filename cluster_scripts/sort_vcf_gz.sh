#!/bin/bash
#SBATCH --job-name=sort_vcf
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/sort_vcf.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/sort_vcf.err
#SBATCH --time=07:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=10gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

gunzip -k /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf.gz  

sort -k1,1d -k2,2n /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC_sort.vcf

bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC_sort.vcf

tabix -p vcf /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf_sort.gz