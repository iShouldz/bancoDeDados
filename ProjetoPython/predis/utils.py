import redis

def gerar_id():
    try:
        conn = conectar()
        chave = conn.get('chave')
        if chave:
            chave = conn.incr('chave')
            return chave
        else:
            conn.set('chave', 1)
            return 1
    except redis.exceptions.ConnectionError as e:
        print("ERRO DE CHAVE")
def conectar():
    """
    Função para conectar ao servidor
    """
    conn = redis.Redis(host='localhost', port=6379)
    return conn

def desconectar(conn):
    """ 
    Função para desconectar do servidor.
    """
    conn.connection_pool.disconnect()

def listar():
    """
    Função para listar os produtos
    """
    conn = conectar()
    try:
        dados = conn.keys(pattern='produtos:*')
        print(dados)

        if len(dados) > 0:
            for chave in dados:
                produto = conn.hgetall(chave)
                print(f"ID:         {str(chave, 'utf-8', 'ignore')}")
                print(f"PRODUTO:    {str(produto[b'nome'], 'utf-8', 'ignore')}")
                print(f"PREÇO:      {str(produto[b'preco'], 'utf-8', 'ignore')}")
                print(f"ESTOQUE:    {str(produto[b'estoque'], 'utf-8', 'ignore')}")
        else:
            print("TABELA VAZIA")
    except redis.exceptions.ConnectionError as e:
        print(f"ERRO NO REDIS {e}")
    desconectar(conn)
def inserir():
    """
    Função para inserir um produto
    """
    conn = conectar()

    nome = input('Nome do produto: ')
    preco = input('Valor do produto: ')
    estoque = input('Quantidade em estoque: ')

    produto = {"nome": nome, "preco": preco, "estoque": estoque}
    chave = f'produtos{gerar_id()}'

    try:
        res = conn.hmset(chave, produto)

        if res:
            print("INSERCAO COM SUCESSO")
        else:
            print("FALHA NA INSERCAO")
    except redis.exceptions.ConnectionError as e:
        print("NÃO FOI POSSIVEL INSERIR")
    desconectar(conn)
def atualizar():
    """
    Função para atualizar um produto
    """
    conn = conectar()

    chave = input("Chave do produto: ")
    nome = input('Nome do produto: ')
    preco = input('Valor do produto: ')
    estoque = input('Quantidade em estoque: ')

    produto = {"nome": nome, "preco": preco, "estoque": estoque}

    try:
        res = conn.hmset(chave, produto)

        if res:
            print("ATUALIZAÇÃO COM SUCESSO")
    except redis.exceptions.ConnectionError as e:
        print("NÃO FOI POSSIVEL ATUALIZAR")
    desconectar(conn)

def deletar():
    """
    Função para deletar um produto
    """
    conn = conectar()

    chave = input("Chave do produto: ")
    try:
        res = conn.delete(chave)

        if res == 1:
            print("DELEÇÃO COM SUCESSO")
        else:
            print("NÃO EXISTE PRODUTO COM ESSA CHAVE")
    except redis.exceptions.ConnectionError as e:
        print("NÃO FOI POSSIVEL DELETAR")
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