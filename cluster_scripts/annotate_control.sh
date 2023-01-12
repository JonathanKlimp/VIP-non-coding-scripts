#!/bin/bash 
#SBATCH --job-name=annotate_controls_ncVarDB
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/scripts/vip_scripts/annotate_controls_ncVarDB.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/scripts/vip_scripts/annotate_controls_ncVarDB.err
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
   java -jar /mnt/annotate_VIP_varan_score.jar -i /mnt/ncVar_pathogenic_lifted_over_to_GRCh37.vcf.gz \
   -c /mnt/decision_tree_GRCh37.json -o out.vcf -d -f