install.packages("RPostgreSQL")
library("RPostgreSQL")

#conectando com o banco de dados
conexao = dbConnect("PostgreSQL", dbname="AulaSQL", host="localhost", port=5432, user="postgres", password="adm")

#consulta SQL
sql = " SELECT QUANTIDADE, VALORTOTAL, PRODUTO, TOTAL FROM ITENSVENDA  IV
      INNER JOIN VENDAS V ON (IV.IDVENDA = V.IDVENDA) 
      INNER JOIN PRODUTOS P ON (IV.IDPRODUTO = P.IDPRODUTO)"
vendas = dbGetQuery(conexao, sql)

#dados retornados
class(vendas)
dim(vendas)
head(vendas)

#encerra a conexão
dbDisconnect(conexao)