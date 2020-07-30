library(igraph)

#recriando o grafo da ultima aula
grafo1 = graph(edges= c("Fernando", "Pedro", "José", "Antônio", "Fernando", "José","Fernando", "Antônio"))
V(grafo1)$Peso = c(40,30,30,25)
E(grafo1)$TipoAmizade = c("Amigo","Inimigo","Inimigo","Amigo")
E(grafo1)$weight = c(1,2,1,3)
V(grafo1)$type ="Humanos"

#visualizando
#tamanho do vértice de acordo com o peso
plot(grafo1, vertex.size=vertex_attr(grafo1)$Peso)
#tamanho da areasta de acordo com o peso
plot(grafo1, vertex.size=vertex_attr(grafo1)$Peso, edge.width=edge_attr(grafo1)$weight)

#cores aos vértices em um atributo
vertex_attr(grafo1)$Cor = c("Blue", "Red", "Yellow", "Green")
#plot com cores a partir do atributo
plot(grafo1, vertex.size=vertex_attr(grafo1)$Peso, edge.width=edge_attr(grafo1)$weight, vertex.color= vertex_attr(grafo1)$Cor)

#curvado, titulo e frame
plot(grafo1, vertex.size=vertex_attr(grafo1)$Peso, edge.width=edge_attr(grafo1)$weight, vertex.color= vertex_attr(grafo1)$Cor, edge.curved=0.4, frame=TRUE, main="Grafo")
#vertice retângulo
plot(grafo1, vertex.size=vertex_attr(grafo1)$Peso, edge.width=edge_attr(grafo1)$weight, vertex.color= vertex_attr(grafo1)$Cor, edge.curved=0.4, frame=TRUE, main="Grafo", vertex.shape="square")

#grafo de relacionamentos
grafo2 = read_graph("Grafo.graphml", format = c("graphml"))
tkplot(grafo2)
