import numpy as np
import skfuzzy
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn import datasets

#carregando a base de dados do modulo datasets
iris = datasets.load_iris()

#aplicando o algoritmo, definindo 3 clusters
r = skfuzzy.cmeans(data = iris.data.T, c = 3, m = 2, error = 0.005, maxiter = 1000, init = None)

#percentuais
previsoes_porcentagem = r[1]

#visualizando as probabilidades
for x in range(150):
    print( previsoes_porcentagem[0][x] , previsoes_porcentagem[1][x], previsoes_porcentagem[2][x])

previsoes = previsoes_porcentagem.argmax(axis=0)
resultados = confusion_matrix(iris.target, previsoes)
resultados
