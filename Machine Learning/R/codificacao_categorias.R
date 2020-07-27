install.packages('mltools')
install.packages('data.table')
library(mltools)
library(data.table)

tit = as.data.frame(Titanic)

labenc = data.matrix(tit[,1:3])

hot_encoding = one_hot(as.data.table((tit[,1:3])))
hot_encoding
