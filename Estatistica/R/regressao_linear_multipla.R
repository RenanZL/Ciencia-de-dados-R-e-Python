colnames(mtcars)

dim(mtcars)

#mostrando as correlações das 4 primeiras colunas
cor(mtcars[1:4])

#criando o modelo
modelo = lm(mpg ~ disp, data=mtcars)
modelo

#valor de r²
summary(modelo)$r.squared
#valor de r² ajustado
summary(modelo)$adj.r.squared

#plotando o grafico do modelo
plot(mpg ~ disp, data=mtcars)
abline(modelo)

#fazendo previsão do mpg baseado no disp = 200
predict(modelo, data.frame(disp=200))

#mudando o modelo para mpg depender de varias variaveis
modelo = lm(mpg ~ disp + hp + cyl, data=mtcars)
modelo

#valor de r² do novo modelo
summary(modelo)$r.squared
#valor de r² ajustado do novo modelo
summary(modelo)$adj.r.squared

#a adição dessas variaveis mostrou que o modelo está mais preciso em suas previsões

#fazendo a nova previsão
predict(modelo, data.frame(disp=200, hp=100, cyl=4))
