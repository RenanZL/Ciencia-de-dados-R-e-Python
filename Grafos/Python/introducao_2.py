from igraph import Graph
from igraph import plot

grafo1 = Graph(edges = [(0,1),(1,2),(2,3),(3,0)],directed = True)
grafo1.vs['label'] = range(grafo1.vcount())
print(grafo1)

#grafo nao direcionado
grafo2 = Graph(edges = [(0,1),(1,2),(2,3),(3,0)],directed = False)
grafo2.vs['label'] = range(grafo1.vcount())
print(grafo2)

plot(grafo2, bbox= (0,0,300,300))

grafo3 = Graph(directed = False)
grafo3.add_vertices(10) #adiciona varios vertice
grafo3.add_vertex(10) #adiciona 1 vertice ( o numero 10 )
grafo3.add_edges([(0,1),(2,2),(2,3),(3,0)])
grafo3.vs['label'] = range(grafo3.vcount())
print(grafo3)
plot(grafo3, bbox=(0,0,400,400))

grafo4 = Graph(directed = False)
grafo4.add_vertices(5) #adiciona varios vertice
grafo4.add_edges([(0,1),(2,2),(2,3),(3,0)])
grafo4.vs['label'] = ['A', 'B', 'C', 'D','E']
plot(grafo4)
