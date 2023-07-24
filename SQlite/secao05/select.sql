SELECT * FROM produtos;

SELECT p.id, p.descricao, p.preco, t.descricao	
	FROM produtos AS p, tipos_produto AS t
	WHERE p.codigo_tipo = t.id AND p.preco > 1100;
	
