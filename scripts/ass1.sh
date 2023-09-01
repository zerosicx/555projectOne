# Output the whole contig as a single line
echo "-----FULL CONTIG-----"
awk -f extractSingleLine.awk ORS="" contig2.txt 


# Output the results of the genes
echo "-----Genes from original contig-----"
echo "-----Primary Orientation-----"
sh stepOne.sh
echo "-----Reverse Complemented-----"
sh stepTwo.sh


# Output the putatives
echo "-----Genes, Proteins & Metadata-----"
echo "Format:"
echo "[P for original contig, R for reverse complement] [start position into the contig] [gene]"
echo "[corresponding protein]"
echo "-----------------------------------"
sh generatePutatives.sh
cat '../results/ass1Putatives.txt'
