#criando uma base de dados
salarios = c(40000, 18000, 12000, 250000, 30000, 140000, 300000, 40000, 800000)

#media
mean(salarios)
#mediana
median(salarios)

#quartis
quartis = quantile(salarios)
quartis

#desvio padrao
sd(salarios)

#todas informações (menos o sd)
summary(salarios)