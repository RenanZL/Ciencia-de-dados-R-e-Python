import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn import datasets
from scipy import stats


#carregando a base de dados para visualização
iristemp = pd.read_csv("iris.csv")
iristemp.head()

#carregando a base de dados do modulo datasets
iris = datasets.load_iris()
stats.describe(iris.data)

#criação dos previsores
previsores = iris.data
classe = iris.target

#dividindo a base de dados em teste e treino
x_treinamento, x_teste, y_treinamento, y_teste = train_test_split(previsores,classe,test_size = 0.3, random_state = 0)

#criação do modelo e treinamento
knn = KNeighborsClassifier(n_neighbors = 3)
knn.fit(x_treinamento,y_treinamento)

#fazendo previsoes, matriz de confusao e taxa de acerto
previsoes = knn.predict(x_teste)
previsoes
confusao = confusion_matrix(y_teste, previsoes)
confusao
taxa_acerto = accuracy_score(y_teste, previsoes)
taxa_acerto
