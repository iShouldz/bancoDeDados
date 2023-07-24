USE farmacia;

-- Atualizando dados
SELECT * FROM tipo_produto;

UPDATE tipo_produto SET nome='Bijuterias' WHERE id = 3;

SELECT * FROM produtos;

UPDATE produtos set preco_venda = 4.16, id_tipo = 1, id_fabricante = 1 WHERE id = 2;