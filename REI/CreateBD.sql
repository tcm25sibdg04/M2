CREATE TABLE Especialidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Medico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    id_especialidade INT
);

CREATE TABLE Paciente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cc VARCHAR(20) UNIQUE NOT NULL,
    num_saude VARCHAR(20) UNIQUE NOT NULL,
    seguro VARCHAR(50),
    telefone_extra VARCHAR(20)
);

CREATE TABLE Servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Consulta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    estado VARCHAR(20) CHECK (estado IN ('Agendada', 'Realizada', 'Cancelada')),
    id_paciente INT,
    id_medico INT,
    id_servico INT
);
