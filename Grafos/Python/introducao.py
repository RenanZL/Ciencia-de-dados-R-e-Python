from igraph import Graph
from igraph import plot

grafo1 = Graph(edges = [(0,1),(1,2),(2,3),(3,0)], directed = True)
#definindo rotulos de cada vertice
grafo1.vs['label'] = range(grafo1.vcount())
print(grafo1)

plot(grafo1)

#criando outro grafo
grafo2 = Graph(edges = [(0,1),(1,2),(2,3),(3,0),(0,3),(3,2),(2,1),(1,0)], directed = True)
grafo2.vs['label'] = range(grafo2.vcount())
plot(grafo2, bbox = (0,0,400,400))

#grafo com laço
grafo3 = Graph(edges = [(0,1),(1,2),(2,3),(3,0),(1,1)],directed = True)
grafo3.vs['label'] = range(grafo3.vcount())
plot(grafo3)

#vertice isolado
grafo4 = Graph(edges = [(0,1),(1,2),(2,3),(3,0),(1,1)],directed = True)
grafo4.vs['label'] = range(grafo4.vcount())
grafo4.add_vertex(5)
plot(grafo4, bbox = (0,0,300,300))
