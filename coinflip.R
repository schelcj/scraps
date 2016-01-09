# This program will simulate 100,000,000 coin flips and write the results to headtail.txt
cat(sample(c('H','T'), size=100000000,replace=TRUE), file="headtail.txt", append=FALSE, sep="\n")
