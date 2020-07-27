library(randomForest)

credito = read.csv(choose.files())
credito$class = as.factor(credito$class)

#criando a amostra
amostra = sample(2,1000, replace = T, prob = c(0.7,0.3))
amostra_treino = credito[amostra==1,]
amostra_teste = credito[amostra==2,]

#criando o modelo
floresta = randomForest(class ~., data= amostra_treino, ntree=100, importance=T)
plot(floresta)

#fazendo a previsao
previsao = predict(floresta,amostra_teste)

#matriz de confusao e taxa de acerto
confusao = table(previsao, amostra_teste$class)
taxa_acerto = (confusao[1] + confusao[4]) / sum(confusao)
taxa_acerto

#com ntree = 100 , taxa = 77%, ntree=10000 , taxa = 79%
#custo computacional aumenta exponencialmente