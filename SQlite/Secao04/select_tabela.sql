SELECT * FROM tipos_produto;

SELECT * FROM produtos;

SELECT p.id AS 'ID', p.descricao AS 'Descrição do item', p.preco AS 'Valor unitario', t.descricao AS 'Categoria do Item'
	FROM produtos AS p, tipos_produto AS t
	WHERE p.codigo_tipo = t.id;