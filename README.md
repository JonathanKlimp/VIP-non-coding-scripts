# VIP non-coding scripts

This repository contains all the scripts that have been made during the graduation project of implementing non-coding functionality into [VIP](https://github.com/molgenis/vip) 


The scripts are split up into different directories

- cluster_scripts
- data_conversion_scripts
- plot_scripts


## cluster_scripts

contains all scripts used for performing calculation on the fender HPC cluster. 

## data_conversion_scripts

contains scripts that were used to convert data. 

---
The script **convert_score_tsv_to_vcf.sh** is a script that converts a tsv file to vcf. 
usage:

```
bash convert_score_tsv_to_vcf.sh -f <arg> -t <arg>  -l <arg>

 -f <arg>        Input file ([fathmm](https://green-varan.readthedocs.io/en/latest/Download.html) tsv is expected)
 -t <arg>        Name of the tool (fathmm)
 -l <arg>        location for the log file

 ```
---
the script **process_bed_VEP.sh** is a script that processes a simple bed file to comply with [VEP](https://www.ensembl.org/info/docs/tools/vep/script/vep_custom.html) requirements.

 usage:

 ```
 bash process_bed_VEP.sh -f <arg> -o <arg>

 -f <arg>       input file in bed format
 -o <arg>       outfile name (with directory)
 ```
 
---
**filter_solveRD.sh** is a script that filters the SolveRD vcf samples based on prefiltered SolveRD .hcdiff samples

usage:

```
bash filter_solveRD.sh -f <arg> -d <arg> -o <arg> -n <arg>

-f <arg>        input vcf file
-d <arg>        input hcdiff file
-o <arg>        output location
-n <arg>        file name of the unput file
```


## plot scripts

**create_plot_control_set.R** is an R script which creates a plot of the resulting files when annotating [ncVarDB](https://github.com/Gardner-BinfLab/ncVarDB) data with [vip-non-coding](https://github.com/molgenis/vip/tree/feat/non-coding) and variant scores that are calculated and annotated by a altered version of: [decision tree](https://github.com/molgenis/vip-decision-tree/tree/feat/annotation)

usage:
```
rscript create_plot_control_set.R -b <arg> -p <arg>

-b <arg>        input vcf file wth the scored benign variants
-p <arg>        input vcf file with the scored pathogenic variants
```


---

**create_plot.R** is an R script that creates a plot of a tool score file representing the distribution of score values. 

usage:
```
rscript create_plot.R -f <arg> -o <arg> -t <arg>

-f <arg>        input bed file.
-o <arg>        output file name
-t <arg>        title of the plot
```

---

**create_plots_scores.R** is an R script that creates a plot of all the variant counts per score group. It expects [vip-non-coding](https://github.com/molgenis/vip/tree/feat/non-coding) output with variant scores that are calculated and annotated by a altered version of: [decision tree](https://github.com/molgenis/vip-decision-tree/tree/feat/annotation)

usage:
```
rscript create_plot_scores -i <arg> -t <arg>

-i <arg>        input vcf file
-t <arg>        title of the plot
```
