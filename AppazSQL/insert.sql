-- Inserindo na tabela 'Endereco'
INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(1, '69919338', 'Rua Platano', 123, NULL, 'Loteamento Joafra','Rio Branco', 'AC');

INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(2, '60860535', 'Travessa Ferreira Lima', 456, NULL, 'Dias Macedo', 'Fortaleza', 'CE');

INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(3, '64002355', 'Rua Empresário Giza', 789, NULL, 'Vila Operária', 'Teresina', 'PI');

INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(4, '58423382', 'Travessa João Tamanduá', 345, 'apto. 3', 'Três Irmãs', 'Campina Grande', 'PB');

INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(5, '66670225', 'Travessa SN-6', 467, NULL, 'Coqueiro', 'Belém', 'PA');

INSERT INTO Endereco(id_endereco, cep, rua, numero, complemento, bairro, cidade, estado)
VALUES(6, '64069160', 'Rua General Luiz Oliveira', 890, NULL, 'Vale do Gavião', 'Teresina', 'PI');

-- Inserindo na tabela 'Causa'
INSERT INTO Causa(id_causa, nome, descricao)
VALUES(1, 'Combate à Violência Infantil', 'Acabar com o abuso, exploração e agressão de crianças');

INSERT INTO Causa(id_causa, nome, descricao)
VALUES(2, 'Luta por Direitos Iguais', 'Instaurar um estado de justiça igualitária');

INSERT INTO Causa(id_causa, nome, descricao)
VALUES(3, 'Retorno de Bens Roubados', 'Devolução de bens roubados aos seus devidos donos');

-- Inserindo na tabela 'Usuario'
INSERT INTO Usuario(id_usuario, nome, email, cpf, telefone, endereco_id)
VALUES(1, 'Pietra Julia Flávia Castro', 'pietrajulia@victorseguros.com.br', '19908237187', '(68) 2725-4795', 1);

INSERT INTO Usuario(id_usuario, nome, email, cpf, telefone, endereco_id)
VALUES(2, 'Lorenzo Nelson Santos', 'lorenzonelsonsantos_@comdados.com', '42826270931', '(47) 3975-6718', 2);

INSERT INTO Usuario(id_usuario, nome, email, cpf, telefone, endereco_id)
VALUES(3, 'Letícia Tatiane Assis', 'leticiatatianeassis-84@metroquali.com.br', '89491814877', '(45) 3989-8708', 3);

-- Inserindo na tabela 'ONG'
INSERT INTO ONG(id_ong, nome, cnpj, email, telefone, responsavel, ano_fundacao, classificacao, endereco_id, causa_id)
VALUES(1, 'Organização Contra a Exploração Infantil', '14543465000101', 'orgconexin@gmail.com', '(17) 3526-1862', 'Heloisa Paiva', 2012, 4.5, 4, 1);

INSERT INTO ONG(id_ong, nome, cnpj, email, telefone, responsavel, ano_fundacao, classificacao, endereco_id, causa_id)
VALUES(2, 'Organização pela Democratização dos Direitos', '94840402000148', 'orgdemdodi@outlook.com', '(17) 2822-9496', 'Isabele Marli', 2015, 4.8, 5, 2);

INSERT INTO ONG(id_ong, nome, cnpj, email, telefone, responsavel, ano_fundacao, classificacao, endereco_id, causa_id)
VALUES(3, 'Organização do Retorno de Bens', '22969561000136', 'orgretbens@gmail.com', '(19) 2507-4702', 'Marcio Luis', 2017, 4.7, 6, 3);

-- Inserindo na tabela 'Preferencia'
INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(1, 1);

INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(1, 2);

INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(2, 3);

INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(3, 1);

INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(3, 2);

INSERT INTO Preferencia(usuario_id, causa_id)
VALUES(3, 3);

-- Inserindo na tabela 'Ajuda'
INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(1, 1, 1);

INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(2, 1, 2);

INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(3, 2, 3);

INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(4, 3, 1);

INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(5, 3, 2);

INSERT INTO Ajuda(id_ajuda, usuario_id, ong_id)
VALUES(6, 3, 3);

-- Inserindo na tabela 'TrabalhoVoluntario'
INSERT INTO TrabalhoVoluntario(tipo, descricao, data_inicio, data_termino, classificacao, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES('Palestra', 'Palestra de conscientação contra exploração infantil', '21/10/2020', '21/11/2020', 4.8, 1, 1, 1);

INSERT INTO TrabalhoVoluntario(tipo, descricao, data_inicio, data_termino, classificacao, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES('Evento de retorno', 'Organização e auxilio de um evento para o retorno de bens roubados', '02/01/2021', '09/01/2021', 4.9, 3, 2, 3);

INSERT INTO TrabalhoVoluntario(tipo, descricao, data_inicio, data_termino, classificacao, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES('Protesto', 'Protesto pacífico em prol da alteração de leis e direitos, que devem ser disponíveis para todos', '23/02/2021', '25/02/2021', 4.2, 5, 3, 2);

-- Inserindo na tabela 'Doacao'
INSERT INTO Doacao(quantia, data_realizada, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES(50.00, '23/12/2020', 2, 1, 2);

INSERT INTO Doacao(quantia, data_realizada, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES(100.00, '27/02/2021', 4, 3, 1);

INSERT INTO Doacao(quantia, data_realizada, ajuda_id, ajuda_usuario_id, ajuda_ong_id)
VALUES(45.00, '06/05/2021', 6, 3, 3);