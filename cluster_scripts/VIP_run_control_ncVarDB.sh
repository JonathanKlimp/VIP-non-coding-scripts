#!/bin/bash 
#SBATCH --job-name=VIP_control_ncVarDB
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/VIP_runs/control_ncVarDB/vip_control_ncVarDB.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/VIP_runs/control_ncVarDB/vip_control_ncVarDB.err
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
	-config /groups/solve-rd/tmp10/jklimp/VIP_runs/nextflow_keep_all.config \
	--input /groups/solve-rd/tmp10/ljohansson/VIP/controlsets/ncVarDB_liftover/ncVar_pathogenic_lifted_over_to_GRCh37.vcf \
	--output /groups/solve-rd/tmp10/jklimp/VIP_runs/control_ncVarDB