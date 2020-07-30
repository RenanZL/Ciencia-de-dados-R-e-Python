library(igraph)

#carregando um grafo de relacionamtos 53 vertices e 179 arestas
grafo1 <- read_graph("Grafo.graphml", format = "graphml")
#53 vertices e 179 arestas
grafo1
plot(grafo1)
#grau de entrada e saída 
degree(grafo1, mode="all")
#entrada
degree(grafo1, mode="in")	
#saída
degree(grafo1, mode="out")

#colocando o grau no tamanho do vértice
grau  =  degree(grafo1, mode="in")	
plot(grafo1, vertex.size=grau)

#diametro (maior distância entre diferentes vértices)
diameter(grafo1, directed=T)
diameter(grafo1, directed=F)

#vértices que formam o diametro
get_diameter(grafo1, directed=T)
get_diameter(grafo1, directed=F)

#vizinhança, zero incluio o proprio vertice, mode all não considera a direção
neighborhood(grafo1, 0, mode=c("all"))

#densidade do grafo
edge_density(grafo1)

#teste de isomorfismo
grafo2 = grafo1
isomorphic(grafo2,grafo1)