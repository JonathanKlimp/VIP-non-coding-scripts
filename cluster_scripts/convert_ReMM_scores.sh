#!/bin/bash
#SBATCH --job-name=Remm_convert_bed37
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/convert_ReMM_scores37.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/green_db_tool_scores/convert_ReMM_scores37.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=5gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load BCFtools

gunzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv.gz

awk 'BEGIN{ FS = OFS = "\t" } { print $1,$2,$2,$3 }' /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmpReMM.bed
grep -v "#" /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmpReMM.bed > /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed

bgzip /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed

tabix -p bed /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.bed.gz

rm /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/tmpReMM.bed
rm /groups/solve-rd/tmp10/projects/vip/feat/non-coding/resources/GRCh37/GRCh37_ReMM.tsv