import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.cluster import KMeans
from sklearn import datasets

#carregando a base de dados do modulo datasets
iris = datasets.load_iris()
unicos, quantidade = np.unique(iris.target, return_counts = True)
unicos
quantidade

#agrupamento com k-means
cluster = KMeans(n_clusters = 3)
cluster.fit(iris.data)

#visualização dos centroides
centroides = cluster.cluster_centers_
centroides

#visualização dos grupos
previsoes = cluster.labels_
previsoes

#contagem dos registros por classe
unicos2, quantidade2 = np.unique(previsoes, return_counts = True)
unicos2
quantidade2

#matriz de confusao e taxa de acerto
confusao = confusion_matrix(iris.target, previsoes)
confusao

#gerando graficos com os clusters
plt.scatter(iris.data[previsoes == 0, 0], iris.data[previsoes == 0, 1], c = "green", label = "Setosa")
plt.scatter(iris.data[previsoes == 1, 0], iris.data[previsoes == 1, 1], c = "red", label = "Versicolor")
plt.scatter(iris.data[previsoes == 2, 0], iris.data[previsoes == 2, 1], c = "blue", label = "Virgica")
plt.legend()