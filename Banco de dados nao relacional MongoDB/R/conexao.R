install.packages("mongolite")
library(mongolite)

conexao = mongo(collection = "posts", db = "dbmidias", url = "mongodb://localhost")

dados = conexao$find()
class(dados)
dados

#busca
dados = conexao$find('{"nome":"Jos�"}')
dados

#fecha conex�o
rm(conexao)
gc()