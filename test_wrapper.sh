#!/bin/bash
#SBATCH --job-name=test_vip
#SBATCH --output=/groups/solve-rd/tmp10/projects/vip/feat/non-coding/test/test_vip.out
#SBATCH --error=/groups/solve-rd/tmp10/projects/vip/feat/non-coding/test/test_vip.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=7gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L
#SCRIPT_DIR=$(dirname "$(realpath "$0")")

module load nextflow/21.10.6-Java-11-LTS
#PATH="/groups/solve-rd/tmp10/projects/vip/feat/non-coding/test" 
SINGULARITY_BIND=/apps,/groups,/tmp bash /groups/solve-rd/tmp10/projects/vip/feat/non-coding/test/test.sh