USE farmacia;

-- Consultas complexas

-- compras
SELECT * FROM compras;
SELECT com.id, cli.nome, com.data_compra
	FROM compras AS com, clientes AS cli
    WHERE com.id_cliente = cli.id;
    
SELECT * FROM produtos_compra;

SELECT proc.id AS 'Produto compra', com.id AS 'Compra', prod.preco_venda AS 'Preco', proc.quantidade AS 'Quantidade', 
	(prod.preco_venda * proc.quantidade) AS 'TOTAL' 
	FROM produtos_compra AS proc, produtos AS prod, compras AS com
    WHERE com.id = proc.id_compra AND prod.id = proc.id_produto;