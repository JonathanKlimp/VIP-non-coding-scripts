

for file in /Users/jonathan/Documents/Afstudeeropdracht/Data/solveRD/vip_annotated/*; do \
	echo "file: "$file
	file_name_full=${file%.vcf.gz};
	file_name=$(basename ${file_name_full})
	
	gunzip -c $file > tmp.vcf
	
	java -jar vcf-decision-tree.jar -i tmp.vcf -o /Users/jonathan/Documents/Afstudeeropdracht/Data/solveRD/score_annotated/$file_name"_annotated.vcf" -f -d
	
	Rscript create_plot_scores.R -i /Users/jonathan/Documents/Afstudeeropdracht/Data/solveRD/score_annotated/$file_name"_annotated.vcf" -t "variant scores "$file_name

done 