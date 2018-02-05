#uncomment lines 2 - 5 and execute:
#install.packages("seqinr")
#setRepositories()
#2
#install.packages("Biostrings")

library(seqinr)
library(Biostrings)

myseq <- sapply(1:12, function(x) paste(sample(c("A","T","G","C"), 200, rep = TRUE, prob = c(0.1, 0.4, 0.4, 0.1)), collapse="")) #In this example, the sapply function creates 12 random training sequencs according to assigned probabilities "prob" 200 nucleotides each
myseq
writeLines(myseq) #list sequences individually line by line
writeLines(strtrim(myseq, 10)) # The strtrim() function allows to print only the first section of the sequences as specified (10 nucleotides in this example).
writeLines(strwrap(myseq, indent = 20)) # The strwrap() function provides wrapping, indenting and prefixing utilities.
namingConvention <- paste(">", c(1:12), sep="") # Creates sample names for the sequences that are in fasta format
namingConvention
writeLines(as.vector(t(cbind(namingConvention, myseq))), "strings.fasta") # Writes the sequences in FASTA format to a file and name accordingly
