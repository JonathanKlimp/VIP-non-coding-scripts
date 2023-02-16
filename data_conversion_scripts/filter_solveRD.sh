#!/bin/bash

while getopts f:d:o:n: flag
do 
	case "${flag}" in 
		f) vcf_file=${OPTARG};;
		d) hcdiff_file=${OPTARG};;
		o) output_location=${OPTARG};;
		n) file_name=${OPTARG};;
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

# grab position back and the same position for indels
awk '{
  if ($11 ~/[ATCG]+/)
	print $7"\t"$8;
  else 
  	print $7"\t"($8 - 1) 
  	print $7"\t"($8)
}' "$hcdiff_file" > "$output_location""/""$file_name""_positions.txt"

echo $hcdiff_file
tmpfile="$output_location""/tmpfile"

echo $output_location"/"$file_name"_positions.txt"

sed '1d' "$output_location""/""$file_name""_positions.txt" > "$tmpfile" 

mv "$tmpfile" "$output_location""/""$file_name""_positions.txt" 

echo $tmpfile

vcftools --gzvcf "$vcf_file" --positions "$output_location""/""$file_name""_positions.txt" --out "$output_location""/""$file_name" --recode

rm $output_location""/""$file_name""_positions.txt" 