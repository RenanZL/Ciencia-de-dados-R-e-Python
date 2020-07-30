from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from keras.models import Sequential
from keras.layers import Dense
from keras.utils import np_utils
import numpy as np

base = datasets.load_iris()
previsores = base.data
classe = base.target
classe

# Transformação da classe para o formato dummy
classe_dummy = np_utils.to_categorical(classe)
classe_dummy

#divisao entre treino e teste
x_treinamento, x_teste, y_treinamento, y_teste = train_test_split(previsores, classe_dummy, test_size  = 0.3,random_state = 0)

#criacao do modelo

modelo = Sequential()
#primeira camada oculta, 5 neuronios, 4 neuronios de entrada
modelo.add(Dense(units = 5, input_dim = 4))
#segunda camada oculta
modelo.add(Dense(units = 4))
#função softmax porque temos um problema de classificação com mais de duas classes 
#(é gerada uma probabilidade em cada neurônio)
modelo.add(Dense(units = 3, activation = 'softmax'))

modelo.summary()
#configuração dos parâmetros da rede neural (adam = algoritmo para atualizar os pesos e loss = cálculo do erro)
modelo.compile(optimizer = 'adam', loss = 'categorical_crossentropy', metrics = ['accuracy'])
#treinamento, dividindo a base de treinamento em uma porção para validação (validation_data)
modelo.fit(x_treinamento, y_treinamento, epochs = 1000, validation_data = (x_teste, y_teste))

#fazendo previsoes
previsoes = modelo.predict(x_teste)
previsoes = (previsoes > 0.5)
previsoes

#como é um problema com três saídas, precisamos buscar a posição que possui o maior valor (são retornados 3 valores)
y_teste_matrix = [np.argmax(t) for t in y_teste]
y_previsao_matrix = [np.argmax(t) for t in previsoes]

#geração da matriz de confusão
confusao = confusion_matrix(y_teste_matrix, y_previsao_matrix)
confusao
