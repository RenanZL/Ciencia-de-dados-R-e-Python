library(igraph)
grafo8 = read_graph("Grafo.graphml", format = c("graphml"))
grafo8 = as.undirected(grafo8)

#detecta comunidades
comun = cluster_edge_betweenness(grafo8)
#visualiza
comun
#cada v�rtice para qual comunidade pertecen
comun$membership
#impress�o usando cor para comunidade
plot(grafo8, vertex.color = comun$membership)

#Recriamos o grafo
dist = graph(edges=c("A","C","A","B","B","E","B","F","C","D","G","H","D","H","E","H","F","G"),directed=TRUE)

comun = cluster_edge_betweenness(dist)
comun
comun$membership

plot(dist, vertex.color = comun$membership, edge.color="gray")

#detec��o de cliques
#min � n�mero minimo de membros
cli = cliques(as.undirected(grafo8), min=4)
length(cli)
cli