#distribuição normal de media = 8 e dp = 2
#qual a chance de achar um objeto < 6
pnorm(6,8,2)
#qual a chance de achar um objeto > 6
pnorm(6,8,2, lower.tail=F)
#outra forma de resolver:
1 - pnorm(6,8,2)
#mobjeto < 6 e objeto > 10
pnorm(6,8,2) + pnorm(10,8,2, lower.tail = F)
#objeto < 10 e objeto > 8
pnorm(10,8,2) - pnorm(8,8,2)
#outra maneira:
pnorm(10,8,2) - 0.5
