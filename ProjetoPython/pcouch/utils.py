import socket
import couchdb
def conectar():
    """
    Função para conectar ao servidor
    """
    user = 'admin'
    password = '12345'
    conn = couchdb.Server(f'https://{user}:{password}@localhost:5984')
    banco = 'pcouch'
    if banco in conn:
        db = conn[banco]
        return db
    else:
        try:
            db = conn.create(banco)
            return db
        except socket.gaierror as e:
            print(f"ERRO AO CONECTAR AO SERVIDOR {e}")
        except couchdb.http.Unauthorized as f:
            print(f'ERRO DE PERMISSÃO {f}')
        except ConnectionRefusedError as g:
            print(f'NÃO POSSIVEL CONECTAR AO SERVIDOR {g}')
def desconectar():
    """ 
    Função para desconectar do servidor.
    """


def listar():
    """
    Função para listar os produtos
    """
    db = conectar()
    if db:
        if db.info()['doc_count'] > 0:
            for doc in db:
                print(f"ID:         {db[doc]['_id']}")
                print(f"REV:        {db[doc]['_rev']}")
                print(f"PRODUTO:    {db[doc]['nome']}")
                print(f"PREÇO:      {db[doc]['preco']}")
                print(f"ESTOQUE:    {db[doc]['estoque']}")
        else:
            print("TABELA VAZIA")
    else:
        print("NÃO FOI POSSIVEL CONECTAR AO SERVER")

def inserir():
    """
    Função para inserir um produto
    """  
    db = conectar()

    if db:
        nome = input("Nome do produto: ")
        preco = input("Preço do produto: ")
        estoque = input("Estoque do produto: ")

        produto = {"nome": nome, "preco": preco, "estoque": estoque}

        res = db.save(produto)
        if res:
            print("INSERIDO COM SUCESSO")
        else:
            print("FALHA AO INSERIR")
    else:
        print("NÃO FOI POSSIVEL CONECTAR")

def atualizar():
    """
    Função para atualizar um produto
    """
    db = conectar()

    if db:
        chave = input("ID do produto: ")

        try:
            doc = db[chave]

            nome = input("Nome do produto: ")
            preco = input("Preço do produto: ")
            estoque = input("Estoque do produto: ")

            doc['nome'] = nome
            doc['preco'] = preco
            doc['estoque'] = estoque
            db[doc.id] = doc
            print("PRODUTO ATUALIZADO COM SUCESSO")
        except couchdb.http.ResourceNotFound as e:
            print("PRODUTO INEXISTENTE")
    else:
        print("FALHA AO CONECTAR AO SERVIDOR")


def deletar():
    """
    Função para deletar um produto
    """  
    db = conectar()
    if db:
        _id = input("Id do produto: ")
        try:
            db.delete(db[_id])
            print("PRODUTO DELETADO COM SUCESSO")
        except couchdb.http.ResourceNotFound as e:
            print("NÃO FOI POSSIVEL DELETAR O PRODUTO")
    else:
        print("FALHA AO CONECTAR")

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