# Chage the input file here

awk -f extractSingleLine.awk ORS="" contig2.txt| tee /dev/tty | awk -f extractSequences.awk

# tee /dev/tty | awk 'END {print "Total lines:", NR}'
