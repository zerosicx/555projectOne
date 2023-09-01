BEGIN {
    if (ARGC >= 3) {
        mode = ARGV[2]
        delete ARGV[2]  # Remove the second argument from ARGV
    } else {
        mode = 1  # Default mode is 1 if no second argument provided
    }
}

function translateCodon(codon){
    # The regular expressions to change them into amino acids
    if (codon ~ /ATG/){
        return "M"
    } else if (codon ~ /TT[TC]/) {
        return "F"
    } else if (codon ~ /(TT[AG])|(CT[TACG])/) {
        return "L"
    } else if (codon ~ /AA[GA]/) {
        return "K"
    } else if (codon ~ /AT[TCA]/) {
        return "I"
    } else if (codon ~ /GT[ATCG]/) {
        return "V"
    } else if (codon ~ /TC[ATCG]|AG[TC]/) {
        return "S"
    } else if (codon ~ /CC[ATCG]/ ) {
        return "P"
    } else if (codon ~ /AC[ATCG]/) {
        return "T"
    } else if (codon ~ /GC[ATCG]/) {
        return "A"
    } else if (codon ~ /TA[TC]/ ) {
        return "Y"
    } else if (codon ~ /CA[TC]/) {
        return "H"
    } else if (codon ~ /CA[AG]/) {
        return "Q"
    } else if (codon ~ /AA[TC]/) {
        return "N"
    } else if (codon ~ /GA[TC]/) {
        return "D"
    } else if (codon ~ /GA[AG]/) {
        return "E"
    } else if (codon ~ /TG[TC]/) {
        return "C"
    } else if (codon ~ /TGG/) {
        return "W"
    } else if (codon ~ /AG[AG]|CG[ATCG]/) {
        return "R"
    } else if (codon ~ /GG[ATCG]/) {
        return "G"
    } else if (codon ~ /TAA|TGA|TAG/) {
        return "X"
    } else {
        return ""
    }

}

{
    gene = $3
    start_pos = 1
    protein = ""

    while (start_pos <= length(gene)) {
        codon = substr(gene, start_pos, 3)
        amino_acid = translateCodon(codon)
        protein = protein amino_acid
        start_pos += 3
    }

    if (length(protein) >= 60) {
        if (mode == 1) {
            print $1 " " $2 " " $3 "\n" protein "\n"
        } else if (mode == 2) {
            print protein
        }
    }
}