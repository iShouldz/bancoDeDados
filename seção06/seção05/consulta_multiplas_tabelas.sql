USE secao05;

#consultas em multiplas tabelas
SELECT * FROM produtos;
SELECT * FROM tipos_produto;

#Substitui o codigo pela descricao do produto na outra tabela, o where evita repetições erradas
SELECT p.codigo AS 'CÓDIGO', p.descricao AS 'DESCRICAO', p.preco AS 'PRECO', tp.descricao AS 'TIPO DO PRODUTO'
	FROM produtos AS p, tipos_produto AS tp
    # eu faço uma verificação de valores, pra listar a descricao do tipo do produto onde de fato o tipo de produto das duas tabelas se equivalerem
    WHERE p.codigo_tipo = tp.codigo;