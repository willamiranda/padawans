-- Criação da tabela 'Usuario'
CREATE TABLE Usuario(
	id_usuario INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	cpf CHAR(11) NOT NULL UNIQUE,
	telefone VARCHAR(20),
	endereco_id INT NOT NULL,
	PRIMARY KEY(id_usuario)
);

-- Criação da tabela 'ONG'
CREATE TABLE ONG(
	id_ong INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cnpj CHAR(14) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	telefone VARCHAR(20) NOT NULL,
	responsavel VARCHAR(50) NOT NULL,
	ano_fundacao SMALLINT NOT NULL,
	classificacao REAL NOT NULL,
	endereco_id INT NOT NULL,
	causa_id INT NOT NULL,
	PRIMARY KEY(id_ong)
);

-- Criação da tabela 'Endereco'
CREATE TABLE Endereco(
	id_endereco INT NOT NULL,
	cep CHAR(8) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero SMALLINT NOT NULL,
	complemento VARCHAR(15) NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado CHAR(2) NOT NULL,
	PRIMARY KEY(id_endereco)
);

-- Criação da tabela 'Causa'
CREATE TABLE Causa(
	id_causa INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	descricao TEXT NOT NULL,
	PRIMARY KEY(id_causa)
);

-- Criação da tabela 'Preferencia'
CREATE TABLE Preferencia(
	usuario_id INT NOT NULL,
	causa_id INT NOT NULL
);

-- Criação da tabela 'Ajuda'
CREATE TABLE Ajuda(
	id_ajuda INT NOT NULL,
	usuario_id INT NOT NULL,
	ong_id INT NOT NULL,
	PRIMARY KEY(id_ajuda)
);

-- Criação da tabela 'TrabalhoVoluntario'
CREATE TABLE TrabalhoVoluntario(
	tipo VARCHAR(30) NOT NULL,
	descricao TEXT NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE NOT NULL,
	classificacao REAL NOT NULL,
	ajuda_id INT NOT NULL,
	ajuda_usuario_id INT NOT NULL,
	ajuda_ong_id INT NOT NULL
);

-- Criação da tabela 'Doacao'
CREATE TABLE Doacao(
	quantia REAL NOT NULL,
	data_realizada DATE NOT NULL,
	ajuda_id INT NOT NULL,
	ajuda_usuario_id INT NOT NULL,
	ajuda_ong_id INT NOT NULL
);

ALTER TABLE Usuario
	ADD FOREIGN KEY (endereco_id) REFERENCES Endereco(id_endereco);
	
ALTER TABLE ONG
	ADD FOREIGN KEY (endereco_id) REFERENCES Endereco(id_endereco),
	ADD FOREIGN KEY (causa_id) REFERENCES Causa(id_causa);
	
ALTER TABLE Preferencia
	ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario),
	ADD FOREIGN KEY (causa_id) REFERENCES Causa(id_causa);
	
ALTER TABLE Ajuda
	ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario),
	ADD FOREIGN KEY (ong_id) REFERENCES ONG(id_ong);
	
ALTER TABLE TrabalhoVoluntario
	ADD FOREIGN KEY (ajuda_id) REFERENCES Ajuda(id_ajuda),
	ADD FOREIGN KEY (ajuda_usuario_id) REFERENCES Usuario(id_usuario),
	ADD FOREIGN KEY (ajuda_ong_id) REFERENCES ONG(id_ong);
	
ALTER TABLE Doacao
	ADD FOREIGN KEY (ajuda_id) REFERENCES Ajuda(id_ajuda),
	ADD FOREIGN KEY (ajuda_usuario_id) REFERENCES Usuario(id_usuario),
	ADD FOREIGN KEY (ajuda_ong_id) REFERENCES ONG(id_ong);
	
	