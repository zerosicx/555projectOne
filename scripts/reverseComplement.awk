# Reserse Complement
function revcomp(arg) {
    o = ""
    for(i = length(arg); i > 0; i--)
        o = o c[substr(arg, i, 1)] # concatenates the substring to current string
    return(o) # returns final iteration
}

BEGIN {c["A"] = "T"; c["C"] = "G"; c["G"] = "C"; c["T"] = "A" ; OFS="\t"}

{ print revcomp($0) }