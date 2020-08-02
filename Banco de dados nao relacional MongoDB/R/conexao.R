install.packages("mongolite")
library(mongolite)

conexao = mongo(collection = "posts", db = "dbmidias", url = "mongodb://localhost")

dados = conexao$find()
class(dados)
dados

#busca
dados = conexao$find('{"nome":"José"}')
dados

#fecha conexão
rm(conexao)
gc()