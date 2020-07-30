install.packages("h2o")
library(h2o)

#importando os dados para visualização
digitos = read.csv(gzfile(choose.files()), header=F)
dim(digitos)
head(digitos)

#visualizando alguns digitos
dig1 = t(matrix(unlist(digitos[20,-785]), nrow = 28, byrow=F))
dig1 = t(apply(dig1, 2, rev))
dig1
digitos[20,785]

dig2 = t(matrix(unlist(digitos[2,-785]), nrow = 28, byrow=F))
dig2 = t(apply(dig2, 2, rev))

dig3 = t(matrix(unlist(digitos[4,-785]), nrow = 28, byrow=F))
dig3 = t(apply(dig3, 2, rev))

dig4 = t(matrix(unlist(digitos[5,-785]), nrow = 28, byrow=F))
dig4 = t(apply(dig4, 2, rev))

#visualizando os digitos como imagens
image(dig1, col= grey.colors(255))
image(dig2, col= grey.colors(255))
image(dig3, col= grey.colors(255))
image(dig4, col= grey.colors(255))

#criação do modelo
h2o.init()
treino = h2o.importFile(choose.files())
teste = h2o.importFile(choose.files())
dim(treino)
head(treino)
colnames(treino)

#transformando classe em fator
treino[,785] = as.factor(treino[,785])
teste[,785] = as.factor(teste[,785])

#modelo
modelo = h2o.deeplearning(x = colnames(treino[,1:784]), y = "C785", training_frame =  treino, validation_frame =  teste, distribution =  "AUTO", activation =  "RectifierWithDropout", hidden = c(100,100,100), sparse =  TRUE, epochs = 30)
plot(modelo)

#performance do modelo
h2o.performance(modelo)

#fazendo uma previsao
linha = 2 #alterar esse valor para mudar qual numero deseja fazer a previsao
treino[linha,785]
previsao = h2o.predict(modelo, newdata = treino[linha,1:784])
previsao$predict
