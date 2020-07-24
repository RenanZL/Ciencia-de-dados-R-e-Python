#carregando o pacote que vai ser usado
library(rpart)

credito = read.csv(choose.files())
credito

#criando uma amostra para treino e teste
amostra = sample(2,1000, replace = T, prob = c(0.7,0.3))
credito_treino = credito[amostra == 1,]
credito_teste = credito[amostra == 2,]

#criando o modelo
arvore = rpart(class ~ ., data=credito_treino, method ="class")

#plotando a arvore de decisão
plot(arvore)
text(arvore, use.n = T, all = T, cex=.8)

#fazendo previsao com os modelos de teste
teste = predict(arvore, newdata = credito_teste)
head(teste)

#verificando a aprendizagem do modelo
cred = cbind(credito_teste, teste)
cred["Result"] = ifelse(cred$bad>=0.5,"bad","good")
cred

#criando a matriz de confusao
confusao = table(cred$class,cred$Result)
confusao

#verificando a taxa de acerto
taxa_acerto = (confusao[1] + confusao[4]) / sum(confusao)
taxa_acerto
