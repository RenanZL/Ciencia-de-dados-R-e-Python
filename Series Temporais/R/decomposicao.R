#decompondo dados
dec = decompose(AirPassengers)
dec

#sazonal
dec$seasonal

#tendencia
dec$trend

#aleatorio
dec$random

plot(dec$seasonal)
plot(dec$trend)
plot(dec$random)
