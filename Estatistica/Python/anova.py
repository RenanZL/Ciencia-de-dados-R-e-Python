import pandas as pd
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.multicomp import MultiComparison

base = pd.read_csv('anova.csv', sep=';')

base.boxplot(by = 'Remedio', grid = False)

modelo1 = ols("Horas ~ Remedio", data =  base).fit()
resultado1 = sm.stats.anova_lm(modelo1)

modelo2 = ols("Horas ~ Remedio * Sexo", data =  base).fit()
resultado2 = sm.stats.anova_lm(modelo2)

mc = MultiComparison(base['Horas'], base['Remedio'])
resultado_teste = mc.tukeyhsd()
print(resultado_teste)

resultado_teste.plot_simultaneous()
