from scipy.stats import poisson

# média de 2 acidentes por dia
# qual a prob de ocorrerem 3?
poisson.pmf(3, 2)
# e de ocorrerem 3 ou menos?
poisson.cdf(3, 2)
# de ocorrerem mais de 3?
1 - poisson.cdf(3, 2)
#ou
poisson.sf(3, 2)
