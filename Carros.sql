CREATE DATABASE Carros;
USE Carros;
CREATE TABLE IF NOT EXISTS tbl_carros(
	id_carro INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(7) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT
);

INSERT INTO tbl_carros (placa, marca, modelo, ano_fabricacao)
VALUES
	("DAE6534", "FORD", "FIESTA", 1999),
    ("DKL4598", "VOLKSWAGEN", "GOL", 2001),
	("DKL7878", "FORD", "FIESTA", 2001),
    ("JDM8776", "VOLKSWAGEN", "SANTANA", 2002),
    ("JJM3692", "CHEVROLET", "CORSA", 1999);
    
SELECT * FROM tbl_carros;