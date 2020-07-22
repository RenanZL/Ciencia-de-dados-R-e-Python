#criando a base de dados
base = matrix(c(19,6,43,32), nrow=2, byrow=T)
rownames(base) = c("Masculino", "Feminino")
colnames(base) = c("Assiste", "Não assiste")
fix(base)
chisq.test(base)
#como p < 0.5 , rejeitamos a hipotese nula, mostrando que a diferença dos dados para o ideal é apenas o acaso