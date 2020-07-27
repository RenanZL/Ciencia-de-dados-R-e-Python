install.packages("class")
library(class)

#criando a mostra de teste e treino
amostra = sample(2,150,replace = T, prob = c(0.7,0.3))
amostra_treino = iris[amostra==1,]
amostra_teste = iris[amostra==2,]

#fazendo a previsao
previsao = knn(amostra_treino[,1:4],amostra_teste[,1:4],amostra_treino[,5], k=3)

#matriz de confusao
tabela = table(amostra_teste[,5],previsao)
tabela

#taxa de acertos
(tabela[1] + tabela[5] + tabela[9]) / sum(tabela)

#alto indice de acerto ( 96% no caso )
#alto custo computacional