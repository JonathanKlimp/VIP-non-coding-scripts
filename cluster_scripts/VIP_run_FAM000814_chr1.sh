#!/bin/bash 
#SBATCH --job-name=FAM0001814_chr1
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/VIP_runs/FAM0001814_chr1/FAM0001814_chr1.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/VIP_runs/FAM0001814_chr1/FAM0001814_chr1.err
#SBATCH --qos=regular
#SBATCH --constraint=tmp10
#SBATCH --time=15:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=8gb
#SBATCH --nodes=1
#SBATCH --open-mode=append
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load nextflow/21.10.6-Java-11-LTS

NXF_VER=21.10.6 SINGULARITY_BIND=/apps,/groups,/tmp nextflow run \
	/groups/solve-rd/tmp10/projects/vip/feat/non-coding/main.nf -profile cluster --assembly GRCh37 \
	--GRCh37_reference /apps/data/1000G/phase1/human_g1k_v37_phiX.fasta.gz \
	-config /groups/solve-rd/tmp10/jklimp/VIP_runs/nextflow.config \
	--input /groups/solve-rd/tmp10/jklimp/WGS_test_dataset_B1MG/FAM000814_chr1.vcf.gz \
	--output /groups/solve-rd/tmp10/jklimp/VIP_runs/FAM0001814_chr1