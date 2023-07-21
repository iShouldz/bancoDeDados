-- CREATE DATABASE subconsulta;

--CREATE TABLE escritorios(
--	id SERIAL PRIMARY KEY,
--	pais CHARACTER VARYING(30) NOT NULL
--);

--CREATE TABLE funcionarios(
--	id SERIAL PRIMARY KEY,
--	nome CHARACTER VARYING(20) NOT NULL,
--	sobrenome CHARACTER VARYING(20) NOT NULL,
--	id_escritorio INT REFERENCES escritorios(id) NOT NULL
--);

--CREATE TABLE PAGAMENTOS(
--	id SERIAL PRIMARY KEY,
--	id_funcionario INT REFERENCES funcionarios(id) NOT NULL, 
--	salario DECIMAL(8,2) NOT NULL, 
--	data DATE NOT NULL
--);



--INSERT INTO escritorios(pais) VALUES ('Brasil');
--INSERT INTO escritorios(pais) VALUES ('EUA');
--INSERT INTO escritorios(pais) VALUES ('Alemanha');
--INSERT INTO escritorios(pais) VALUES ('França');

--INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Pedro', 'Souza', 1);
--INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Sandra', 'Rubin', 2);
--INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Mihalk', 'Falcon', 3);
--INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Oliver', 'Gloçan', 4);

--INSERT INTO pagamentos(id_funcionario, salario, data) VALUES (1, '5387.55', '2019-03-17');
--INSERT INTO pagamentos(id_funcionario, salario, data) VALUES (2, '9458.55', '2019-03-17');
--INSERT INTO pagamentos(id_funcionario, salario, data) VALUES (3, '4669.55', '2019-03-17');
--INSERT INTO pagamentos(id_funcionario, salario, data) VALUES (4, '2770.55', '2019-03-17');

SELECT nome, sobrenome FROM funcionarios WHERE id_escritorio IN 
	(SELECT id FROM escritorios WHERE pais = 'Brasil');
	
	
	