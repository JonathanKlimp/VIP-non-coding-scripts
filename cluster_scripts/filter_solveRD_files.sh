#!/bin/bash
#SBATCH --job-name=filter_solveRD
#SBATCH --output=/groups/solve-rd/tmp10/jklimp/scripts/solveRD/filter_solveRD.out
#SBATCH --error=/groups/solve-rd/tmp10/jklimp/scripts/solveRD/filter_solveRD.err
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=3
#SBATCH --mem=10gb
#SBATCH --nodes=1
#SBATCH --open-mode=truncate
#SBATCH --export=NONE
#SBATCH --get-user-env=L

module load VCFtools

for file in /groups/solve-rd/tmp10/annotation/SrWgsNovelOmics/*; do \
	echo "file: "$file
	
	file_name_full=${file%.vcf.gz};
	file_name_vcf="${file%.*}"
	file_name_with_dir="${file_name_vcf%.*}"
	file_name=$(basename ${file_name_full})

	echo "file_namevcf: "$file_name_vcf
	echo "file_name_with_dir "$file_name
	echo "file_name "$test_name
	echo "file name merged etc "$file_name".merged.annotations.filtered.hcdiff"
	echo "------"
	
	bash filter_solveRD.sh -f $file -d /groups/solve-rd/tmp10/annotation/SrWgsNovelOmics_Filtered/"$file_name"".merged.annotations.filtered.hcdiff" -o /groups/solve-rd/tmp10/annotation/SrWgsNovelOmics_Filtered_vcfs -n $file_name
done 