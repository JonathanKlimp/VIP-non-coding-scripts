#!/bin/bash 
#SBATCH --job-name=solveRD_samples
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/VIP_runs/solveRD_samples/solveRD_samples.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/VIP_runs/solveRD_samples/solveRD_samples.err
#SBATCH --qos=regular
#SBATCH --constraint=tmp10
#SBATCH --time=60:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=10gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate 
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load nextflow/21.10.6-Java-11-LTS

for file in /groups/solve-rd/tmp10/annotation/SrWgsNovelOmics_Filtered_vcfs/*; do \
	echo "file: "$file
	
	NXF_VER=21.10.6 SINGULARITY_BIND=/apps,/groups,/tmp nextflow run \
		/groups/solve-rd/tmp10/projects/vip/feat/non-coding/main.nf -profile cluster --assembly GRCh37 \
		-config /groups/solve-rd/tmp10/jklimp/VIP_runs/nextflow_keep_all.config \
		--input $file \
		--output /groups/solve-rd/tmp10/jklimp/VIP_runs/solveRD_samples

done 

