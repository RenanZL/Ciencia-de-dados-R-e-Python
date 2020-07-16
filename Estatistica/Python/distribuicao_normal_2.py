from scipy import stats
from scipy.stats import norm
import matplotlib.pyplot as plt

#criando a distribuicao
dados = norm.rvs(size = 100)
#plotando a distribuicao
stats.probplot(dados, plot = plt)

#fazendo o teste de Shapiro
stats.shapiro(dados)
