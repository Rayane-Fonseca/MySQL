CREATE DATABASE ManipulandoDados;
USE ManipulandoDados;

CREATE TABLE Cliente (
	cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(50) NOT NULL,
    sexo_cliente CHAR(1) NOT NULL CHECK(sexo_cliente IN ("F", "M", "O")) DEFAULT "O",
    renda_cliente DECIMAL(10,2) CHECK (renda_cliente >= 0) DEFAULT 0,
    rg_cliente CHAR(12) NOT NULL UNIQUE
);

CREATE TABLE Funcionario (
	cod_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(50) NOT NULL,
    sexo_funcionario CHAR(1) NOT NULL CHECK(sexo_funcionario IN ("F", "M", "O")) DEFAULT "O",
    salario_funcionario DECIMAL(10,2) NOT NULL CHECK(salario_funcionario >= 0),
    data_cadfuncionario DATETIME NOT NULL DEFAULT NOW()
);

ALTER TABLE Funcionario MODIFY COLUMN data_cadfuncionario DATE NOT NULL;

INSERT INTO Cliente (cod_cliente, nome_cliente, sexo_cliente, renda_cliente, rg_cliente) VALUES
	(1, "João Carlos", "M", 5000.00, 123456789101),
    (2, "Daniel", "M", 6000.00, 145678621452),
    (3, "Helena", "F", 6000.00, 351946872613),
    (4, "Roberta", "F", 5000.00, 628497316854),
    (5, "Renata", "F", 3000.00, 468259137951),
    (6, "Giovanna", "F", 3500.00, 864266726741);
    
SELECT * FROM Cliente;

INSERT INTO Funcionario (cod_funcionario, nome_funcionario, sexo_funcionario, salario_funcionario, data_cadfuncionario) VALUES

	(1, "Salvador", "M", 7000.00, "1995-01-03"),
    (2, "Antônio", "M", 6000.00, "1998-05-06"),
    (3, "Antonieta", "F", 6500.00, "1998-08-07"),
    (4, "Eduardo", "F", 4000.00, "2000-06-08"),
    (5, "Leny", "F", 3000.00, "2001-06-08");
    
SELECT * FROM Funcionario;

/* Com base nas tabelas criadas anteriormente, escreva uma consulta que exiba o tipo
se é cliente ou funcionário, o nome, o sexo, a data de cadastro e o RG. */

SELECT 
	"cliente" AS Tipo,
	nome_cliente AS Nome,
    sexo_cliente AS Genero,
    NULL AS data_cadfuncionario,
    rg_cliente AS RG
    
FROM Cliente

UNION ALL

SELECT
	"Funcionario" AS Tipo,
    nome_funcionario AS Nome,
    sexo_funcionario AS Genero,
    DATE_FORMAT(data_cadfuncionario, "%d-%m-%y") AS DataCadastro,
    NULL AS rg_cliente
    
FROM Funcionario;