# Dados de teste

-- Tipos produto
INSERT INTO tipo_produto (nome) VALUES ('Remedios');
INSERT INTO tipo_produto (nome) VALUES ('Cosmeticos');
INSERT INTO tipo_produto (nome) VALUES ('Diversos');

INSERT INTO fabricante (nome) VALUES ('Rocha');
INSERT INTO fabricante (nome) VALUES ('Vitalis');
INSERT INTO fabricante (nome) VALUES ('Palmolive');

INSERT INTO medicos(nome, crm) VALUES('Alfredo Muniz', '123547SP');
INSERT INTO medicos(nome, crm) VALUES('Fernanda Silva', '123547MG');
INSERT INTO medicos(nome, crm) VALUES('Julieta Fernanda', '123547SC');

INSERT INTO clientes(nome, telefone, cpf, rua, cep, cidade) 
VALUES ('Felicity Jones', '(11)2345-8999', '056.218.124-50','Rua da Paz, 34', '55715-000', 'Feira Nova');
INSERT INTO clientes(nome, telefone, cpf, rua, cep, cidade) 
VALUES ('Davy Jones', '(11)7444-8999', '056.745.124-50','Rua da aurora, 34', '55755-000', 'Lagoa do Carro');
INSERT INTO clientes(nome, telefone, cpf, rua, cep, cidade) 
VALUES ('Diggo', '(11)2345-1119', '146.218.124-50','Rua da Gloria, 34', '57715-000', 'Diadema');

INSERT INTO produtos (designacao, composicao, preco_venda, id_tipo, id_fabricante) 
	VALUES ('Dor em geral', 'Metilpropileno', 12.44, 1, 1);
INSERT INTO produtos (designacao, composicao, preco_venda, id_tipo, id_fabricante) 
	VALUES ('Limpeza corporal', 'Sabao', 3.56, 2, 2);
INSERT INTO produtos (designacao, composicao, preco_venda, id_tipo, id_fabricante) 
	VALUES ('Protetor solar', 'Soro de abacate', 98.12, 2, 1);

INSERT INTO compras (id_cliente, data_compra) 
	VALUES(1,'2019-03-18');
INSERT INTO compras (id_cliente, data_compra) 
	VALUES(2,'2019-04-18');
INSERT INTO compras (id_cliente, data_compra) 
	VALUES(1,'2019-05-18');
    
INSERT INTO produtos_compra (id_produto, id_compra, quantidade)
	VALUES(1, 1, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade)
	VALUES(1, 2, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade)
	VALUES(2, 3, 1);

INSERT INTO receitas_medica(id_produto_compra, id_medico, receita)
	VALUES(1, 1, 'receita1.pdf');
INSERT INTO receitas_medica(id_produto_compra, id_medico, receita)
	VALUES(3, 2, 'receita2.pdf');
    



