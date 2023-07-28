import sqlite3

def conectar():
    """
    Função para conectar ao servidor
    """
    conn = sqlite3.connect('psqlite3.shz')
    conn.execute("""
    CREATE TABLE IF NOT EXISTS produtos(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        nome TEXT NOT NULL,
        preco REAL NOT NULL,
        estoque INTEGER NOT NULL
    );
    """)
    return conn
def desconectar(conn):
    """ 
    Função para desconectar do servidor.
    """
    conn.close()


def listar():
    """
    Função para listar os produtos
    """
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM produtos")
    produtos = cursor.fetchall()

    if len(produtos) > 0:
        for produto in produtos:
            print(f"ID: {produto[0]}")
            print(f"PRODUTO: {produto[1]}")
            print(f"PRECO: {produto[2]}")
            print(f"ESTOQUE: {produto[3]}")
    else:
        print("Tabela vazia")
    desconectar(conn)

def inserir():
    """
    Função para inserir um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: "))
    estoque = int(input("Estoque do produto: "))

    cursor.execute(f"INSERT INTO produtos (nome, preco, estoque) VALUES ('{nome}', {preco}, {estoque})")
    conn.commit()

    if cursor.rowcount == 1:
        print("INSERÇÃO COM SUCESSO")
    else:
        print("FALHA NA INSERÇÃO")
    desconectar(conn)
def atualizar():
    """
    Função para atualizar um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    id = input("ID do produto:")
    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: "))
    estoque = int(input("Estoque do produto: "))

    cursor.execute(f"UPDATE produtos SET nome='{nome}', preco={preco}, estoque={estoque} WHERE id={id}")
    conn.commit()

    if cursor.rowcount == 1:
        print("ATUALIZAÇÃO COM SUCESSO")
    else:
        print("FALHA NA ATUALIZAÇÃO")
    desconectar(conn)
def deletar():
    """
    Função para deletar um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    id = input("ID do produto:")

    cursor.execute(f"DELETE FROM produtos WHERE id={id}")
    conn.commit()

    if cursor.rowcount == 1:
        print("DELEÇÃO COM SUCESSO")
    else:
        print("FALHA NA DELEÇÃO")
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