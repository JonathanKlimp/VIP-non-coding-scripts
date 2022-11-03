#!/bin/bash 
#SBATCH --job-name=VIP_WGSsample_Jonathan
#SBATCH --qos=regular
#SBATCH --time=01:30:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=2gb
#SBATCH --nodes=1
#SBATCH --open-mode=append
#SBATCH --export=NONE
#SBATCH --get-user-env=L
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/vip_test_run/errorLog.err

bash VIPscript.sh /groups/solve-rd/tmp10/jklimp/WGS_test_dataset_B1MG/FAM0001816.vcf.gz \
	/groups/solve-rd/tmp10/jklimp/VIP_runs/vip_test_run \
	/groups/solve-rd/tmp10/projects/vip/latest