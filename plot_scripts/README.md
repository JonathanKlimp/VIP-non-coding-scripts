## plot scripts

This directory contains R scripts that have been used to create plots of the score files and variant scores given by [decision tree](https://github.com/molgenis/vip-decision-tree/tree/feat/annotation).

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