SELECT * FROM tipos_produtos;

SELECT * FROM produtos;

SELECT * FROM pacientes;

SELECT * FROM professor;

SELECT * FROM turma;

SELECT t.id, t.capacidade, p.nome
	FROM turma AS t, professor AS p
	WHERE t.id_professor = p.id;