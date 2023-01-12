#!/bin/bash
#SBATCH --job-name=remove_spaces
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/remove_spaces.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/remove_spaces.err
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=5gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools


gunzip -c /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf.gz | perl -pi -e 's| \t|\t|g' > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC_no_space.vcf

bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC_no_space.vcf

tabix -p vcf /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC_no_space.vcf.gz