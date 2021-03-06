library(arules)
transaksi <- read.transactions("https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv", format="single",sep="\t",cols=c(1,2),skip=1)
kombinasi <- apriori(transaksi,parameter=list(supp=10/length(transaksi),confidence=0.5,minlen=2,maxlen=3))
kombinasi <- head(sort(kombinasi, decreasing=TRUE,by='lift'),n=10)
write(kombinasi,file="kombinasi_retail.txt")
print(kombinasi)