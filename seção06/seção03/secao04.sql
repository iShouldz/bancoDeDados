USE secao044;

CREATE TABLE tipos_produto(
	codigo INT NOT NULL AUTO_INCREMENT, 
    descricao VARCHAR(30) NOT NULL, 
    PRIMARY KEY(codigo)
);

CREATE TABLE produtos(
	codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    preco DECIMAL(8,2) NOT NULL, 
    codigo_tipo INT NOT NULL, 
    PRIMARY KEY(codigo),
    FOREIGN KEY(codigo_tipo) REFERENCES tipos_produto(codigo)
);
    
INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');
INSERT INTO tipos_produto (descricao) VALUES ('Apple');

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);

#DQL
SELECT * FROM tipos_produto;
SELECT codigo, descricao FROM tipos_produto;
SELECT codigo, descricao, preco, codigo_tipo FROM produtos;
#Alias
SELECT p.codigo AS cod, p.descricao AS descri, p.preco AS pre, p.codigo_tipo AS ctp FROM produtos as p;

#DML
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Notebook', '1200', 1);
SELECT * FROM produtos;
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('Macbook', '1200', 1);

#AO USAR O UPDATE, NUNCA ESQUECER O FILTRO DO WHERE, POIS SEM TEREMOS TODOS OS PRODUTOS SENDO ATUALIZADOS.
UPDATE produtos set codigo_tipo = 3 WHERE codigo = 6;
UPDATE produtos set descricao = 'Impressora Laser', preco = '700' WHERE codigo=4;

DELETE FROM produtos WHERE codigo = 4;

ALTER TABLE produtos ADD loja VARCHAR(50) NOT NULL;



