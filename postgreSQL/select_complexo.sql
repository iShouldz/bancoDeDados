SELECT * FROM atores;

SELECT * FROM filmes;

SELECT * from atores_filme;

-- Encontrar todos os filmes q determinado ator atua
SELECT f.id, f.titulo, g.genero, a.nome, af.personagem
	FROM filmes AS f, generos AS g, atores as a, atores_filme AS af
	WHERE af.id_ator = a.id AND af.id_filme = f.id AND g.id = f.id_genero AND a.nome = 'Brad Pitt';

-- Encontrat todos filmes de um determinado ator por genero
SELECT f.id, f.titulo, g.genero, a.nome, af.personagem
	FROM filmes AS f, generos AS g, atores as a, atores_filme AS af
	WHERE af.id_ator = a.id AND af.id_filme = f.id AND g.id = f.id_genero AND a.nome = 'Brad Pitt' AND f.id_genero = 1;
	
-- VErificar qual cliente alugou oque	
SELECT * FROM emprestimos;
SELECT c.nome, f.titulo
	FROM clientes AS c, filmes AS f, filmes_emprestimo as fe, emprestimos as e, dvds as dvd
	WHERE c.id = e.id_cliente AND fe.id_emprestimo = e.id AND dvd.id_filme = f.id AND fe.id_dvd = dvd.id;
	
-- Verifcar o que devolveram
SELECT de.id, c.nome, c.sobrenome, de.data, f.titulo
	FROM devolucoes AS de, clientes AS c, filmes AS f, filmes_devolucao AS fd, dvds AS d, emprestimos AS e, filmes_emprestimo AS fe
	WHERE fd.id_filme_emprestimo = fe.id AND e.id_cliente = c.id AND f.id = d.id_filme AND fe.id_dvd = d.id 
	AND DE.id_emprestimo = e.id AND fd.id_devolucao = de.id AND fe.id_emprestimo = e.id;
	