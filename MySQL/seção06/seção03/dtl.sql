SELECT * FROM tipos_produto;

#DTL
	#Transação

START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Teste');
    INSERT INTO tipos_produto (descricao) VALUES ('testando');
COMMIT;

#Se starta uma transação com os comandos dentro dela, o comando commit faz com q os dados fiquem permanentmente persistidos no BD, o uso do rollback
#é usado quando não aplicamos o commit e desejamos voltar o banco para o estado anterior a transação

ROLLBACK;