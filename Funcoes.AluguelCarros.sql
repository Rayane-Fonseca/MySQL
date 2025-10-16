/* COUNT, AVG, MIN, MAX E SUM */

------------------------------------------

/* COUNT -> Conta quantos dados existem */

SELECT COUNT(*) AS total_cliente FROM cliente;
SELECT COUNT(codaluguel) AS total_alugueis FROM aluguel;

------------------------------------------

/* AVG -> Average - Média */

SELECT AVG (valor) AS media_valor FROM carro;

------------------------------------------

/* MIN -> Mínimo */

SELECT MIN(valor) AS menor_valor FROM carro;

------------------------------------------

/* MAX -> Máximo */

SELECT MAX(valor) AS menor_valor FROM carro;

------------------------------------------

/* SUM -> Soma */

SELECT SUM(valor) AS soma_valor FROM carro;

------------------------------------------

/* Estrutura -> 

SELECT tabela1.coluna1, tabela1. coluna2
FROM tabela1
INNER JOIN tabela2 ON tabela1.id = tabela2.id */