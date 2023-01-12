#!/bin/bash 
#SBATCH --job-name=VIP_NovelOmics_E000841_Jonathan
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/VIP_runs/vip_novelOmics_chr2_E000841/test_vip.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/VIP_runs/vip_novelOmics_chr2_E000841/test_vip.err
#SBATCH --qos=regular
#SBATCH --constraint=tmp10
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=8gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate 
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load nextflow/21.10.6-Java-11-LTS

NXF_VER=21.10.6 SINGULARITY_BIND=/apps,/groups,/tmp nextflow run \
	/groups/solve-rd/tmp10/projects/vip/latest/main.nf -profile cluster --assembly GRCh37 \
	-config /groups/solve-rd/tmp10/jklimp/VIP_runs/vip_test_run/nextflow.config \
	--input /groups/solve-rd/tmp10/jklimp/WGS_novelomics_copy/chr2_E000481.vcf.gz \
	--output /groups/solve-rd/tmp10/jklimp/VIP_runs/vip_novelOmics_chr2_E000841
