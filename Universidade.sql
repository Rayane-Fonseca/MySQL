CREATE DATABASE IF NOT EXISTS Universidade;
USE Universidade;

CREATE TABLE IF NOT EXISTS Alunos (
    mat INT(10) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

INSERT INTO Alunos (mat, nome, endereco, cidade)
VALUES
	(2015010101, "JOSE DE ALENCAR", "RUA DAS ALMAS", "NATAL"),
	(2015010102, "JOÃO JOSÉ", "AVENIDA RUY CARNEIRO", "JOÃO PESSOA"),
	(2015010103, "MARIA JOAQUINA", "RUA CARROSSEL", "RECIFE"),
	(2015010104, "MARIA DAS DORES", "RUA DAS LADEIRAS", "FORTALEZA"),
	(2015010105, "JOSUÉ SANTOS", "CENTRO", "NATAL"),
	(2015010106, "JOSUÉLISSON", "CENTRO", "NATAL");
    
SELECT * FROM Alunos;

CREATE TABLE IF NOT EXISTS Disciplinas (
    cod_disc VARCHAR(50) PRIMARY KEY,
    nome_disc VARCHAR(50) NOT NULL,
    carga_horaria INT(10) NOT NULL
);

INSERT INTO Disciplinas (cod_disc, nome_disc, carga_horaria)
VALUES
	("BD", "BANCO DE DADOS", 100),
	("POO", "PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS", 100),
	("WEB", "AUTORIA WEB", 50),
	("ENG", "ENGENHARIA DE SOFTWARE", 80);
		
SELECT * FROM Disciplinas;

CREATE TABLE IF NOT EXISTS Professores (
    cod_prof INT(10) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

INSERT INTO Professores (cod_prof, nome, endereco, cidade)
VALUES
	(212131, "NICKERSON FERREIRA", "RUA MANAÍRA", "JOÃO PESSOA"),
	(122135, "ADORILSON BEZERRA", "AVENIDA SALGADO FILHO", "NATAL"),
	(192011, "DIEGO OLIVEIRA", "AVENIDA ROBERTO FREIRE", "NATAL");
    
SELECT * FROM Professores;

CREATE TABLE IF NOT EXISTS Turma (
    cod_turma INT(10) NOT NULL,
    cod_disc VARCHAR(50) NOT NULL,
    cod_prof INT(10) NOT NULL,
    ano INT NOT NULL,
    horario VARCHAR(50) NOT NULL,
        /* CHAVE PRIMARIA COMPOSTA*/
    PRIMARY KEY (cod_turma, cod_disc, cod_prof, ano),
    FOREIGN KEY (cod_disc) REFERENCES Disciplinas(cod_disc),
    FOREIGN KEY (cod_prof) REFERENCES Professores(cod_prof)
);

INSERT INTO Turma (cod_turma, cod_disc, cod_prof, ano, horario)
VALUES
	( 1, "BD", 212131, 2015, "11H-12H"),
	(2, "BD", 212131, 2015, "13H-14H"),
	(1, "POO", 192011, 2015, "08H-09H"),
	(1, "WEB", 192011, 2015, "07H-08H"),
	(1, "ENG", 122135, 2015, "10H-11H");
    
SELECT * FROM Turma;

CREATE TABLE IF NOT EXISTS Historico (
    mat INT(10) NOT NULL,
    cod_turma INT(10) NOT NULL,
    cod_disc VARCHAR(50) NOT NULL,
    cod_prof INT(10) NOT NULL,
    ano INT NOT NULL,
    frequencia INT NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (mat, cod_turma, ano),
    FOREIGN KEY (mat) REFERENCES Alunos(mat),
    FOREIGN KEY (cod_turma, cod_disc, cod_prof, ano) REFERENCES Turma(cod_turma, cod_disc, cod_prof, ano)
);

INSERT INTO Historico (mat, cod_turma, cod_disc, cod_prof, ano, frequencia, nota)
VALUES
    (2015010101, 1, 'BD', 212131, 2015, 95, 9),
    (2015010102, 2, 'BD', 212131, 2015, 90, 4),
    (2015010103, 1, 'POO', 192011, 2015, 85, 7),
    (2015010104, 1, 'WEB', 192011, 2015, 100, 6),
    (2015010105, 1, 'ENG', 122135, 2015, 98, 8);
    
SELECT * FROM Historico;
    
/* a) Encontre a MAT dos alunos com nota em BD em 2015
menor que 5 (obs: BD = código da disciplinas). */

SELECT DISTINCT mat FROM Historico WHERE cod_disc = 'BD' AND ano = 2015 AND nota < 5; /* Distinct = Evitar consulta repetida */

/* b) Encontre a MAT e calcule a média das notas dos alunos na
disciplina de POO
em 2015. */

SELECT mat, AVG(nota) AS media_nota 
FROM Historico
WHERE cod_disc = "POO" AND ano = 2015
GROUP BY mat; /* agrupar linhas que possuem valores iguais em uma ou mais colunas */

/* c) Encontre a MAT e calcule a média das notas dos alunos na
disciplina de POO
em 2015 e que esta média seja superior a 6. */

SELECT mat, AVG(nota) AS media_nota FROM Historico /* a função AVG calcula a média aritmética dos valores da coluna nota. */
WHERE cod_disc = "POO" AND ano = 2015
GROUP BY mat HAVING AVG(nota) > 6; /* Having = Filtrar */

/* d) Encontre quantos alunos não são de Natal. */

SELECT cidade FROM Alunos WHERE NOT cidade = "NATAL";

SELECT COUNT(*) AS quantidade_alunos FROM Alunos WHERE cidade <> "NATAL"; /* <> = Sinal de diferente em sql */
