SELECT * FROM atores;

SELECT * FROM clientes;

SELECT * FROM filmes;

SELECT * from generos;

SELECT f.id, f.titulo, g.genero, f.valor
	FROM filmes AS f, generos AS g
	WHERE f.id_genero = g.id;
	
SELECT * FROM atores_filme;

SELECT af.id, f.titulo, a.nome AS nome_ator, af.personagem
	FROM atores_filme AS af, filmes AS f, atores AS a
	WHERE af.id_filme = f.id AND af.id_ator = a.id;
	
	
SELECT * FROM filmes WHERE valor in (SELECT MAX(valor) FROM filmes);