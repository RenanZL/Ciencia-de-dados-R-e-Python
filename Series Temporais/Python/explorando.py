import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime

base = pd.read_csv('AirPassengers.csv')

#precisamos passar o mes da base de dados para o tipo date

dateparse = lambda dates: pd.datetime.strptime(dates,'%Y-%m')
base = pd.read_csv('AirPassengers.csv', parse_dates = ['Month'], index_col = 'Month', date_parser = dateparse)

base.index
#passando para o tipo de serie temporal
ts = base['#Passengers']

#maneiras de se referenciar os dados ou indices
ts[1]
ts['1949-02-01']
ts[datetime(1949,2,1)]
ts['1950-01-01':'1950-07-31']
ts[:'1950-07-31']
ts['1950']

ts.index.max()
ts.index.min()

plt.plot(ts)

#ver dados por ano
ts_ano = ts.resample('A').sum()
plt.plot(ts_ano)

#ver dados por mes
ts_mes = ts.groupby([lambda x: x.month]).sum()
plt.plot(ts_mes)

#ver dados por periodos de tempo
ts_datas = ts['1960-01-01':'1960-12-01']
plt.plot(ts_datas)
