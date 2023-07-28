from pymongo import MongoClient, errors
from bson.objectid import ObjectId
def conectar():
    """
    Função para conectar ao servidor
    """
    conn = MongoClient('localhost', 27017)
    return conn

def desconectar(conn):
    """ 
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()

def listar():
    """
    Função para listar os produtos
    """
    conn = conectar()
    db = conn.pmongo
    try:
        if db.produtos.count_documents({}) > 0:
            produtos = db.produtos.find()
            for produto in produtos:
                print(f"ID: {produto['_id']}")
                print(f"PRODUTO: {produto['nome']}")
                print(f"PREÇO: {produto['preco']}")
                print(f"ESTOQUE: {produto['estoque']}")
        else:
            print("Tabela vazia")
    except errors.PyMongoError as e:
        print("Erro ao acessar o BD")
    desconectar(conn)
def inserir():
    """
    Função para inserir um produto
    """
    conn = conectar()
    db = conn.pmongo
    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: "))
    estoque = int(input("Estoque do produto: "))

    try:
        db.produtos.insert_one(
            {
                "nome": nome,
                "preco": preco,
                "estoque": estoque
            }
        )
        print("Inserção com sucesso")
    except errors.PyMongoError as e:
        print(f"Erro ao inserir {e}")
    desconectar(conn)
def atualizar():
    """
    Função para atualizar um produto
    """
    conn = conectar()
    db = conn.pmongo
    id = input("id: ")
    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: "))
    estoque = int(input("Estoque do produto: "))

    try:
        if db.produtos.count_documents({}) > 0:
            res = db.produtos.update_one(
                {"_id": ObjectId(id)},
                {
                    "$set": {
                        "nome": nome,
                        "preco": preco,
                        "estoque": estoque
                    }
                }
            )
            if res.modified_count == 1:
                print("Atualizado com sucesso")
            else:
                print("Falha ao atualizar")
        else:
            print("Nada para ser atualizado")
    except errors.PyMongoError as e:
        print(f"Erro ao atualizar {e}")
    desconectar(conn)

def deletar():
    """
    Função para deletar um produto
    """
    conn = conectar()
    db = conn.pmongo
    id = input("id: ")
    try:
        if db.produtos.count_documents({}) > 0:
            res = db.produtos.delete_one(
                {"_id": ObjectId(id)},

            )
            if res.deleted_count > 0:
                print("Deletado com sucesso")
            else:
                print("Falha ao Deletar")
        else:
            print("Nada para ser deletado")
    except errors.PyMongoError as e:
        print(f"Erro ao deletar {e}")
    desconectar(conn)

def frontend():
    print('=========Gerenciamento de Produtos==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')
    print('0 - Encerrar querry')

def menu():
    """
    Função para gerar o menu inicial
    """
    frontend()
    opcao = int(input())
    while opcao != 0:
        if opcao in [1, 2, 3, 4]:
            if opcao == 1:
                listar()
            elif opcao == 2:
                inserir()
            elif opcao == 3:
                atualizar()
            elif opcao == 4:
                deletar()
            else:
                print('Opção inválida')
        else:
            print('Opção inválida')
        frontend()
        opcao = int(input())