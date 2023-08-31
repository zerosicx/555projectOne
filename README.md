# Scripts for Extracting Potential Gene Sequences
There are two main steps in the program execution.
(1) Step One: extracting the single DNA sequence from the contig file into a sinlge line, then extracting potential gene sequences. For the scope of this assignment, potential gene sequences are considered as starting with ATG and ending with either TAA, TGA, or TAG.
(2) Step Two: extrating the single DNA sequence from the contig file into a single line, getting the reverse complement, then extracting gene sequences from that.

*When running the commands described below, ensure your terminal is in the SCRIPTS subfolder.*

Explation of single awk command files:

`extractSingleLine.awk`: except for the first line, prints all other lines with no new line separator, resulting in a single line output.

- Note: to change the input file, modify the file name at the end of the script here.


`extractSequences.awk`: for any multiple of 3 occurence of ATG (such that there are multiples of 3 bases (codons) behind and in front of it) extract all possible gene sequences (described above).

`reverseComplement.awk`: given a single line input string, iterate through the string from the 3" to 5" (end to start) to compute the reverse complement by concatenating it repeatedly in reading sequence.

`geneToProtein.awk`: converts a file with lines of genes into their respective proteins.
- Takes an extra argument:
  - 1: prints the gene, protein on the next line, followed by a blank line (putative form)
  - 2: prints only the resultant protein. Useful for producing output for BLASTING.


## (1) Output results of step one and step two as PROTEINS
`sh generateCSVFiles.sh` should output the resultant proteins into the results folder.

## (2) Output the results of step one and step two separately as GENES
Step one: `sh stepOne.sh > '../results/stepOneGenes.txt'`
Step two: `sh stepTwo.sh > '../results/stepTwoGenes.txt'`

## (3) Output the protein sequences separately
Step one proteins: `sh stepOne.sh | awk -f geneToProtein.awk "$1" 2> '../results/stepOneProteins.txt'`
Step two proteins: `sh stepTwo.sh | awk -f geneToProtein.awk "$1" 2> '../results/stepTwoProteins.txt'`

## (4) Output the putatives file in the results folder
- The putatives file is in the format: gene, followed by its respective translated protein, followed by a blank line. It should be in sorted order.

Get the putatives file by running: `sh generatePutatives.sh`
- Uses all utility programs together, along with a sorting command to generate the sorted output.