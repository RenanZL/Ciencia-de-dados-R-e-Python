install.packages("RColorBrewer")
library(factoextra)
library(e1071)
library(RColorBrewer)

#gerando o cluster fuzzy (associa percentualmente aos grupos)
cluster = cmeans(iris[,1:4], center=3)
cluster$membership

#visualizando membership com heatmap

heatmap(cluster$membership, Colv = NA, RowV = NA, col = brewer.pal(n = 9, name = "YlOrRd"))

#matriz de confusao
table(iris$Species, cluster$cluster)

#visualização com factoextra
grafico = fviz_cluster(list(data = iris[,1:4], cluster = cluster$cluster), ellipse.type = "norm", ggtheme = theme_bw())
plot(grafico)
