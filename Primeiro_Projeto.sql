USE ClinicaMedica;

CREATE TABLE Especialidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Medico (
	id_crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    codigo_especialidade INT NOT NULL,
    FOREIGN KEY(codigo_especialidade) REFERENCES Especialidade(id)
);