#tr�s v�rias informa��es sobre a base de dados iris
summary(iris)

#instalando o pacote com as fun��es necessarias para fazer a amostra estratificada
install.packages("sampling")

#carrrega o pacote
library(sampling)

#gera a amostra aleatoriamente, dividindo os dados de acordo com seu atributo Species
amostrairis = strata(iris, c("Species"), size=c(25,25,25), method="srswor")
summary(amostrairis)

#caso a divis�o de grupos nao for igual e queremos uma amostra que seja proporcinal a cada grupo, podemos usar:
#numero de dados do grupo / numero total de dados * numero de dados que queremos na amostra
amostrainfert = strata(infert, c("education"), size=c(5,48,47),method = "srswor")
summary(amostrainfert)

#method="srswor" � um metodo que gera a amostra sem reposi��o, h� outros metodos na fun��o strata