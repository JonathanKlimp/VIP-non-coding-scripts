#!/bin/bash
#SBATCH --job-name=get_tail
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/get_tail.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/get_tail.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

zcat /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_FATHMM-MKL_NC.vcf.gz | tail > /groups/solve-rd/tmp10/jklimp/green_db_tool_scores/fathmm_tail.txt