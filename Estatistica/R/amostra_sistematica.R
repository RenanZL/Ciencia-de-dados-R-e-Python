install.packages("TeachingSampling")

library(TeachingSampling)

#gera uma amostra sistematica, o qual gera um numero aleatorio e adiciona o segundo argumento da fun��o a esse numero at� que o mesmo chegue ao primeiro argumento (ou o mais proximo disso, sem ultrapassar)
#neste caso seria "gere um numero aleatorio at� 10 e some de 10 em 10 sem ultrapassar 150"
amostra = S.SY(150,10)
amostra