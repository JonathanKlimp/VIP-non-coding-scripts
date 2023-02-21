#!/bin/bash 
#SBATCH --job-name=annotate_FAM0001814
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/scripts/vip_scripts/annotate_FAM0001814.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/scripts/vip_scripts/annotate_FAM0001814.err
#SBATCH --qos=regular
#SBATCH --constraint=tmp10
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=8gb
#SBATCH --nodes=1
#SBATCH --open-mode=append
#SBATCH --export=NONE
#SBATCH --get-user-env=L

apptainer exec --bind annotate:/mnt /groups/solve-rd/tmp10/projects/vip/images/vcf-report-5.1.2.sif \
   java -jar /mnt/vcf-decision-tree.jar -i /mnt/FAM0001814_3_pathogenic.vcf.gz \
   -o FAM0001814_3_pathogenic_score_annotated.vcf -d -f