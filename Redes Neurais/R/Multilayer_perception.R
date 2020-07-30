library(neuralnet)
library(mltools)
library(data.table)
library(caret)

#dimensionamento de caracteristica
iris2 = scale(iris[,1:4])
iris2 = as.data.frame(iris2)
iris2
#adicionando a classe
iris2$Species = iris$Species
iris2

#divindo entre treino e teste, usando o caret
set.seed(1234)
particao = createDataPartition(1:dim(iris2)[1], p=.7)
iristreino = iris2[particao$Resample1,]
iristeste = iris2[- particao$Resample1,]

#one hot encoding para classe
iristreino = cbind(iristreino[,1:4],one_hot(as.data.table(iristreino[,5])))
iristreino

#modelo
modelo = neuralnet( V1_setosa + V1_versicolor + V1_virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, iristreino, hidden =c(5,4))
plot(modelo)

#previsao
teste = compute(modelo, iristeste[,1:4])
teste$net.result
resultado = as.data.frame(teste$net.result)
resultado

#atribuindo nomes as colunas conforme a classe
names(resultado)[1] <- 'setosa'
names(resultado)[2] <- 'versicolor'
names(resultado)[3] <- 'virginica'
resultado

#usando o nome das colunas para preencher uma coluna com a classe
resultado$class = colnames(resultado[,1:3])[max.col(resultado[,1:3], ties.method = 'first')]
resultado

#avaliando a performance
confusao = table(resultado$class, iristeste$Species)
confusao
taxa_acerto = sum(diag(confusao)*100/sum(confusao))
taxa_acerto
