INSERT INTO atores(nome) VALUES ('Brad Pitt');
INSERT INTO atores(nome) VALUES ('Angelina Jolie');
INSERT INTO atores(nome) VALUES ('Felicty Jones');

INSERT INTO generos(genero) VALUES ('Comedia');
INSERT INTO generos(genero) VALUES ('Terror');
INSERT INTO generos(genero) VALUES ('Suspense');

INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Tomb Raider', 3, 8.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Star Wars', 2, 12.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Loucademia de Policia', 1, 5.99);

INSERT INTO atores_filme(id_filme, id_ator, personagem) VALUES (1, 2, 'Lara Croft');
INSERT INTO atores_filme(id_filme, id_ator, personagem) VALUES (2, 3, 'Comandante do Imperio');
INSERT INTO atores_filme(id_filme, id_ator, personagem) VALUES (3, 1, 'Soldado Scoot');

INSERT INTO dvds(id_filme, quantidade) VALUES (1, 1);
INSERT INTO dvds(id_filme, quantidade) VALUES (2, 2);
INSERT INTO dvds(id_filme, quantidade) VALUES (3, 1);

INSERT INTO clientes(nome, sobrenome, telefone, endereco) VALUES ('Lucas', 'Santos', '81998745210', 'Rua Primor');
INSERT INTO clientes(nome, sobrenome, telefone, endereco) VALUES ('Italo', 'Sena', '8199841140', 'Rua Santos Dumount');
INSERT INTO clientes(nome, sobrenome, telefone, endereco) VALUES ('Amelia', 'Julieta', '819998414', 'Rua da Esquina');

INSERT INTO emprestimos(data, id_cliente) VALUES ('2023-05-14', 1);
INSERT INTO emprestimos(data, id_cliente) VALUES ('2023-06-19', 2);
INSERT INTO emprestimos(data, id_cliente) VALUES ('2023-07-04', 3);

INSERT INTO filmes_emprestimo(id_dvd, id_emprestimo) VALUES (1, 1);
INSERT INTO filmes_emprestimo(id_dvd, id_emprestimo) VALUES (2, 2);
INSERT INTO filmes_emprestimo(id_dvd, id_emprestimo) VALUES (3, 3);

INSERT INTO devolucoes(id_emprestimo, data) VALUES (1, '2023-05-18');
INSERT INTO devolucoes(id_emprestimo, data) VALUES (2, '2023-06-25');
INSERT INTO devolucoes(id_emprestimo, data) VALUES (3, '2023-07-15');

INSERT INTO filmes_devolucao(id_devolucao, id_filme_emprestimo) VALUES (1, 1);
INSERT INTO filmes_devolucao(id_devolucao, id_filme_emprestimo) VALUES (2, 2);
INSERT INTO filmes_devolucao(id_devolucao, id_filme_emprestimo) VALUES (3, 3);

