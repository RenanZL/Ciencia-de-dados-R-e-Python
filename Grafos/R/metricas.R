library(igraph)

#carregando um grafo de relacionamtos 53 vertices e 179 arestas
grafo1 <- read_graph("Grafo.graphml", format = "graphml")
#53 vertices e 179 arestas
grafo1
plot(grafo1)
#grau de entrada e sa�da 
degree(grafo1, mode="all")
#entrada
degree(grafo1, mode="in")	
#sa�da
degree(grafo1, mode="out")

#colocando o grau no tamanho do v�rtice
grau  =  degree(grafo1, mode="in")	
plot(grafo1, vertex.size=grau)

#diametro (maior dist�ncia entre diferentes v�rtices)
diameter(grafo1, directed=T)
diameter(grafo1, directed=F)

#v�rtices que formam o diametro
get_diameter(grafo1, directed=T)
get_diameter(grafo1, directed=F)

#vizinhan�a, zero incluio o proprio vertice, mode all n�o considera a dire��o
neighborhood(grafo1, 0, mode=c("all"))

#densidade do grafo
edge_density(grafo1)

#teste de isomorfismo
grafo2 = grafo1
isomorphic(grafo2,grafo1)