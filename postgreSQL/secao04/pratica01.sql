-- CREATE TABLE tipos_produto(
	-- id SERIAL PRIMARY KEY, 
	-- descricao CHARACTER VARYING(30) NOT NULL
-- );

-- CREATE TABLE produtos(
	-- id SERIAL PRIMARY KEY,
	-- descricao CHARACTER VARYING(30) NOT NULL,
	-- preco MONEY NOT NULL,
	-- codigo_tipo INT REFERENCES tipos_produto(id)
-- );


-- INSERT INTO tipos_produto(descricao) VALUES ('Computador');
-- INSERT INTO tipos_produto(descricao) VALUES ('Impressora');

-- INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Desktop', 1200, 1);
-- INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Laptop', 1800, 1);
-- INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Imp. JatoTinta', 1200, 2);
-- INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Imp. Laser', 1200, 2);

	
UPDATE produtos SET descricao = 'celular' WHERE id = 1;	
UPDATE tipos_produto SET descricao = 'Eletronicos' WHERE id = 2;

DELETE FROM produtos where id = 1;
-- SELECT * FROM produtos;
SELECT p.id, p.descricao, p.preco, t.descricao AS descrição_do_tipo, t.categoria
	FROM produtos AS p, tipos_produto AS t
	WHERE p.codigo_tipo = t.id;

-- ALTER TABLE tipos_produto ADD categoria
-- SELECT * FROM tipos_produto;