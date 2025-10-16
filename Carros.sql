CREATE DATABASE IF NOT EXISTS Carros;
USE Carros;

CREATE TABLE IF NOT EXISTS tbl_carros (
    id_carro INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(7) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT
);

INSERT INTO tbl_carros (placa, marca, modelo, ano_fabricacao)
VALUES
    ('DAE6534', 'FORD', 'FIESTA', 1999),
    ('DKL4598', 'VOLKSWAGEN', 'GOL', 2001),
    ('DKL7878', 'FORD', 'FIESTA', 2001),
    ('JDM8776', 'VOLKSWAGEN', 'SANTANA', 2002),
    ('JJM3692', 'CHEVROLET', 'CORSA', 1999);

SELECT * FROM tbl_carros;
v
ALTER TABLE tbl_carros ADD ipva_pago VARCHAR(3);

SET SQL_SAFE_UPDATES = 0;

UPDATE tbl_carros
SET ipva_pago = CASE id_carro
  WHEN 1 THEN 'SIM'
  WHEN 2 THEN 'NÃO'
  WHEN 3 THEN 'NÃO'
  WHEN 4 THEN 'SIM'
  WHEN 5 THEN 'SIM'
END;

SELECT * FROM tbl_carros;

UPDATE tbl_carros SET modelo = 'NEW FIESTA' WHERE placa = 'DAE6534';

SELECT * FROM tbl_carros;

DELETE FROM tbl_carros WHERE placa = "DKL4598";

SELECT * FROM tbl_carros;

SELECT * FROM tbl_carros WHERE ipva_pago = "SIM";

SELECT * FROM tbl_carros WHERE marca = "FORD";

SELECT * FROM tbl_carros ORDER BY marca ASC;

/* Uma copia da tabela para puxar dados que eu quiser*/

CREATE VIEW View_tbl_carros AS 
SELECT id_carro, placa, marca, modelo, ano_fabricacao, ipva_pago
FROM tbl_carros WHERE ano_fabricacao >=2000;

SELECT * FROM View_tbl_carros;
SELECT * FROM tbl_carros;

ALTER TABLE tbl_carros
ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo;

SELECT * FROM tbl_carros;

UPDATE tbl_carros
SET tabela_fipe = CASE id_carro
  WHEN 1 THEN '6.614'
  WHEN 3 THEN '8.168'
  WHEN 4 THEN '21.615'
  WHEN 5 THEN '11.566'
END;

/* Outra Forma */
/* UPDATE tbl_carros SET tabela_fipe = 6.614 WHERE placa = "DAE6534" */

SELECT * FROM tbl_carros;