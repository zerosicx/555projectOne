# Chage the input file here

awk -f extractSingleLine.awk ORS="" contig2.txt | awk -f extractSequences.awk "$1" 1