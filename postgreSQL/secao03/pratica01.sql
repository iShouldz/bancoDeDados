--CREATE DATABASE secao03;

-- Dado serial é o mesmo que falar que é int e auto increment
-- CREATE TABLE tipo_produto(
	-- id SERIAL PRIMARY KEY,
	-- descricao CHARACTER VARYING(50) NOT NULL
-- );

-- CREATE TABLE produtos(
	-- id SERIAL PRIMARY KEY,
	-- descricao CHARACTER VARYING(50) NOT NULL, 
	-- preco MONEY NOT NULL,
	-- id_tipo_produto INT REFERENCES tipo_produto(id) NOT NULL
-- );

--CREATE TABLE pacientes(
	--id SERIAL PRIMARY KEY,
	--nome CHARACTER VARYING(50) NOT NULL,
	--endereco CHARACTER VARYING(50) NOT NULL,
	--bairro CHARACTER VARYING(40) NOT NULL,
	--cidade CHARACTER VARYING(40) NOT NULL,
	--estado CHARACTER VARYING(2) NOT NULL,
	--cep CHARACTER VARYING(9) NOT NULL,
	--data_nascimento DATE NOT NULL
--);

CREATE TABLE professor(
	id SERIAL PRIMARY KEY,
	telefone INT NOT NULL,
	nome CHARACTER VARYING(80) NOT NULL
);

CREATE TABLE turma(
	id SERIAL PRIMARY KEY, 
	capacidade INT NOT NULL,
	id_professor INT REFERENCES professor(id) NOT NULL
);



