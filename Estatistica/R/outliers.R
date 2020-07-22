#com outliers
boxplot(iris$Sepal.Width)
#sem outliers
boxplot(iris$Sepal.Width, outline=F)
#verificar os outliers
boxplot.stats(iris$Sepal.Width)$out

install.packages('outliers')
library(outliers)

#procura outliers superiores
outlier(iris$Sepal.Width)
#procura outliers inferiores
outlier(iris$Sepal.Width, opposite = T)
