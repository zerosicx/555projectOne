# Generate the stepOne proteins
sh stepOne.sh > stepOneGenes.txt
sh stepTwo.sh > stepTwoGenes.txt

sh stepOne.sh | awk -f geneToProtein.awk stepOneGenes.txt 2 > '../results/stepOneProteins.csv'
sh stepTwo.sh | awk -f geneToProtein.awk stepTwoGenes.txt 2 > '../results/stepTwoProteins.csv'
