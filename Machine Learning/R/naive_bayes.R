#instalando o pacote
install.packages("e1071")
library(e1071)

#carregando os dados
credito = read.csv(choose.files())

#transformando a classe em fator
credito$class = as.factor(credito$class)

#separando uma amostra
amostra = sample(2,1000,replace=T, prob=c(0.7,0.3))
credito_treino = credito[amostra==1,]
credito_teste = credito[amostra==2,]

#criand o modelo
modelo = naiveBayes(class ~ ., credito_treino)

#fazendo previsao
previsao = predict(modelo, credito_teste)
previsao

#matriz de confusao
confusao = table(credito_teste$class, previsao)

#taxa de acerto e erro
taxa_acerto = (confusao[1] + confusao[4]) / sum(confusao)
taxa_erro = (confusao[2] + confusao[3]) / sum(confusao)
taxa_acerto
