import igraph
import numpy as np

grafo = igraph.load('Grafo.graphml')
print(grafo)

# Visualização do grafo
plot(grafo, bbox = (0,0,600,600))

# Visualização das comunidades
comunidades = grafo.clusters()
print(comunidades)

# Visualização em qual comunidade qual registro foi associado
comunidades.membership

# Visualização do grafo
cores = comunidades.membership
# Array de cores para defirmos cores diferentes para cada grupo
cores = np.array(cores)
cores = cores * 20
cores = cores.tolist()
plot(grafo, vertex_color = cores)

# Criação de grafo direcionado com pesos nas arestas
grafo2 = Graph(edges = [(0,2),(0,1),(1,4),(1,5),(2,3),(6,7),(3,7),(4,7),(5,6)], directed = True)
grafo2.vs['label'] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
grafo2.es['weight'] = [2,1,2,1,2,1,3,1]

# Visualização do grafo
plot(grafo2, bbox = (0,0,300,300))

# Visualização de comunidades e em qual comunidade cada registro foi associado
comunidades2 = grafo2.clusters()
print(comunidades2)
comunidades2.membership

# Função mais otimizada para visualização das comunidades
c = grafo2.community_edge_betweenness()
print(c)
# Obtenção do número de clusters
c.optimal_count
# Visualização da nova comunidade
comunidades3 = c.as_clustering()
print(comunidades3)
comunidades3.membership

# Geração do grafo das comunidades colocando cores entre os grupos identificados
plot(grafo2, vertex_color = comunidades3.membership)
cores = comunidades3.membership
# Array de cores para defirmos cores diferentes para cada grupo
cores = np.array(cores)
cores = cores * 100
cores = cores.tolist()

plot(grafo2, bbox = (0,0,300,300), vertex_color = cores)

# Visualização dos cliques
cli = grafo.as_undirected().cliques(min = 4)
print(cli)
len(cli)