install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)

#importando as transações
transacoes = read.transactions(choose.files(), format = "basket", sep=",")
transacoes
inspect(transacoes)
image(transacoes)

#minerando
regras = apriori(transacoes, parameter = list(supp=0.5, conf=0.5, minlen=2))
summary(regras)
inspect(regras)

#visualização
plot(regras, method="graph", control=list(type="items"))
plot(regras, method="matrix", control=list(type="items"))
plot(regras, method="matrix30")
