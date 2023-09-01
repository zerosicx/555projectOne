BEGIN {
    if (ARGC >= 3) {
        mode = ARGV[2]
        delete ARGV[2]  # Remove the second argument from ARGV
    } else {
        mode = 1  # Default mode is 1 if no second argument provided
    }
}


{
  sequence = $0
  start_pos = 0

  # Search for ATG
  while (match(substr(sequence, start_pos + 1), /ATG/)) {
    gene_start = start_pos + RSTART
    start_pos = gene_start + 2 # Update start_pos for the next iteration

    # Check for sequences of 3 characters and end codons
    for (i = gene_start + 6; i < length(sequence); i += 3) {
      codon = substr(sequence, i, 3)
      if (codon ~ /^(TAG|TAA|TGA)$/) {
        gene = substr(sequence, gene_start, i - gene_start + 3)
        if (length(gene) >= (60 * 3)){
          if (mode == 2){
            print "[R] " gene_start " " gene
          } else {
            print "[P] " gene_start " " gene
          }
        }
        break
      }
    }
  } 
}