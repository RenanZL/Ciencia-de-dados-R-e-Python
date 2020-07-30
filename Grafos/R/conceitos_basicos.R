install.packages("igraph")
library(igraph)

grafo = graph(edges=c(1,2,3,4))
plot(grafo)

#grafo conexo
grafo2 = graph(edges=c(1,2,2,3,3,4,4,1))
plot(grafo2)

#arestas nas duas direções
grafo3 = graph(edges=c(1,2,2,3,3,4,4,1,1,4,4,3,3,2,2,1))
plot(grafo3)

#laço
grafo4 = graph(edges=c(1,2,2,3,3,4,4,1,1,1))
plot(grafo4)

#criaçao usando o literal, o + é a seta
grafo5 = graph_from_literal(1-+2,2-+3,3++4,4+-1)
plot(grafo5)

#grafo desconexo
grafo6 = graph_from_literal(1-2-3-4-1,5)
plot(grafo8)


#propriedades do objeto igraph
grafo7 = graph(edges=c(1,2,2,3,3,4,4,1))
plot(grafo7)
grafo7
#D--- 4 4 --    números são as dimensões de vértices e arestas
#1->2 2->3 3->4 4->1   estrutura do grafo
#D/U - direcionado / não direcionado
#N nome do grafo
#W grafo ponderado (peso nas arestas)
#B Tipo do grafo

#grafo nao direcional
grafo8 = graph(edges=c(1,2,2,3,3,4,4,1),directed = F)
plot(grafo8)
grafo8

#elementos isolados
grafo9 = graph(edges=c(1,2,2,3,3,4,4,1),directed = F, n=10)
plot(grafo9)
grafo9

#outra forma de cirar grafos isolados
grafo10 = graph(edges= c("A", "B", "B", "C", "C", "D","D", "E","E","A","A","C","C","B"), isolates =  c("F","G")) 
plot(grafo10)

#matriz adjacente
grafo10[]
#linha 1
grafo10[1,]
#coluna1
grafo10[,1]
#nomes dos vertices
V(grafo10)$name

#outros atributos
grafo11 = graph(edges= c("Fernando", "Pedro", "José", "Antônio", "Fernando", "José","Fernando", "Antônio"))
plot(grafo11)
#pesos aos vértices como atributo
V(grafo11)$Peso = c(40,30,30,25)
#ler atributos, temos name e peso. Nome é padrão
vertex_attr(grafo11)
#atributos para arestas
E(grafo11)$TipoAmizade = c("Amigo","Inimigo","Inimigo","Amigo")
#mostra todos
edge_attr(grafo11)
#mostra atributo pelo nome
edge_attr(grafo11)$TipoAmizade
vertex_attr(grafo11)$Peso
#weight é atributo padrão
E(grafo11)$weight = c(1,2,1,3)
grafo11
#tipo do grafo, agora temos os 4 simbolos preenchidos
V(grafo11)$type ="Humanos"
grafo7
