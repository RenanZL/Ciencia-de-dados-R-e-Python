#gerando uma distribuição normal de dados:
x = rnorm(100)
#gerando o grafico de normalidade:
qqnorm(x)
#gerando a linha de melhor ajuste do grafico:
qqline(x)
#fazendo o teste de Shapiro-Wilk para verificar a normalidade:
shapiro.test(x)
#o p-value deve ser maior que 0.5