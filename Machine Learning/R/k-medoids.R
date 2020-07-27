install.packages("cluster")
library(cluster)
library(factoextra)

#gerando o cluster
cluster = pam(iris[,1:4], k=3)

#grafico
plot(cluster)
table(iris$Species, cluster$clustering)

#visualizando com factoextra
grafico = fviz_cluster(list(data = iris[,1:4], cluster=cluster$clustering), ellipse.type = "norm", ggtheme = theme_bw())
plot(grafico)
