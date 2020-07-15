from scipy.stats import binom

#probabilidade de se jogar uma moeda 5 vezes e dar cara 3 vezes
binom.pmf(3, 5, 0.5)

# sinal de 4 tempos, passar por 4 sinais e encontrar 3 verdes
binom.pmf(3, 4, 0.25)

# sinal de 2 tempos, passar por 6 sinais e encontrar 2 verdes
binom.pmf(2, 6, 0.5)

# se o exemplo anterios fosse cumulativo:
binom.cdf(2, 6, 0.5)

#probabilidade de acertar 7 questoes de 12 com 4 alternativas
binom.pmf(7,12,0.25)
