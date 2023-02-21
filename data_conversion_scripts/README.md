## data_conversion_scripts

This directory contains scripts that were used to convert data. 

---
**convert_score_tsv_to_vcf.sh** is a script that converts a tsv file to vcf. 
usage:

```
bash convert_score_tsv_to_vcf.sh -f <arg> -t <arg>  -l <arg>

 -f <arg>        Input file ([fathmm](https://green-varan.readthedocs.io/en/latest/Download.html) tsv is expected)
 -t <arg>        Name of the tool (fathmm)
 -l <arg>        location for the log file

 ```

---
**filter_solveRD.sh** is a script that filters the SolveRD vcf samples based on prefiltered SolveRD .hcdiff files

usage:

```
bash filter_solveRD.sh -f <arg> -d <arg> -o <arg> -n <arg>

-f <arg>        input vcf file
-d <arg>        input hcdiff file
-o <arg>        output location
-n <arg>        file name of the input file
```

---
**process_bed_VEP.sh** is a script that processes a simple bed file to comply with [VEP](https://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html) requirements.

usage:

 ```
 bash process_bed_VEP.sh -f <arg> -o <arg>

 -f <arg>       input file in bed format
 -o <arg>       outfile name (with directory)
 ```
 

