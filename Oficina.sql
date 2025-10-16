CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

CREATE TABLE IF NOT EXISTS Carros (
    placa VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    ano_fabricacao INT NOT NULL
);

/* Cadastrar novos veículos que chegam para manutenção. */

INSERT INTO Carros (placa, marca, modelo, ano_fabricacao)
VALUES
    ('PDM5C09', 'Volkswagen', 'T-Cross', 2026),
    ('LSA8R31', 'Land Rover', 'Discovery', 2025),
    ('CWH6A06', 'Volkswagen', 'Nivus', 2025),
    ('XWW1N45', 'Fiat', 'Fastback', 2025),
    ('JIQ9R24', 'Jeep', 'Renegade', 2025);

SELECT * FROM Carros;

/* Atualizar os dados de um veículo específico, como o modelo, quando necessário. */

UPDATE Carros SET modelo = 'Defender' WHERE placa = 'LSA8R31';

/* Remover registros de veículos que foram entregues ou descartados. */

DELETE FROM Carros WHERE placa = "CWH6A06";

/* Criar uma visão (view) para mostrar apenas os veículos fabricados
 a partir do ano 2000, para controle dos atendimentos recentes. */

CREATE VIEW View_Carros AS 
SELECT placa, marca, modelo, ano_fabricacao
FROM Carros WHERE ano_fabricacao >=2025;

/* Adicionar uma coluna para guardar o valor aproximado do veículo 
baseado na tabela FIPE. */

ALTER TABLE Carros
ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo;

/* Atualizar os valores dessa coluna para diversos veículos 
simultaneamente. */

UPDATE Carros
SET tabela_fipe = CASE placa
  WHEN "PDM5C09" THEN '119.990'
  WHEN "LSA8R31" THEN '668.259'
  WHEN "XWW1N45" THEN '171.990'
  WHEN "JIQ9R24" THEN '113.259'
END;

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Carros;