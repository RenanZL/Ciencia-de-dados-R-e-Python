library(arules)
library(arulesViz)

#transa��es
transacoes = read.transactions(choose.files(),format="basket",sep=",")
image(transacoes)

#gerando as regras
regras = eclat(transacoes, parameter = list(minlen=2))
inspect(regras)

#visualiza��o
plot(regras, method = "graph", control = list(type="items"))