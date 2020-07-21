import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import statsmodels.formula.api as sm


#criando a base de dados
base = pd.read_csv("mt_cars.csv")
base = base.drop(['Unnamed: 0'], axis = 1)

x = base.iloc[:,2].values
y = base.iloc[:,0].values
correlacao = np.corrcoef(x,y)
x = x.reshape(-1,1)

modelo = LinearRegression()
modelo.fit(x,y)
modelo.intercept_
modelo.coef_
modelo.score(x,y)

previsoes = modelo.predict(x)
modelo_ajustado = sm.ols(formula = 'mpg ~ disp', data = base )
modelo_treinado = modelo_ajustado.fit()
modelo_treinado.summary()

plt.scatter(x,y)
plt.plot(x , previsoes, color = 'red')

modelo.predict([200])

x1 = base.iloc[:,1:4].values
y1 = base.iloc[:,0].values
modelo2 = LinearRegression()
modelo2.fit(x1,y1)
modelo2.intercept_
modelo2.coef_
modelo2.score(x1,y1)
modelo_ajustado2 = sm.ols(formula = 'mpg ~ cyl + disp + hp', data = base )
modelo_treinado2 = modelo_ajustado2.fit()
modelo_treinado2.summary()

novo = np.array([4,200,100])
novo = novo.reshape(1,-1)
modelo.predict(novo)