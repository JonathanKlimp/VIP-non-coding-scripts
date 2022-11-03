#!/bin/bash

usage="$(basename "${0}") usage: [-h for help] [-f input score file (.tsv.gz)] [-t scoring tool name] [-l log file location]"

while getopts f:t:h:l: flag
do 
	case "${flag}" in 
		f) score_file=${OPTARG};;
		t) tool_name=${OPTARG};;
		l) log_location=${OPTARG};;
		h) echo "$usage"
			exit
			;;
		:) printf "missing argument for ~%s\n" "$OPTARG" >&2
			echo "$usage" >&2
			exit 1
			;;
		*)	echo "$usage"
			exit 1
			;;
	esac
done

file_name_tsv="${score_file%.*}"
file_name="${file_name_tsv%.*}"
output_name="$file_name"".vcf" 
output_gz="$file_name"".vcf.gz"
directory="$(dirname "$score_file")"

echo "file name tsv variable:" "$file_name_tsv" >> "$log_location""subset_convert_to_vcf.log"
echo "file name variable:" "$file_name" >> "$log_location""subset_convert_to_vcf.log"
echo "output name variable:" "$output_name" >> "$log_location""subset_convert_to_vcf.log"
echo "output gz variable:" "$output_gz" >> "$log_location""subset_convert_to_vcf.log"
echo "directory variable:" "$directory" >> "$log_location""subset_convert_to_vcf.log"
echo ----  >> "$log_location""subset_convert_to_vcf.log"

tmpfile="$directory""/tmpfile"

zcat "$score_file" | sed '1d'  | awk '{$3 = "\t.\t" $3} {$5 = "\t.\t" $5} {$5 = "\t.\t" $5} {$2 = "\t" $2} {$4 = "\t" $4} 1' > "$tmpfile" 

echo "location of tmp file 1 $tmpfile" >> "$log_location""subset_convert_to_vcf.log"

head "$tmpfile" >> "$log_location""subset_convert_to_vcf.log"

echo --"head tmpfile ^"

tmpfile2="$directory""/tmpfile2"

echo "location of tmp file 2 $tmpfile2" >> "$log_location""subset_convert_to_vcf.log"

(echo -e "##INFO=<ID=""$tool_name"",Number=.,Type=String,Description=""$tool_name"" scores format: score>\n#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO" && cat "$tmpfile") > "$tmpfile2"

rm "$tmpfile"

mv "$tmpfile2" "$output_name"

bgzip "$output_name"

tabix -p vcf "$output_name"".gz"