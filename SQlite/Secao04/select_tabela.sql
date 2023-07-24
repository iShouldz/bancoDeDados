SELECT * FROM tipos_produto;

SELECT * FROM produtos;
	
UPDATE produtos SET descricao = 'Acer Aspire', preco = 2500.00 WHERE id = 1;


SELECT p.id AS 'ID', p.descricao AS 'Descrição do item', p.preco AS 'Valor unitario', t.descricao AS 'Categoria do Item'
	FROM produtos AS p, tipos_produto AS t
	WHERE p.codigo_tipo = t.id ORDER BY p.codigo_tipo;
	