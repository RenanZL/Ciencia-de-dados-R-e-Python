colnames(mtcars)

dim(mtcars)

#mostrando as correla��es das 4 primeiras colunas
cor(mtcars[1:4])

#criando o modelo
modelo = lm(mpg ~ disp, data=mtcars)
modelo

#valor de r�
summary(modelo)$r.squared
#valor de r� ajustado
summary(modelo)$adj.r.squared

#plotando o grafico do modelo
plot(mpg ~ disp, data=mtcars)
abline(modelo)

#fazendo previs�o do mpg baseado no disp = 200
predict(modelo, data.frame(disp=200))

#mudando o modelo para mpg depender de varias variaveis
modelo = lm(mpg ~ disp + hp + cyl, data=mtcars)
modelo

#valor de r� do novo modelo
summary(modelo)$r.squared
#valor de r� ajustado do novo modelo
summary(modelo)$adj.r.squared

#a adi��o dessas variaveis mostrou que o modelo est� mais preciso em suas previs�es

#fazendo a nova previs�o
predict(modelo, data.frame(disp=200, hp=100, cyl=4))
