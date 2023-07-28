import pyrebase

def conectar():
    """
    Função para conectar ao servidor
    """
    config = {
        "apiKey": "BFf-4-oOSQwbZAFs4ZX5OAgkrlDSnEN015G0veimx7iCWJ4e8XhZM7PSujHfN4ZygtyF-q-daToQTu797X-_PsQ",
        "authDomain": "https://shzsun1-default-rtdb.firebaseio.com/",
        "databaseURL": "https://shzsun1-default-rtdb.firebaseio.com/",
        "storageBucket": "shzsun1.appspot.com"
    }

    conn = pyrebase.initialize_app(config)
    db = conn.database()
    return db
def desconectar():
    """ 
    Função para desconectar do servidor.
    """

def listar():
    """
    Função para listar os produtos
    """
    db = conectar()
    produtos = db.child("produtos").get()

    if produtos.val():
        for produto in produtos.each():
            print(f"ID: {produto.key()}")
            print(f"PRODUTO: {produto.val()['nome']}")
            print(f"PRODUTO: {produto.val()['preco']}")
            print(f"PRODUTO: {produto.val()['estoque']}")
    else:
        print("TABELA VAZIA")
def inserir():
    """
    Função para inserir um produto
    """
    db = conectar()
    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: "))
    estoque = int(input("Estoque do produto: "))

    produtos = {"nome": nome, "preco": preco, "estoque": estoque}
    res = db.child("produtos").push(produtos)
    if 'name' in res:
        print("INSERÇÃO REALIZADA COM SUCESSO")
    else:
        print("FALHA NA INSERÇÃO")
def atualizar():
    """
    Função para atualizar um produto
    """
    db = conectar()
    _id = input("Chave do produto: ")
    produto = db.child('produtos').child(_id).get()
    if produto.val():
        nome = input("Nome do produto: ")
        preco = float(input("Valor do produto: "))
        estoque = int(input("Quantidade em estoque: "))

        novo_produto = {"nome": nome, "preco": preco, "estoque": estoque}
        db.child('produtos').child(_id).update(novo_produto)
        print("ATUALIZADO COM SUCESSO")
    else:
        print('FALHA NA ATUALIZAÇÃO')
def deletar():
    """
    Função para deletar um produto
    """
    db = conectar()
    _id = input("Id do produto: ")
    produto = db.child('produtos').child(_id).get()
    if produto.val():
        db.child('produtos').child(_id).remove()
        print("DELEÇÃO COM SUCESSO")
    else:
        print("FALHA NA DELEÇÃO")
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
