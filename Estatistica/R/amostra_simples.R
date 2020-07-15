#base de dados que vai ser usada para fazer a amostragem
iris
dim(iris)

#geração de 0 e 1 para determinar aleatoriamente quais dados farao parte da amostra
amostra = sample(c(0,1),150, replace=TRUE, prob=c(0.5,0.5))

#dados gerados, numero de zeros e de uns
amostra
length(amostra[amostra==1])
length(amostra[amostra==0])

# set.seed serve para que a geração pare de ser aleatoria e mantenha de acordo com a seed expecifica
set.seed(1234)
sample(c(100),1)