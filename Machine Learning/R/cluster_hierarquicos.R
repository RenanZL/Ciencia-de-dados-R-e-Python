library(factoextra)

#criando o cluster
hc = hcut(iris[,-5], k=3, hc_method = "complete", stand=T)

#dendograma
plot(hc)

#dendograma com factoextra
g1 = fviz_dend(hc, show_labels = F, rect = T, ggtheme = theme_bw(), main="cluster hierárquico")
plot(g1)

#cluster
g2 = fviz_cluster(hc, ellipse.type = "norm", ggtheme = theme_bw(), main="cluster hierárquico")
plot(g2)

#comparando
plot(g1)
plot(g2)