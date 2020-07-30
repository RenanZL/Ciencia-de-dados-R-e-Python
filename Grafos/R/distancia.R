library(igraph)

dist = graph(edges=c("A","C","A","B","B","E","B","F","C","D","G","H","D","H","E","H","F","G"),directed=TRUE)
plot(dist)

#pesos nas arestas que vão representar distâncias
E(dist)$weight = c(2,1,2,1,2,1,1,3,1)
plot(dist, edge.label = E(dist)$weight)
tkplot(dist, edge.label = E(dist)$weight, vertex.color="white")

#calcula a distância mais curta entre dois vertices (calcula mas não mostra caminho)
distances(dist,V(dist)$name=="A",V(dist)$name=="H")
#verifica no grafo
plot(dist, edge.label = E(dist)$weight)
#busca o caminho mais curto
#output lista de vertices ou arestas, both retorna os dois
caminho = shortest_paths(dist,V(dist)$name=="A",V(dist)$name=="H", output=c("both"))
caminho$vpath
#conferindo
plot(dist, edge.label = E(dist)$weight)

#procurando o caminho mais curto
#percorre os vértices
for(i in 1:length(V(dist)))
{ #se estiver na lista do caminho mais curto pinta de verde, se não cinza
  V(dist)$color[i] <- ifelse(i  %in% as.vector(unlist(caminho$vpath))
                             ,"green","gray")
}

for(i in 1:length(E(dist)))
{  #se estiver na lista do caminho mais curto pinta de verde, se não cinza
  E(dist)$color[i] <- ifelse(i  %in% as.vector(unlist(caminho$epath))
                             , "green","gray")
}

plot(dist, edge.label = E(dist)$weight)
