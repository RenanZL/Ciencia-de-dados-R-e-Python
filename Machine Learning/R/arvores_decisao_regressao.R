#instalando bibliotecas
install.packages("rpart")
install.packages("forecast")
library(rpart)
library(forecast)

#Criando o modelo prevendo o tamanho da sepala (Sepal.Length)
modelo = rpart(Sepal.Length ~Sepal.Width + Petal.Length + Petal.Width + Species, data=iris)
modelo
summary(modelo)

#mostrando de forma visual
plot(modelo)
text(modelo)

#fazendo previsoes
predicao = predict(modelo, iris)
head(predicao)

#comparando a previsao com dados reais
comparacao = cbind(predicao, iris$Sepal.Length, predicao - iris$Sepal.Length)
head(comparacao)

#fazendo a metrica de erros
accuracy(predicao, iris$Sepal.Length)
