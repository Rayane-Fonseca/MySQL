/* Tipos de dados 

----- Númericos -----

VACHAR (n) --> nº número de caracteres
INT --> Inteiro
DECIMAL --> Números decimais, precisão fixa
FLOAT e DOUBLE --> Números decimais com precisão variável

----- Textos -----

CHAR --> Cadeia de caracteres de tamanho fixo
VARCHAR --> Cadeia de caracteres de tamanho variável
TEXT --> Texto longo

----- Data e hora -----

DATE --> Armazenar datas
DATETIME --> Armazenar data e hora juntas
*/

CREATE DATABASE TiposDeDados;
USE TiposDeDados;
CREATE TABLE IF NOT EXISTS tbl_livro(
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    nome_livro VARCHAR(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    preco_livro DECIMAL(10,2)
);

INSERT INTO tbl_livro(nome_livro, data_publicacao, preco_livro)
VALUES
	("Dom Casmurro", "1899-01-01", "39.90");

INSERT INTO tbl_livro(nome_livro, data_publicacao, preco_livro)
VALUES
	("Grande Sertão: Veredas", "1956-01-01", "39.90"),
    ("Memórias Póstumas de Brás Cubas", "1881-01-01", "24.50"),
    ("Vidas Secas", "1938-01-01", "27.80");
 
/* Mostra todas as informações */  
SELECT * FROM tbl_livro;

/* Mostra nome e preço */
SELECT nome_livro, preco_livro FROM tbl_livro;

/* Mostra nome e data */
SELECT nome_livro, data_publicacao FROM tbl_livro;

SELECT nome_livro AS "Nome do Livro", /* Alterar o nome na planilha */
	DATE_FORMAT(data_publicacao, "%d/%m/%Y") AS "Data de Publicação" /* Alterar o formato da data para BR */
FROM tbl_livro;

/* Livros com preço maior que 30 reais */
SELECT * FROM tbl_livro WHERE preco_livro > 30;

/* Ordenar os livros do menor para maior preço */
SELECT * FROM tbl_livro ORDER BY preco_livro ASC;

/* Selecionar apenas 3 primeiros livros com preço maior que 20 */
SELECT * FROM tbl_livro WHERE preco_livro > 20 LIMIT 3;
SELECT * FROM tbl_livro WHERE preco_livro > 20 ORDER BY preco_livro ASC LIMIT 3;