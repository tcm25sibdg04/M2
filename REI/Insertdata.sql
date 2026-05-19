INSERT INTO Especialidade (nome) VALUES 
('Cardiologia'), 
('Clínica Geral');


INSERT INTO Medico (nome, cedula, id_especialidade) VALUES 
('Dr. João Silva', '12345', 1),
('Dra. Ana Costa', '67890', 2);


INSERT INTO Paciente (nome, nascimento, telefone, cc, num_saude, seguro, telefone_extra) VALUES 
('Carlos Pereira', '1985-04-12', '910000001', '11111111', '222222222', 'Seguro X', NULL),
('Marta Gomes', '1990-10-25', '920000002', '33333333', '444444444', NULL, '930000003');

INSERT INTO Servico (nome, preco) VALUES 
('Consulta de Rotina', 50.00),
('Eletrocardiograma', 35.00);


INSERT INTO Consulta (data_hora, estado, id_paciente, id_medico, id_servico) VALUES 
('2024-06-15 10:00:00', 'Agendada', 1, 1, 2),
('2024-06-15 14:30:00', 'Realizada', 2, 2, 1);
