CREATE DATABASE Mundo;
USE Mundo;

CREATE TABLE Pais (
	Nome VARCHAR(35),
    Continente VARCHAR(35),
    Pop REAL,
    PIB REAL,
    Expec_Vida REAL
);

CREATE TABLE Cidade (
	Nome VARCHAR(35),
    Pais VARCHAR(35),
    Pop REAL,
	Capital VARCHAR(1)
);

CREATE TABLE Rio (
	Nome VARCHAR(35),
    Origem VARCHAR(35),
    Comprimento INT,
    Nascente VARCHAR(35),
    Pais VARCHAR(35)
);

INSERT INTO Pais(Nome, Continente, Pop, PIB, Expec_Vida) VALUES
	('Canadá', 'Am. Norte', 30.1, 658, 77.8),
	('México', 'Am. Norte', 107.5, 694, 69.1),
	('Brasil', 'Am. Sul', 183.3, 10004, 65.2),
	('USA', 'Am. Norte', 270.0, 8003, 75.5);
    
INSERT INTO Cidade(Nome, Pais, Pop, Capital) VALUES
	('Washington', 'USA', 3.3, 'S'),
	('Monterrey', 'México', 2.0, 'N'),
	('Brasilia', 'Brasil', 1.5, 'S'),
	('São Paulo', 'Brasil', 15.0, 'N'),
	('Ottawa', 'Canada', 0.8, 'S'),
	('Cid. México', 'México', 14.1, 'S');
    
INSERT INTO Rio(Nome, Nascente, Pais, Comprimento) VALUES
	('St. Lawrence', 'USA', 'USA', 3.3),
	('Grande', 'USA', 'México', 2.0),
	('Parana', 'Brasil', 'Brasil', 1.5),
	('Mississipi', 'USA', 'USA', 15.0);
    
/* 1. Liste todas as cidades e os países aos quais pertencem. */

SELECT cidade.nome, pais.nome
FROM pais LEFT JOIN cidade ON cidade.pais = pais.nome;

/* 2. Liste todas as cidades que são capitais. */

SELECT cidade.nome, cidade.capital
FROM pais LEFT JOIN cidade ON cidade.pais = pais.nome
WHERE cidade.capital = 'S';

/* 3. Liste todos os atributos dos países onde a expectativa de vida é menor que 70 anos. */ 

SELECT pais.*, cidade.nome AS Cidade
FROM pais LEFT JOIN cidade ON cidade.pais = pais.nome
WHERE pais.expec_vida < 70;

/* 4. Liste todas as capitais e as populações dos países cujos PIB é maior que 1 trilhão de dólares. */

SELECT cidade.nome AS Capital, cidade.pop AS Populacao, pais.nome AS Pais
FROM pais LEFT JOIN cidade ON cidade.pais = pais.nome
WHERE pais.pib > 1000 AND cidade.capital = 'S';

/* 5. Quais é o nome e a população da capital do país onde o rio St. Lawrence tem sua nascente. */

SELECT cidade.nome AS Nome, cidade.pop AS Populacao, rio.nome
FROM cidade INNER JOIN rio ON rio.pais = cidade.pais
WHERE rio.nome = 'St. Lawrence'; 

/* 6. Qual é a média da população das cidades que não são capitais. */

SELECT AVG(pop) AS media_pop FROM cidade WHERE cidade.capital = 'N';

SELECT AVG(cidade.pop) AS media_pop
FROM cidade LEFT JOIN pais ON cidade.pais = pais.nome
WHERE cidade.capital = 'N';

/* 7. Para cada continente retorne o PIB médio de seus países. */

SELECT pais.continente, AVG(pib) AS pib_medio FROM pais
GROUP BY pais.continente;

/* 8. Para cada país onde pelo menos 2 rios tem nascente, encontre o comprimento do menor rio. */

SELECT rio.pais, MIN(rio.comprimento) AS menor_rio
FROM rio JOIN (
	SELECT nascente AS pais, COUNT(*) AS quantidade_rios
    FROM rio
    GROUP BY nascente
    HAVING COUNT(*) >= 2
) cidade ON rio.nascente = cidade.pais
GROUP BY rio.pais;

/* 9. Liste os países cujo PIB é maior que o PIB é do Canada. */

SELECT pais.nome, pais.pib
FROM pais WHERE pib > (
	SELECT pais.pib
    FROM pais
    WHERE pais.nome = 'Canada'
);
