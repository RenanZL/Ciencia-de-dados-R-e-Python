# media 75 amostra 9 dp 10 graus de liberdade = 8
media = 75
amostra = 9
graus_liberdade = amostra-1
dp = 10
t = (80 - media)/dp*(amostra**(0.5))
#prob de < 80:
pt(t,graus_liberdade)
#prob de > 80:
pt(t, graus_liberdade, lower.tail = F)
#ou
1 - pt(t,graus_liberdade)
