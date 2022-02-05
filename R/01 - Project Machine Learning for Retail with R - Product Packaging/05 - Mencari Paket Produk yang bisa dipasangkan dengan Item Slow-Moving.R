library(arules)
transaksi <- read.transactions(file="transaksi_dqlab_retail.tsv",format="single",sep="\t",cols=c(1,2),skip=1)

kombinasi_retail <- apriori(transaksi,parameter=list(supp=10/length(transaksi),confidence=0.1,minlen=2,maxlen=3))

a <- subset(kombinasi_retail,(rhs%in%"Tas Makeup"))
b <- subset(kombinasi_retail,(rhs%in%"Baju Renang Pria Anak-anak"))

a <- sort(a,decreasing=TRUE,by='lift')[1:3]
b <- sort(b,decreasing=TRUE,by='lift')[1:3]

rules <- c(a,b)
inspect(rules)

write(rules, file="kombinasi_retail_slow_moving.txt")
print(rules)