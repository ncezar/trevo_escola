CREATE TABLE "estudantes" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80) NOT NULL,
  "sobrenome" varchar(80) NOT NULL,
  "data_nascimento" date NOT NULL,
  "telefone" varchar(15) NOT NULL,
  "turma_id" int NOT NULL
);

CREATE TABLE "professores" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80) NOT NULL,
  "sobrenome" varchar(80) NOT NULL,
  "materia_id" int
);

CREATE TABLE "turmas" (
  "id" serial PRIMARY KEY,
  "titulo" varchar(80) NOT NULL,
  "periodo" char(1) NOT NULL DEFAULT 'M'
);

CREATE TABLE "materias" (
  "id" serial PRIMARY KEY,
  "titulo" varchar(40) NOT NULL
);

CREATE TABLE "grade" (
  "id" serial PRIMARY KEY,
  "turma_id" int,
  "dia_semana" char(3) NOT NULL DEFAULT 'SEG'
);

CREATE TABLE "grade_aula" (
  "id" serial PRIMARY KEY,
  "aula_id" int,
  "grade_id" int
);

CREATE TABLE "aula" (
  "id" serial PRIMARY KEY,
  "materia_id" int,
  "hora_inicio" time NOT NULL,
  "hora_fim" time NOT NULL
);

CREATE TABLE "boletins" (
  "id" serial PRIMARY KEY,
  "materia_id" int,
  "aluno_id" int,
  "trimestre" int NOT NULL,
  "nota" int NOT NULL
);

ALTER TABLE "estudantes" ADD FOREIGN KEY ("turma_id") REFERENCES "turmas" ("id");

ALTER TABLE "grade" ADD FOREIGN KEY ("id") REFERENCES "turmas" ("id");

ALTER TABLE "grade_aula" ADD FOREIGN KEY ("aula_id") REFERENCES "aula" ("id");

ALTER TABLE "grade_aula" ADD FOREIGN KEY ("grade_id") REFERENCES "grade" ("id");

--ALTER TABLE "materias" ADD FOREIGN KEY ("id") REFERENCES "professores" ("materia_id");
ALTER TABLE "professores" ADD FOREIGN KEY ("materia_id") REFERENCES "materias" ("id");

ALTER TABLE "aula" ADD FOREIGN KEY ("materia_id") REFERENCES "materias" ("id");

ALTER TABLE "boletins" ADD FOREIGN KEY ("materia_id") REFERENCES "materias" ("id");

ALTER TABLE "boletins" ADD FOREIGN KEY ("aluno_id") REFERENCES "estudantes" ("id");
