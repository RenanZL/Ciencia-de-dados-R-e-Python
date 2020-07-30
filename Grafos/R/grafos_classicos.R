install.packages("igraphdata")
library(igraph)
library(igraphdata)

#pontes de koenigsberg
data(Koenigsberg)
plot(Koenigsberg)

#graus impares, não é euleriano
degree(Koenigsberg, mode="all")

#rede social basica
data(kite)
degree(kite, mode="all")
plot(kite)

#amizades de uma faculdade
data(UKfaculty)
UKfaculty
plot(UKfaculty)
comun = cluster_edge_betweenness(UKfaculty, directed = F)
plot(comun,UKfaculty)
