library(arules)
library(arulesViz)

#transações
transacoes = read.transactions(choose.files(),format="basket",sep=",")
image(transacoes)

#gerando as regras
regras = eclat(transacoes, parameter = list(minlen=2))
inspect(regras)

#visualização
plot(regras, method = "graph", control = list(type="items"))
