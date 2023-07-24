CREATE DATABASE agregacao;
USE agregacao;

CREATE TABLE categorias(
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(60) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(60) NOT NULL, 
    preco_venda DECIMAL(8,2) NOT NULL, 
    preco_custo DECIMAL(8,2) NOT NULL, 
    id_categoria INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO categorias(nome) VALUES ('Material Escolar');
INSERT INTO categorias(nome) VALUES ('Acessorio Informatica');
INSERT INTO categorias(nome) VALUES ('Material Escritorio');
INSERT INTO categorias(nome) VALUES ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', '5.45', '2.30', 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', '1.20', '0.45', 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive', '120.54', '32.30', 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', '17.45', '4.30', 2);

SELECT * FROM produtos;
SELECT * FROM categorias;

SELECT p.id, p.descricao, p.preco_venda, p.preco_custo, c.nome
	FROM produtos AS p, categorias AS c
    WHERE p.id_categoria = c.id;

# Funções de agregações

SELECT MAX(preco_venda) FROM produtos;

SELECT MIN(preco_venda) FROM produtos;

SELECT AVG(preco_venda) FROM produtos;

SELECT ROUND(AVG(preco_venda), 2) FROM produtos;

SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 1;

#agrupo mostrando a o id e qual o maior preco de venda dessa categoria
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;

SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;