#data de inicio da serie
start(AirPassengers)
#data de fim da serie
end(AirPassengers)

plot(AirPassengers)
#grafico por mês
monthplot(AirPassengers)

#ver apenas o ano de 1960
subst = window(AirPassengers, start=c(1960,1), end=c(1960,12))
subst
plot(subst)