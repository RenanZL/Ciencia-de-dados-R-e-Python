from scipy.stats import norm

#media = 8, dp = 2
#prob de objeto < 6:
norm.cdf(6, 8, 2)

#objeto > 6:
norm.sf(6,8,2)
#ou
1 - norm.cdf(6, 8, 2)

#objeto < 6 ou > 10
norm.cdf(6,8,2) + norm.sf(10,8,2)

#objeto < 10 e objeto > 8
norm.cdf(10,8,2) - 0.5
#ou
norm.cdf(10,8,2) - norm.cdf(8,8,2)
