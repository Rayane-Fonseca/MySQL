CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_escritor INT,
    CONSTRAINT fk_autor FOREIGN KEY (id_escritor) REFERENCES autores(id_autor)
);

INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado');

INSERT INTO livros (titulo, id_escritor) VALUES
('Dom Casmurro', 1),
('A Hora da Estrela', 2),
('Gabriela, Cravo e Canela', 3),
('Memórias Póstumas de Brás Cubas', 1);

SELECT * FROM autores;
SELECT * FROM livros;

INSERT INTO livros (titulo, id_escritor) VALUES
('Divergente', NULL);

INSERT INTO autores (nome_autor) VALUES
('Patati e Patata');

/* Exiba os livros com nomes dos autores correspondentes */

SELECT livros.titulo, autores.nome_autor
FROM livros INNER JOIN autores ON livros.id_escritor = autores.id_autor;

/* Exiba todos os livros, mostrando o autor quando houver, ou NULL quando não houver autor */

SELECT livros.titulo, autores.nome_autor
FROM livros LEFT JOIN autores ON livros.id_escritor = autores.id_autor;

----------------------------------------------------------------------------------
/* LEFT JOIN -> Retorna todas as linhas da tabela à esquerda e as correspondências 
da tabela da direita. Quando não tem correspondência, mostra NULL */

/* RIGHT JOIN -> Retorna todas as linhas da tabela à direita e as correspondência 
da tabela da esquerda. Quando não tem correspondência, mostra NULL */
----------------------------------------------------------------------------------

/* Exiba todos os autores, com seus livros correspondentes ou NULL caso não 
tenha livros cadastros */

SELECT autores.nome_autor, livros.titulo
FROM autores LEFT JOIN livros ON livros.id_escritor = autores.id_autor;

/* Liste todos os com seus autores em ordem alfabética pelo título do livro */

SELECT livros.titulo, autores.nome_autor
FROM livros INNER JOIN autores ON livros.id_escritor = autores.id_autor
ORDER BY livros.titulo ASC;

/* Liste todos os autores e a quantidade de livros que cada um possui */

SELECT autores.nome_autor, COUNT(livros.id_escritor) AS total_livros
FROM livros RIGHT JOIN autores ON livros.id_escritor = autores.id_autor
GROUP BY autores.nome_autor;

/* Liste todos os autores que não possuem nenhum livro cadastrado */

SELECT autores.nome_autor, livros.titulo
FROM autores LEFT JOIN livros ON livros.id_escritor = autores.id_autor
WHERE livros.id_livro IS NULL;

/* Buscar os título dos livros que foram escritos por "Machado de Assis" */

SELECT livros.titulo, autores.nome_autor
FROM autores LEFT JOIN livros ON livros.id_escritor = autores.id_autor
WHERE autores.nome_autor = "Machado de Assis";

/* Exibir o total de livros na tabela */

SELECT * FROM livros;

/* Listar autores e seus livros, ordenados pelo nome do autor e depois pelo título do livro */

SELECT autores.nome_autor, livros.titulo
FROM autores INNER JOIN livros ON livros.id_escritor = autores.id_autor
ORDER BY autores.nome_autor, livros.titulo;

/* TRUNCATE -> Remove todas as linhas da tabela, mantendo a estrutura dela */

SELECT COUNT(*) AS total_livros FROM livros;
TRUNCATE TABLE livros;
SELECT * FROM livros;

/* RENAME -> Renomear */

RENAME TABLE livros TO Obras;
RENAME TABLE Obras TO livros;

ALTER TABLE livros RENAME COLUMN titulo TO Título;
ALTER TABLE livros RENAME COLUMN id_livro TO ID_Livro;
ALTER TABLE livros RENAME COLUMN id_escritor TO ID_Escritor;

/* DCL: Linguagem de controle de dados (Data Control Language) ->
gerencia permissões de acesso ao banco de dados.

GRANT -> Conceder acesso
REVOKE -> Revogar o acesso */

/* TCL: Linguage de controle de transação (Transaction Control Language) -> 

TRANSAÇÃO -> Operação que deve ser executada para garantir a integridade e a consistência dos dados.
COMMIT -> Gravar permanentemente todas as alterações da transação. Após o commit as alterações não podem ser desfeitas.

ROLLBACK -> Desfaz as alterações feitas desde o início da transação ou desde o último savepoint, retornando o 
banco ao estado anterior.
SAVEPOINT -> Cria um ponto intermediário de uma transação para que seja possível reverter parcialmente as 
operações até aquele determinado ponto, sem desfazer toda a transação. */

COMMIT;
ROLLBACK;

START TRANSACTION;
INSERT INTO livros(nome_titulo, autor_id) VALUES ('Novo Livro, 2');

SAVEPOINT antes_update;
UPDATE livros SET nome_titulo = 'Livro Atualizado' WHERE id_livro = 1;

/* Se algo deu errado, voltamos ao savepoint */

ROLLBACK TO SAVEPOINT antes_update;

/* SELECT coluna1, coluna2, ...
FROM tabela
WHERE condição
GROUP BY coluna
HAVING condição_agrupamento
ORDER BY coluna ASC/desc
LIMIT número */