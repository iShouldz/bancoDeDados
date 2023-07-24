CREATE TABLE tipos_produto(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL
);

CREATE TABLE produtos(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL,
	preco REAL NOT NULL,
	codigo_tipo INTEGER NOT NULL,
	FOREIGN KEY(codigo_tipo) REFERENCES tipos_produto(id)
);

