/*
------------------------------------------------------
Criando o Banco de Dados:
------------------------------------------------------
*/
CREATE DATABASE projetoIntegrador;
USE projetoIntegrador;
/*
------------------------------------------------------
Criando as Tabelas:
------------------------------------------------------
*/
CREATE TABLE bancaprofessor (
id_banca_professor BIGINT,
id_professor BIGINT,
id_defesa_aluno BIGINT,
tipo_professor ENUM('o','c','e')
);
CREATE TABLE defesaaluno (
id_defesa_aluno BIGINT,
id_aluno BIGINT,
id_pesquisa_tipo_tcc BIGINT,
nota DECIMAL(3,1),
data DATETIME,
status CHAR(1),
tema VARCHAR(200)
);
CREATE TABLE defesacomentario (
id_defesa_comentario BIGINT,
id_professor_curso BIGINT,
id_defesa_aluno BIGINT,
comentario varchar(500)
);
CREATE TABLE nivelusuario (
id_nivel_usuario BIGINT,
descricao VARCHAR(50)
);
CREATE TABLE usuario (
id_usuario BIGINT,
id_nivel_usuario BIGINT,
login VARCHAR(45),
senha VARCHAR(45)
);
CREATE TABLE pesquisatipotcc (
id_pesquisa_tipo_tcc BIGINT,
descricao VARCHAR(45)
);
CREATE TABLE pessoa (
id_pessoa BIGINT,
nome VARCHAR(200),
cpf CHAR(11),
endereco VARCHAR(200),
sexo ENUM('m','f'),
telefone CHAR(15),
email VARCHAR(45),
data_nascimento DATE
);
CREATE TABLE aluno (
id_aluno BIGINT,
id_pessoa BIGINT,
ra CHAR(9)
);
CREATE TABLE alunocurso (
id_aluno_curso BIGINT,
id_aluno BIGINT,
id_curso BIGINT
);
CREATE TABLE curso (
id_curso BIGINT,
descricao VARCHAR(45)
);
CREATE TABLE professorcurso (
id_professor_curso BIGINT,
id_curso BIGINT,
id_professor BIGINT
);
CREATE TABLE professor (
id_professor BIGINT,
id_pessoa BIGINT
);
/*
------------------------------------------------------
Modificando as Tabelas NOT NULL
------------------------------------------------------
*/
ALTER TABLE bancaprofessor MODIFY COLUMN id_banca_professor BIGINT NOT NULL;
ALTER TABLE bancaprofessor MODIFY COLUMN id_professor BIGINT NOT NULL;
ALTER TABLE bancaprofessor MODIFY COLUMN tipo_professor ENUM('o','c','e') NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN id_defesa_aluno INT NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN id_aluno BIGINT NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN id_pesquisa_tipo_tcc BIGINT NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN nota DECIMAL(3,1) NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN data DATETIME NOT NULL;
ALTER TABLE defesaaluno MODIFY COLUMN tema VARCHAR(200) NOT NULL;
ALTER TABLE defesacomentario MODIFY COLUMN id_defesa_comentario BIGINT NOT NULL;
ALTER TABLE defesacomentario MODIFY COLUMN id_professor_curso BIGINT NOT NULL;
ALTER TABLE defesacomentario MODIFY COLUMN comentario VARCHAR (500) NOT NULL;
ALTER TABLE nivelusuario MODIFY COLUMN id_nivel_usuario BIGINT NOT NULL;
ALTER TABLE usuario MODIFY COLUMN id_usuario BIGINT NOT NULL;
ALTER TABLE usuario MODIFY COLUMN id_nivel_usuario BIGINT NOT NULL;
ALTER TABLE usuario MODIFY COLUMN login VARCHAR (45)NOT NULL;
ALTER TABLE usuario MODIFY COLUMN senha VARCHAR (45)NOT NULL;
ALTER TABLE pesquisatipotcc MODIFY COLUMN id_pesquisa_tipo_tcc BIGINT NOT NULL;
ALTER TABLE pesquisatipotcc MODIFY COLUMN descricao VARCHAR (45)NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN id_pessoa BIGINT NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN nome VARCHAR (200) NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN cpf CHAR (11) NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN sexo ENUM('m','f') NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN telefone CHAR (15) NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN email VARCHAR (45) NOT NULL;
ALTER TABLE pessoa MODIFY COLUMN data_nascimento DATE NOT NULL;
ALTER TABLE aluno MODIFY COLUMN id_aluno BIGINT NOT NULL;
ALTER TABLE aluno MODIFY COLUMN id_pessoa BIGINT NOT NULL;
ALTER TABLE alunocurso MODIFY COLUMN id_aluno_curso BIGINT NOT NULL;
ALTER TABLE alunocurso MODIFY COLUMN id_aluno BIGINT NOT NULL;
ALTER TABLE alunocurso MODIFY COLUMN id_curso BIGINT NOT NULL;
ALTER TABLE curso MODIFY COLUMN id_curso BIGINT NOT NULL;
ALTER TABLE curso MODIFY COLUMN descricao VARCHAR (45) NOT NULL;
ALTER TABLE professorcurso MODIFY COLUMN id_professor_curso BIGINT NOT NULL;
ALTER TABLE professorcurso MODIFY COLUMN id_curso BIGINT NOT NULL;
ALTER TABLE professorcurso MODIFY COLUMN id_professor BIGINT NOT NULL;
ALTER TABLE professor MODIFY COLUMN id_professor BIGINT NOT NULL;
ALTER TABLE professor MODIFY COLUMN id_pessoa BIGINT NOT NULL;
/*
------------------------------------------------------
Modificando as Tabelas UNIQUE:
------------------------------------------------------
*/
ALTER TABLE pessoa ADD CONSTRAINT cpf_Unique UNIQUE (cpf);
ALTER TABLE aluno ADD CONSTRAINT ra_Unique UNIQUE (ra);

/*
------------------------------------------------------
Adicionando Constraint PK:
------------------------------------------------------
*/
ALTER TABLE bancaprofessor ADD CONSTRAINT pk_bancaprofessor PRIMARY KEY (id_banca_professor);
ALTER TABLE defesaaluno ADD CONSTRAINT pk_defesaaluno PRIMARY KEY (id_defesa_aluno);
ALTER TABLE defesacomentario ADD CONSTRAINT pk_defesacomentario PRIMARY KEY (id_defesa_comentario);
ALTER TABLE nivelusuario ADD CONSTRAINT pk_nivelusuario PRIMARY KEY (id_nivel_usuario);
ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);
ALTER TABLE pesquisatipotcc ADD CONSTRAINT pk_pesquisatipotcc PRIMARY KEY (id_pesquisa_tipo_tcc);
ALTER TABLE pessoa ADD CONSTRAINT pk_pessoa PRIMARY KEY (id_pessoa);
ALTER TABLE aluno ADD CONSTRAINT pk_aluno PRIMARY KEY(id_aluno);
ALTER TABLE alunocurso ADD CONSTRAINT pk_alunocurso PRIMARY KEY(id_aluno_curso);
ALTER TABLE curso ADD CONSTRAINT pk_curso PRIMARY KEY (id_curso);
ALTER TABLE professorcurso ADD CONSTRAINT pk_professorcurso PRIMARY KEY (id_professor_curso);
ALTER TABLE professor ADD CONSTRAINT pk_professor PRIMARY KEY (id_professor);
/*
------------------------------------------------------
Modificando as Tabelas AUTO_INCREMENT:
------------------------------------------------------
*/
ALTER TABLE bancaprofessor MODIFY COLUMN id_banca_professor BIGINT AUTO_INCREMENT;
ALTER TABLE defesaaluno MODIFY COLUMN id_defesa_aluno BIGINT AUTO_INCREMENT;
ALTER TABLE defesacomentario MODIFY COLUMN id_defesa_comentario BIGINT AUTO_INCREMENT;
ALTER TABLE nivelusuario MODIFY COLUMN id_nivel_usuario BIGINT AUTO_INCREMENT;
ALTER TABLE usuario MODIFY COLUMN id_usuario BIGINT AUTO_INCREMENT;
ALTER TABLE pesquisatipotcc MODIFY COLUMN id_pesquisa_tipo_tcc BIGINT AUTO_INCREMENT;
ALTER TABLE pessoa MODIFY COLUMN id_pessoa BIGINT AUTO_INCREMENT;
ALTER TABLE aluno MODIFY COLUMN id_aluno BIGINT AUTO_INCREMENT;
ALTER TABLE alunocurso MODIFY COLUMN id_aluno_curso BIGINT AUTO_INCREMENT;
ALTER TABLE curso MODIFY COLUMN id_curso BIGINT AUTO_INCREMENT;
ALTER TABLE professorcurso MODIFY COLUMN id_professor_curso BIGINT AUTO_INCREMENT;
ALTER TABLE professor MODIFY COLUMN id_professor BIGINT AUTO_INCREMENT;
/*
------------------------------------------------------
Adicionando Constraint FK:
------------------------------------------------------
*/
ALTER TABLE bancaprofessor ADD CONSTRAINT fk_professor_em_bancaprofessor FOREIGN KEY (id_professor) REFERENCES professor(id_professor);
ALTER TABLE bancaprofessor ADD CONSTRAINT fk_defesaaluno_em_bancaprofessor FOREIGN KEY (id_defesa_aluno) REFERENCES defesaaluno(id_defesa_aluno);
ALTER TABLE defesaaluno ADD CONSTRAINT fk_aluno_em_defesaaluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE defesaaluno ADD CONSTRAINT fk_pesquisatipotcc_em_defesaaluno FOREIGN KEY (id_pesquisa_tipo_tcc) REFERENCES pesquisatipotcc(id_pesquisa_tipo_tcc);
ALTER TABLE defesacomentario ADD CONSTRAINT fk_professorcurso_em_defesacomentario FOREIGN KEY (id_professor_curso) REFERENCES professorcurso(id_professor_curso);
ALTER TABLE defesacomentario ADD CONSTRAINT fk_defesaaluno_em_defesacomentario FOREIGN KEY (id_defesa_aluno) REFERENCES defesaaluno(id_defesa_aluno);
ALTER TABLE usuario ADD CONSTRAINT fk_nivelusuario_em_usuario FOREIGN KEY (id_nivel_usuario) REFERENCES nivelusuario(id_nivel_usuario);
ALTER TABLE aluno ADD CONSTRAINT fk_pessoa_em_aluno FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa);
ALTER TABLE alunocurso ADD CONSTRAINT fk_aluno_em_alunocurso FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE alunocurso ADD CONSTRAINT fk_curso_em_alunocurso FOREIGN KEY (id_curso) REFERENCES curso(id_curso);
ALTER TABLE professorcurso ADD CONSTRAINT fk_curso_em_professorcurso FOREIGN KEY (id_curso) REFERENCES curso(id_curso);
ALTER TABLE professorcurso ADD CONSTRAINT fk_professor_em_professorcurso FOREIGN KEY (id_professor) REFERENCES professor(id_professor);
ALTER TABLE professor ADD CONSTRAINT fk_pessoa_em_professor FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa);
