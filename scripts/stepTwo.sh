# Chage the input file here

awk -f extractSingleLine.awk ORS="" contig2.txt | awk -f reverseComplement.awk | awk -f extractSequences.awk "$1" 2