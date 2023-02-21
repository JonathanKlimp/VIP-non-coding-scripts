## cluster_scripts

This directory contains the slurm scripts used during the development of [VIP-non-coding](https://github.com/molgenis/vip/tree/feat/non-coding)

---
**annotate_XXX.sh**

Are slurm scripts that annotate [VIP-non-coding](https://github.com/molgenis/vip/tree/feat/non-coding) with variant scores.

---
**convert_fathmm_MKL_scores.sh**

Is a slurm script that converts the FATMM-MKL tsv file to vcf format using the data_converstion_scripts/convert_score_tsv_to_vcf.sh script.

---
**convert_ReMM_scores.sh**

Is a slurm script that converts the ReMM score file to bed format accepted by [VEP])(https://www.ensembl.org/info/docs/tools/vep/index.html). 


---
**create_plots_XXX.sh**

Are slurm scripts that create plots of the variant scores given by the tools ncER and ReMM. For the plot creation is uses the plot_scripts/create_plot.R script


---
**filter_solveRD_files.sh**

Is a slurm script that filters all solveRD samples based on pre filtered files in hcdiff format.


---
**run_solveRD_samples.sh**

Is a slurm script that runs all solveRD samples in the given directy with VIP non coding.

---
**test_wrapper.sh**

Is a slurm script that runs the VIP test scripts.


---
**VIP_run_XXX.sh**

Are slurm scripts that runs VIP non-coding with different data inputs for each script.

