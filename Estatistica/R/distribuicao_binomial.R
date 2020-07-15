#probabilidade de jgoar uma moeda 5 vezes e dar cara 3 vezes
dbinom(3,5,0.5)

# 4 sinais de 4 tempos, probabilidade de encontrar 3 verdes
dbinom(3,4,0.25)

# mesmo exemplo, porem somando as probabilidade de achar 0, 1,2 e 3 semaforos verdes
pbinom(3,4,0.25)

# chutar 12 questoes e acertar 7 com 4 alternativas
dbinom(7,12,0.25)