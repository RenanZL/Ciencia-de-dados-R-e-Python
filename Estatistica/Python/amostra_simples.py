import pandas as pd
import numpy as np

base = pd.read_csv("iris.csv")

base.shape

#gerando 0 e 1 para escolher os dados da amostra
amostra = np.random.choice(a = [0, 1], size = 150, replace = True, p = [0.5, 0.5])

#qtd. de numeros gerados, sendo total, = 1, = 0
len(amostra)
len(amostra[amostra==1])
len(amostra[amostra==0])
