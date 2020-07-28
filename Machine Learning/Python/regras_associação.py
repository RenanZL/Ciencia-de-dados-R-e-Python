import pandas as pd
from apyori import apriori

dados = pd.read_csv('transacoes.txt', header = None)
dados

#transformação para o formato de lista, que é exigido pela biblioteca apyori
transacoes = []
for i in range(0,6):
    transacoes.append([str(dados.values[i,j]) for j in range(0,3)])
transacoes

#execução do algoritmo apriori para geração das regras de associação
regras = apriori(transacoes, min_support = 0.5, min_confidence = 0.5,min_length=2)

#criação de nova variável para armazenar somente as regras de associação
resultados = list(regras)
print(resultados[0])
resultados

#criação de nova variável, percorrendo a variável anterior para uma melhor visualização dos resultados
resultados2 = [list(x) for x in resultados]
resultados2

#criação de outra variável para a visualização das regras ficar mais fácil para o usuário, adicionando as regras encontradas na variável resultados2
resultados3 = []
for j in range(0,7):
    resultados3.append([list(x) for x in resultados2[j][2]])
resultados3
