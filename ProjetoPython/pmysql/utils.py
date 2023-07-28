import MySQLdb

def conectar():
    """
    Função para conectar ao servidor
    """
    try:
        conn = MySQLdb.connect(
            db='pmysql',
            host='localhost',
            user='shz',
            passwd='shouldz'
        )
        return conn
    except MySQLdb.Error as e:
        print(f"Erro na conexão ao MySQL Server {e}")

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
        print("Listando produtos: ")
        for produto in produtos:
            print(f"ID: {produto[0]}\nNOME: {produto[1]}\nPRECO: {produto[2]}, ESTOQUE: {produto[3]}\n")
    else:
        print("Não existe produtos cadastrados")
    desconectar(conn)

def inserir():
    """
    Função para inserir um produto
    """  
    print('Inserindo produto...')

def atualizar():
    """
    Função para atualizar um produto
    """
    print('Atualizando produto...')

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
