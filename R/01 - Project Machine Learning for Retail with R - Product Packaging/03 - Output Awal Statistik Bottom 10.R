library(arules)
data <- read.transactions("https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv",format="single",sep="\t",cols=c(1,2),skip=1)
data_item <- itemFrequency(data, type="absolute")
data_item <- sort(data_item, decreasing=FALSE)
data_item <- data_item[1:10]
data_item <- data.frame("Nama Produk"=names(data_item),"Jumlah"=data_item,row.names=NULL)
write.csv(data_item,file="bottom10_item_retail.txt")
print(data_item)