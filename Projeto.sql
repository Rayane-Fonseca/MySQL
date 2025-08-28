CREATE TABLE Pacientes (
	id_paciente   INT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    idade         INT CHECK (age > 0),
    genero        CHAR(1) CHECK (genero IN ("M", "F")),
    diagnostico   VARCHAR(100)
);
    
INSERT INTO Pacientes (id_paciente, idade, genero, diagnostico) VALUES

(1, "Gissele", 17, "F", "Maluca"),
(2, "Isabelle", 19, "F", "Falante"),
(3, "Yasmin", 19, "F", "TI");

SELECT id_paciente, name, idade, genero, diagnostico
FROM Pacientes;