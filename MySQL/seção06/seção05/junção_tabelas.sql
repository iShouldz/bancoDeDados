CREATE DATABASE juncao;
USE juncao;

CREATE TABLE profissoes(
	id INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(60) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL, 
    id_profissao INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_profissao) REFERENCES profissoes(id)
);

CREATE TABLE consumidor(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL, 
    contato VARCHAR(50) NOT NULL, 
    endereco VARCHAR(100) NOT NULL, 
    cidade VARCHAR(100) NOT NULL, 
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes(cargo) VALUES ('Programador');
INSERT INTO profissoes(cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes(cargo) VALUES ('Suporte');
INSERT INTO profissoes(cargo) VALUES ('Gerente');

INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) VALUES ('Joao Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '8523-9711', 2);
INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '9874-5688', 3);
INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) VALUES ('Marcio Pirez', '1991-02-05', '6520-5688', 1);

INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brazil');
INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua de MarineFord, 47', 'Goiania', '985.456-87', 'Brazil');
INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Nunes', 'Rua de GrandLine, 47', 'São Paulo', '123.966-87', 'Brazil');

SELECT * FROM clientes;

DELETE FROM clientes WHERE id = 5;

# Junção de prod. cartesiano
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
    WHERE c.id_profissao = p.id;


