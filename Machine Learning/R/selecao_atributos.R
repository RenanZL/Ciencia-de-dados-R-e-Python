install.packages("randomForest")
library(e1071)
library(randomForest)

#carregando base de dados
credito = read.csv(choose.files())
credito$class = as.factor(credito$class)

#set seed para poder repetir o experimento
set.seed(234)

amostra = sample(2,1000, replace=T, prob = c(0.7,0.3))
credito_treino = credito[amostra==1,]
credito_teste = credito[amostra==2,]

#criando o modelo com todos atributos e testando
modelo = svm(class ~. , credito_teste)
predicao = predict(modelo,credito_teste)
confusao = table(credito_teste$class, predicao)
taxa_acerto = (confusao[1] + confusao[4]) / sum(confusao)
taxa_acerto

#aplicando um metodo de selecao de atributos para nao colocar todos
importancia = randomForest(class ~ ., data = credito_treino)
col = importance(importancia)
col
varImpPlot(importancia)

#criando um modelo com as variaveis independentes mais importantes
modelo = svm(class ~credit_amount + age + duration + checking_status , credito_treino)
predicao = predict(modelo, credito_teste)
confusao = table(credito_teste$class,predicao)
taxa_acerto = (confusao[1] + confusao[4])/ sum(confusao)
taxa_acerto

#neste caso o modelo aumentou 3% sua acuracia