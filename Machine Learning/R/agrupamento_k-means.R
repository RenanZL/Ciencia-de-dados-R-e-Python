install.packages("factoextra")
library(factoextra)

#gerando o cluster

cluster = kmeans(iris[1:4],centers=3)
cluster
table(iris$Species, cluster$cluster)

#gerando os graficos
plot(iris$Sepal.Length, iris$Sepal.Width, col=cluster$cluster, pch=20, main="iris")
plot(iris[,1:4], col=cluster$cluster, main="iris")

#gerando graficos especializados em agrupamento
grafico2 = fviz_cluster(cluster, data=iris[1:4], ellipse.type = "convex", ggtheme = theme_bw(), main ="Cluster")
plot(grafico2)

#adicionando o cluster aos dados originais
iris2 = iris
iris2["grupos"] = cluster$cluster
iris2
