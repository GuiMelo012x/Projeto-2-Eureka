INSERT INTO Pessoa (ID_Pessoa, Nome, Sobrenome, CPF, Email, Telefone, Endereco)
VALUES 
    (101, 'Ana', 'Silva', '12345678901', 'ana.silva@email.com', '(81) 99999-0001', 'Rua A, 123'),
    (102, 'Carlos', 'Souza', '23456789012', 'carlos.souza@email.com', '(81) 99999-0002', 'Rua B, 456'),
    (103, 'Mariana', 'Lima', '34567890123', 'mariana.lima@email.com', '(81) 99999-0003', 'Rua C, 789');

INSERT INTO Funcionario (ID_Funcionario, ID_Pessoa, Cargo, Turno)
VALUES 
    (1, 101, 'Recepcionista', 'Manhã'),
    (2, 102, 'Recepcionista', 'Tarde'),
    (3, 103, 'Médica', 'Integral');


INSERT INTO Paciente (ID_Paciente, ID_Pessoa)
VALUES 
    (1, 101),
    (2, 102),
    (3, 103);



INSERT INTO Participante (ID_Participante, ID_Pessoa)
VALUES 
    (1, 101),
    (2, 102),
    (3, 103);



INSERT INTO Evento (ID_Evento, tipo_evento, data_inicio, data_fim, hora_evento)
VALUES 
    (1, 'Seminário', '2024-11-05', '2024-11-05', '14:00:00'),
    (2, 'Palestra', '2024-11-06', '2024-11-06', '10:00:00'),
    (3, 'Consulta Médica', '2024-11-05', '2024-11-05', '09:00:00');



INSERT INTO Consulta (ID_Consulta, ID_Paciente, ID_Medico, data_consulta, hora_consulta, Receita)
VALUES 
    (1, 1, 3, '2024-11-05', '09:30:00', 'Paracetamol 500mg'),
    (2, 2, 3, '2024-11-05', '10:00:00', 'Ibuprofeno 400mg'),
    (3, 3, 3, '2024-11-05', '11:00:00', 'Amoxicilina 500mg');


INSERT INTO Pedido (ID_Pedido, Data, Hora, Observacao)
VALUES 
    (1, '2024-11-05', '12:00:00', 'Sem restrições'),
    (2, '2024-11-05', '12:30:00', 'Sem restrições'),
    (3, '2024-11-05', '13:00:00', 'Intolerância à lactose');



INSERT INTO Mesa (ID_Mesa, Numero_cadeiras, Numero_mesa, Localizacao, Status)
VALUES 
    (1, 4, 1, 'Área interna', 'Ocupada'),
    (2, 2, 2, 'Área externa', 'Reservada'),
    (3, 6, 3, 'Área interna', 'Disponível');


INSERT INTO Lugar (ID_Lugar, Nome, Endereco, Capacidade)
VALUES 
    (1, 'Auditório A', 'Rua do Hospital, 123', 100),
    (2, 'Sala de Conferência', 'Rua do Hospital, 123', 50),
    (3, 'Consultório 101', 'Rua do Hospital, 123', 1);


INSERT INTO Itens (ID_Item, ID_Pedido, Quantidade, Ingredientes, Preco)
VALUES 
    (1, 1, 2, 'Arroz, Feijão, Carne', 15.00),
    (2, 2, 1, 'Salada Caesar', 10.00),
    (3, 3, 3, 'Suco de Laranja', 8.00);


INSERT INTO Inscricao (ID_Inscricao, ID_Participante, Data_Inscricao, Status)
VALUES 
    (1, 201, '2024-10-20', 'Confirmada'),
    (2, 202, '2024-10-21', 'Confirmada'),
    (3, 203, '2024-10-22', 'Pendente');


