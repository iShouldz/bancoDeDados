INSERT INTO tipos_produtos(descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos(descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos(descricao) VALUES ('Diversos');

INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('Notebook DELL', 2345.67, 1);
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('Impr. Jato de Tinta', 456.00, 2);
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('Mouse Wireless', 45, 3);

INSERT INTO pacientes(nome, endereco, bairro, cidade, estado, cep, data_nascimento)
	VALUES ('Angelina Jolie', 'Rua da Paz, 44', 'Nova Lima', 'Santos', 'SP', '121212322', '1978-04-24');
	
INSERT INTO professor(telefone, nome) VALUES (12345, 'Fernando Perez');

INSERT INTO turma(capacidade, id_professor) VALUES (50, 1);