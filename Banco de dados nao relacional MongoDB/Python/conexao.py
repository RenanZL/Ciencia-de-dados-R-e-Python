from pymongo import MongoClient

#conexão local padrão
cliente = MongoClient('mongodb://localhost:27017/')
#banco dbmidias
db = cliente.dbmidias
#coleção posts
conexao = db.posts

#um documento
print(conexao.find_one())

print(conexao.find_one({"nome":"Maria Silva"}))

#todos
for conexao in conexao.find():
    print(conexao)

cliente.close()