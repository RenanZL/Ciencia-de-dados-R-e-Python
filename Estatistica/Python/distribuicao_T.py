from scipy.stats import t

#media = 75 amostra = 9 dp = 10 prob maior e menos que 80
media = 75
amostra = 9
graus_liberdade = amostra - 1
dp = 10
valor_t = (80 - media)/dp*(amostra**0.5) 

#< 80
t.cdf(valor_t,graus_liberdade)
#>80
t.sf(valor_t,graus_liberdade)
#ou
1 - t.cdf(valor_t,graus_liberdade)
