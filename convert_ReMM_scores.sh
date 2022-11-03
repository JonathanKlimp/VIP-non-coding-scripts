#!/bin/bash
#SBATCH --job-name=Remm_convert_bed
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/convert_ReMM_scores.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/convert_ReMM_scores.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=5gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

gunzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv.gz

grep -v "#" /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv \
| sort -k1,1 -k2,2n -k3,3n -t$'\t' | bgzip -c > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz

#bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ncER_perc.bed
tabix /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz

#zcat /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv.gz | grep -v "#" | sort -k1,1 -k2,2n -k3,3n -t$'\t' | bgzip -c > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz
#tabix -p bed /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz

#/groups/solve-rd/tmp10/jklimp/scripts/tool_scores_scripts/convert_score_tsv_to_vcf.sh -f /groups/solve-rd/tmp10/jklimp/green_db_tool_scores/GRCh37_ReMM.tsv.gz -t ReMM