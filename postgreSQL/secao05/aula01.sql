--CREATE DATABASE secao05;

--CREATE TABLE tipos_produto(
	--id SERIAL PRIMARY KEY,
--	descricao CHARACTER VARYING (50) NOT NULL
--);

--CREATE TABLE produtos(
--	id SERIAL PRIMARY KEY,
--	descricao CHARACTER VARYING (50) NOT NULL, 
--	preco MONEY NOT NULL,
--	id_tipo INT REFERENCES tipos_produto(id)
--);

--INSERT INTO tipos_produto(descricao) VALUES ('Computador');
--INSERT INTO tipos_produto(descricao) VALUES ('Impressora');

--INSERT INTO produtos(descricao, preco, id_tipo) VALUES ('Computador', 2500, 1);
--INSERT INTO produtos(descricao, preco, id_tipo) VALUES ('Impressora Laser', 600, 2);
--INSERT INTO produtos(descricao, preco, id_tipo) VALUES ('Computador PREDATOR', 3800, 1);

UPDATE produtos SET descricao = 'Desktop PRO' WHERE id = 1;

SELECT * FROM produtos;
SELECT p.id, p.descricao, p.preco, t.descricao
	FROM produtos AS p, tipos_produto AS t
	WHERE p.id_tipo = t.id AND p.preco >= '2100';
