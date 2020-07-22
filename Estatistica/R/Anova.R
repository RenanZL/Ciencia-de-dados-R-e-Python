base = read.csv(file.choose(), se=";", header = T)
fix(base)

boxplot(base$Horas ~ base$Remedio)

#analise de variança de 2 variaveis
an = aov(Horas ~ Remedio, data=base)
summary(an)

#analise de variança de 3 variaveis ou mais
an = aov(Horas ~ Remedio * Sexo, data=base)
summary(an)

#analise de tukey
tukey = TukeyHSD(an)
tukey

plot(tukey)
