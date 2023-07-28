import psycopg2


def conectar():
    """
    Função para conectar ao servidor
    """
    try:
        conn = psycopg2.connect(
            database='ppostgresql',
            host='localhost',
            user='shz',
            password='senha'
        )
        return conn
    except psycopg2.Error as e:
        print(f'Erro em {e}')

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
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM produtos')
    produtos = cursor.fetchall()

    if len(produtos) > 0:
        for produto in produtos:
            print(f"id: {produto[0]}\nProduto: {produto[1]}\nPreço: {produto[2]}\nEstoque: {produto[3]}")
    else:
        print("Tabela vazia")
    desconectar(conn)
def inserir():
    """
    Função para inserir um produto
    """  
    conn = conectar()
    cursor = conn.cursor()

    nome = input('Nome do produto: ')
    preco = input('Preço do produto: ')
    estoque = input('Quantidade em estoque: ')

    cursor.execute(f"INSERT INTO produtos (nome, preco, estoque) VALUES ('{nome}', {preco}, {estoque})")
    conn.commit()

    if cursor.rowcount == 1:
        print("Produto inserido com sucesso")
    else:
        print("Falha na inserção")

def atualizar():
    """
    Função para atualizar um produto
    """
    conn = conectar()
    cursor = conn.cursor()

    codigo = int(input('Codigo do produto: '))
    nome = input('Nome do produto: ')
    preco = float(input('Preço do produto: '))
    estoque = int(input('Quantidade em estoque: '))

    cursor.execute(f"UPDATE produtos SET nome='{nome}', preco={preco}, estoque={estoque} WHERE id={codigo}")
    conn.commit()

    if cursor.rowcount == 1:
        print("Atualização com sucesso")
    else:
        print("Falha na atualização")
def deletar():
    """
    Função para deletar um produto
    """  
    print('Deletando produto...')

def menu():
    """
    Função para gerar o menu inicial
    """
    print('=========Gerenciamento de Produtos==============')
    print('Selecione uma opção: ')
    print('1 - Listar produtos.')
    print('2 - Inserir produtos.')
    print('3 - Atualizar produto.')
    print('4 - Deletar produto.')
    opcao = int(input())
    if opcao in [1, 2, 3, 4]:
        if opcao == 1:
            listar()
            conectar()
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
