CREATE TABLE "generos" (
  "id" SERIAL PRIMARY KEY,
  "genero" varchar NOT NULL
);

CREATE TABLE "filmes" (
  "id" SERIAL PRIMARY KEY,
  "titulo" varchar NOT NULL,
  "id_generos" int NOT NULL,
  "valor" decimal(8,2) NOT NULL
);

CREATE TABLE "dvds" (
  "id" SERIAL PRIMARY KEY,
  "id_filme" int NOT NULL,
  "quantidade" int NOT NULL
);

CREATE TABLE "atores" (
  "id" SERIAL PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "atores_filme" (
  "id" SERIAL PRIMARY KEY,
  "id_filme" int NOT NULL,
  "id_ator" int NOT NULL,
  "personagem" varchar
);

CREATE TABLE "clientes" (
  "id" SERIAL PRIMARY KEY,
  "nome" varchar NOT NULL,
  "sobrenome" varchar NOT NULL,
  "endereco" varchar NOT NULL,
  "telefone" varchar NOT NULL
);

CREATE TABLE "emprestimos" (
  "id" SERIAL PRIMARY KEY,
  "data" date NOT NULL,
  "id_cliente" int NOT NULL
);

CREATE TABLE "filmes_emprestimo" (
  "id" SERIAL PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "id_filme" int NOT NULL
);

CREATE TABLE "devolucoes" (
  "id" SERIAL PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "data" date NOT NULL
);

CREATE TABLE "filmes_devolucao" (
  "id" SERIAL PRIMARY KEY,
  "id_devolucao" int NOT NULL,
  "id_filme_emprestimo" int NOT NULL
);

ALTER TABLE "filmes" ADD FOREIGN KEY ("id_generos") REFERENCES "generos" ("id");

ALTER TABLE "dvds" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_ator") REFERENCES "atores" ("id");

ALTER TABLE "emprestimos" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "devolucoes" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_devolucao") REFERENCES "devolucoes" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_filme_emprestimo") REFERENCES "filmes_emprestimo" ("id");

SELECT * FROM filmes;
