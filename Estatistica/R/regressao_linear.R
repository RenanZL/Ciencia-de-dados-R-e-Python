modelo = lm(speed ~ dist, data=cars)

modelo

plot(modelo)

plot(speed ~ dist, data=cars)

#cria a linha de melhor ajuste
abline(modelo)

#intersecção e inclinação
modelo$coefficients

#prevendo a velocidade no ponto do eixo x de 22
modelo$coefficients[1] + modelo$coefficients[2] * 22

#maneira via função
predict(modelo,data.frame(dist=22))

summary(modelo)

#valores dos residuais
modelo$residuals

#valores presentes na linha de melhor 
modelo$fitted.values