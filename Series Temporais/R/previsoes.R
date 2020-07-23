#maneiras de fazer previsao

#media ( pouco precisa mas muito simples)
mean(AirPassengers)
#podemos diminuir o erro olhando a media do ultimo ano
mean(window(AirPassengers, star=c(1960,1), end=c(1960,12)))

install.packages("forecast")
library(forecast)

#fazendo previsoes com media movel

mediaMovel = ma(AirPassengers, order=12)
previsao = forecast(mediaMovel, h=12)
previsao
plot(previsao)

#previsão com arima
arima = auto.arima(AirPassengers)
previsao = forecast(arima, h=12)
previsao
plot(previsao)
