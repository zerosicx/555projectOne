# (1) Exract the DNA Sequence from contig and look for the gene sequences
sh stepOne.sh | sh geneToProtein.sh

# (2) Get the reverse complementand look for the viable gene sequences
sh stepTwo.sh | sh geneToProtein.sh

