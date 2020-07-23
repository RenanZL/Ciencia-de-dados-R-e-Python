import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.arima_model import ARIMA

base = pd.read_csv('AirPassengers.csv')
dateparse = lambda dates: pd.datetime.strptime(dates,'%Y-%m')
base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], index_col = 'Month', date_parser = dateparse)
ts = base['#Passengers']

plt.plot(ts)

ts.mean()

ts['1960-01-01':'1960-12-01'].mean()

#media movel
media_movel = ts.rolling(window = 12).mean()
ts[0:12].mean()
ts[1:13].mean()

plt.plot(ts)
plt.plot(media_movel, color='red')

previsoes = []
for i in range(1,13):
    superior = len(media_movel) - i
    inferior = superior - 11
    previsoes.append(media_movel[inferior:superior].mean())

previsoes = previsoes[::-1]
plt.plot(previsoes)

#arima
modelo = ARIMA(ts,order=(2,1,2))
modelo_treinado = modelo.fit()
modelo_treinado.summary()

previsoes = modelo_treinado.forecast(steps = 12)[0]

eixo = ts.plot()
modelo_treinado.plot_predict('1960-01-01','1962-01-01', ax = eixo, plot_insample = True)

