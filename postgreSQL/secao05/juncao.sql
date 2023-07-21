--CREATE TABLE profissoes(
	--id SERIAL PRIMARY KEY,
	--cargo CHARACTER VARYING(60) NOT NULL
--);

--CREATE TABLE clientes(
--	id SERIAL PRIMARY KEY,
--	nome CHARACTER VARYING(60) NOT NULL,
--	data_nascimento DATE NOT NULL,
--	telefone CHARACTER VARYING(10) NOT NULL, 
--	id_profissao INT REFERENCES profissoes(id) NOT NULL
--);

--CREATE TABLE consumidor(
--	id SERIAL PRIMARY KEY,
--	nome CHARACTER VARYING(50) NOT NULL,
--	contato CHARACTER VARYING(50) NOT NULL,
--	endereco CHARACTER VARYING(50) NOT NULL, 
---	cidade CHARACTER VARYING(50) NOT NULL, 
--	cep CHARACTER VARYING(20) NOT NULL ,
--	pais CHARACTER VARYING(50) NOT NULL
--);

--INSERT INTO profissoes (cargo) VALUES ('Programador');
--INSERT INTO profissoes (cargo) VALUES ('AdS');
--INSERT INTO profissoes (cargo) VALUES ('Suporte');
--INSERT INTO profissoes (cargo) VALUES ('Gerente');

--INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) 
--	VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
--INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) 
--	VALUES ('Simone Eloá Antônia Castro', '1981-06-15', '1234-5688', 2);
--INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) 
--	VALUES ('João Pereira', '1981-06-15', '5424-5688', 3);
--INSERT INTO clientes(nome, data_nascimento, telefone, id_profissao) 
--	VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
	
--INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais)
--	VALUES ('Alfredo', 'Maria', 'Rua da Paz', 'São Paulo', '123.852-96', 'Brasil');
--INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais)
--	VALUES ('Jorge', 'Lucas', 'Rua da Aurora', 'Tocantis', '741.852-96', 'Brasil');
--INSERT INTO consumidor(nome, contato, endereco, cidade, cep, pais)
--	VALUES ('Joaquina', 'Italo', 'Rua da Mortuaria', 'Rio de Janeiro', '123.000-96', 'Brasil');

--Produto cartesiano
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
	WHERE c.id_profissao = p.id;

--SELECT * FROM clientes;

