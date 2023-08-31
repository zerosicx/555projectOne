# Join all the genes first, then sort them. After that, call geneToProtein.sh
sh stepOne.sh > stepOneGenes.txt
sh stepTwo.sh > stepTwoGenes.txt

# Join the two files
cat stepOneGenes.txt stepTwoGenes.txt > ass1Genes.txt

# Print and sort
awk '{ print length, $0 }' ass1Genes.txt | sort -n -k1,1 | cut -d" " -f2- > ass1GenesSorted.txt

# geneToProtein has an extra argument (either 1 or 2)
awk -f geneToProtein.awk ass1GenesSorted.txt 1 > '../results/ass1Putatives.txt'