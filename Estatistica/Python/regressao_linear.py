import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from yellowbrick.regressor import ResidualsPlot

#cria a base de dados
base = pd.read_csv('cars.csv')

#apaga a primeira coluna que é apenas a numeração
base = base.drop(['Unnamed: 0'], axis = 1)

#separa os valores da base de dados e mostra a correlação
x = base.iloc[:, 1].values
y = base.iloc[:, 0].values
correlacao = np.corrcoef(x,y)

#inverte o x para colunar e faz a regressão linear
x = x.reshape(-1, 1)
modelo = LinearRegression()
modelo.fit(x,y)

#mostra os coeficientes
modelo.intercept_
modelo.coef_

#plota o modelo
plt.scatter(x,y)
plt.plot(x, modelo.predict(x), color = 'red')

#distancia 22 pés
modelo.intercept_ + modelo.coef_ * 22
modelo.predict(22)

#mostra os residuos
modelo._residues

#usando yellowbrick:
visualizador = ResidualsPlot(modelo)
visualizador.fit(x, y)
visualizador.poof()