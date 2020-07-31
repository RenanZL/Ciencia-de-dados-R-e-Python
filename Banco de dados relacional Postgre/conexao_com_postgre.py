import psycopg2

conexao = psycopg2.connect(host="localhost",database="AulaSQL", user="postgres", password="123456", port=5432)

#cria um cursor
cursor = conexao.cursor()
#define consulta
consulta = "select * from clientes"
#executa
cursor.execute(consulta)

#recupera todos os registros
registros = cursor.fetchall()

#percorre os registros e imprime
for row in registros:
       print("Nome = ", row[1], )
       print("Estado = ", row[2])
       print("Status  = ", row[4], "\n")

#fecha conexão e cursor
cursor.close()
conexao.close()