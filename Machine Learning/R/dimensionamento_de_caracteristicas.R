#padronizando dados
iris_padrao = scale(iris[,1:4])
iris_padrao

normaliza = function(x){
  return((x-min(x))/(max(x)-min(x)))
}

#normaliza��o
iris_normalizado = normaliza(iris[,1:4])
iris_normalizado

#comparando padroniza��o e normaliza��o
boxplot(iris[,1:4], main="Dados Originais")
boxplot(iris_padrao[,1:4], main="Dados Padronizados")
boxplot(iris_normalizado[,1:4], main="Dados Normalizados")