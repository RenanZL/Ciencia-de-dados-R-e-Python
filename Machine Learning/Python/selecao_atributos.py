import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.ensemble import ExtraTreesClassifier


#carregando a base de dados
credito = pd.read_csv("Credit.csv")
credito.head()

#formato de matriz
previsores = credito.iloc[:,0:20].values
classe = credito.iloc[:,20].values

#transformaçao de atributos categóricos em atributos numéricos passando o indice de  cada coluna categórica
labelencoder1 = LabelEncoder()
previsores[:,0] = labelencoder1.fit_transform(previsores[:,0])
labelencoder2 = LabelEncoder()
previsores[:,2] = labelencoder2.fit_transform(previsores[:,2])
labelencoder3 = LabelEncoder()
previsores[:,3] = labelencoder3.fit_transform(previsores[:,3])
labelencoder4 = LabelEncoder()
previsores[:,5] = labelencoder4.fit_transform(previsores[:,5])
labelencoder5 = LabelEncoder()
previsores[:,6] = labelencoder5.fit_transform(previsores[:,6])
labelencoder6 = LabelEncoder()
previsores[:,8] = labelencoder6.fit_transform(previsores[:,8])
labelencoder7 = LabelEncoder()
previsores[:,9] = labelencoder7.fit_transform(previsores[:,9])
labelencoder8 = LabelEncoder()
previsores[:,11] = labelencoder8.fit_transform(previsores[:,11])
labelencoder9 = LabelEncoder()
previsores[:,13] = labelencoder9.fit_transform(previsores[:,13])
labelencoder10 = LabelEncoder()
previsores[:,14] = labelencoder10.fit_transform(previsores[:,14])
labelencoder11 = LabelEncoder()
previsores[:,16] = labelencoder11.fit_transform(previsores[:,16])
labelencoder12 = LabelEncoder()
previsores[:,18] = labelencoder12.fit_transform(previsores[:,18])
labelencoder13 = LabelEncoder()
previsores[:,19] = labelencoder13.fit_transform(previsores[:,19])

#dividindo a base de dados em teste e treino
x_treinamento, x_teste, y_treinamento, y_teste = train_test_split(previsores,classe,test_size = 0.3, random_state = 0)
#criação e treinamento do modelo
svm = SVC()
svm.fit(x_treinamento, y_treinamento)


#previsão e taxa de acerto
previsoes = svm.predict(x_teste)
taxa_acerto = accuracy_score(y_teste, previsoes)
taxa_acerto

#extraindo as caracteristicas mais importantes
forest = ExtraTreesClassifier()
forest.fit(x_treinamento, y_treinamento)
importancias = forest.feature_importances_
importancias

#fazendo a filtragem com as maiores importancias, gerando uma arvore que leva apenas 4 atributos em conta
x_treinamento2 = x_treinamento[:,[0,1,2,3]]
x_teste2 = x_teste[:,[0,1,2,3]]
svm2 = SVC()
svm2.fit(x_treinamento2, y_treinamento)
previsoes2 = svm2.predict(x_teste2)
taxa_acerto = accuracy_score(y_teste, previsoes2)
taxa_acerto
