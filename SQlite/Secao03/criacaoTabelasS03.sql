CREATE TABLE produtos(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL, 
	preco REAL NOT NULL, 
	id_tipo_produto INTEGER NOT NULL,
	FOREIGN KEY(id_tipo_produto) REFERENCES tipos_produtos(id)
);

CREATE TABLE pacientes(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL, 
	endereco TEXT NOT NULL, 
	bairro TEXT NOT NULL, 
	cidade TEXT NOT NULL, 
	estado TEXT NOT NULL, 
	cep TEXT NOT NULL, 
	data_nascimento TEXT NOT NULL 
);

CREATE TABLE professor(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	telefone INTEGER NOT NULL,
	nome TEXT NOT NULL
);

CREATE TABLE turma(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	capacidade INTEGER NOT NULL,
	id_professor INTEGER NOT NULL,
	FOREIGN KEY(id_professor) REFERENCES professor(id)
);