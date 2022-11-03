#!/usr/bin/bash

usage="$(basename "${0}") usage: [-h for help] [-f input bed file] | [-o dir with output file name]"


while getopts f:o:h: flag
do 
	case "${flag}" in 
		f) input_file=${OPTARG};;
		o) output_file=${OPTARG};;
		h) echo "$usage"
           exit
           ;;
        :) printf "missing argument for -%s\n" "$OPTARG" >&2
           echo "$usage" >&2
           exit 1
           ;;
        *) echo "$usage"
           exit 1
           ;;
	esac
done

cut -f 1,2,3,9 "$input_file" > tmp.txt && mv tmp.txt "$output_file" 

#awk '$4 > 0.7 && $4 != "NA"' tmp.txt > "$output_file" 

#rm tmp.txt          

grep -v "#" "$output_file"   | sort -k1,1 -k2,2n -k3,3n -t$'\t' | bgzip -c > "$output_file".gz

tabix -p bed "$output_file".gz