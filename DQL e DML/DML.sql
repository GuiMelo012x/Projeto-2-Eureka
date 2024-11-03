-- Inserindo dados na tabela Pessoa
INSERT INTO Pessoa (ID_Pessoa, Nome, Sobrenome, CPF, Email, Telefone, Endereco) VALUES
(1, 'João', 'Silva', '12345678901', 'joao.silva@example.com', '(11) 98765-4321', 'Rua A, 123'),
(2, 'Maria', 'Oliveira', '10987654321', 'maria.oliveira@example.com', '(11) 99876-5432', 'Rua B, 456'),
(3, 'Carlos', 'Pereira', '12312312312', 'carlos.pereira@example.com', '(11) 91234-5678', 'Rua C, 789'),
(4, 'Ana', 'Costa', '32132132100', 'ana.costa@example.com', '(11) 95678-1234', 'Rua D, 321'),
(5, 'Pedro', 'Lima', '45645645645', 'pedro.lima@example.com', '(11) 93456-7890', 'Rua E, 654');

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (ID_Cliente, ID_Pessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Mesa
INSERT INTO Mesa (ID_Mesa, Localizacao, Numero_mesa, Numero_cadeiras, Status) VALUES
(1, 'Área Interna', 1, 4, 'Disponível'),
(2, 'Área Externa', 2, 6, 'Ocupada'),
(3, 'Varanda', 3, 8, 'Reservada'),
(4, 'Área da Piscina', 4, 4, 'Disponível'),
(5, 'Salão Principal', 5, 10, 'Ocupada');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (ID_Pedido, Data, Hora, Tipo, Observacoes, ID_Cliente, ID_Mesa) VALUES
(1, '2024-11-03', '12:00:00', 'Almoço', 'Sem cebola', 1, 1),
(2, '2024-11-03', '13:00:00', 'Jantar', '', 2, 2),
(3, '2024-11-04', '18:00:00', 'Lanche', 'Com muito queijo', 3, 3),
(4, '2024-11-04', '20:00:00', 'Jantar', 'Para viagem', 4, 4),
(5, '2024-11-05', '14:00:00', 'Almoço', '', 5, 5);

-- Inserindo dados na tabela Itens
INSERT INTO Itens (ID_Item, Quantidade, Preco, Ingredientes, ID_Pedido) VALUES
(1, 2, 15.00, 'Arroz, Feijão', 1),
(2, 1, 25.00, 'Picanha', 1),
(3, 1, 10.00, 'Salada', 2),
(4, 1, 20.00, 'Pizza', 2),
(5, 3, 5.00, 'Coca-Cola', 3),
(6, 1, 30.00, 'Churrasco', 4),
(7, 1, 12.00, 'Sanduíche', 5),
(8, 1, 8.00, 'Sopa', 4),
(9, 1, 10.00, 'Bolo', 5);

-- Inserindo dados na tabela Paciente
INSERT INTO Paciente (ID_Paciente, ID_Pessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Medico
INSERT INTO Medico (ID_Medico, CRM, Especializacao, ID_Pessoa) VALUES
(1, '123456', 'Pediatra', 1),
(2, '654321', 'Clínico Geral', 3),
(3, '987654', 'Cardiologista', 4),
(4, '456789', 'Dermatologista', 2),
(5, '321098', 'Oftalmologista', 5);

-- Inserindo dados na tabela Consulta
INSERT INTO Consulta (ID_Consulta, Data_consulta, Hora_consulta, Receita, ID_Paciente, ID_Medico) VALUES
(1, '2024-11-05', '09:00:00', 'Antibiótico', 1, 1),
(2, '2024-11-06', '10:00:00', 'Analgésico', 2, 2),
(3, '2024-11-07', '14:00:00', 'Colírio', 3, 5),
(4, '2024-11-08', '11:00:00', 'Pomada', 4, 4),
(5, '2024-11-09', '15:00:00', 'Exame de sangue', 5, 3);

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (ID_Funcionario, Turno, Cargo, ID_Pessoa) VALUES
(1, 'Matutino', 'Recepcionista', 1),
(2, 'Vespertino', 'Atendente', 2),
(3, 'Noturno', 'Gerente', 3),
(4, 'Matutino', 'Cozinheiro', 4),
(5, 'Vespertino', 'Garçom', 5);

-- Inserindo dados na tabela Recepcao
INSERT INTO Recepcao (ID_Recepcao, Nome_recepcionista, Turno, ID_Funcionario, ID_Paciente) VALUES
(1, 'Ana', 'Matutino', 1, 1),
(2, 'Bruno', 'Vespertino', 2, 2),
(3, 'Carlos', 'Noturno', 3, 3),
(4, 'Diana', 'Matutino', 4, 4),
(5, 'Eduardo', 'Vespertino', 5, 5);

-- Inserindo dados na tabela Lugar
INSERT INTO Lugar (ID_Lugar, Nome, Endereco, Capacidade) VALUES
(1, 'Auditório Central', 'Av. Principal, 100', 200),
(2, 'Sala de Reuniões', 'Rua Secundária, 200', 50),
(3, 'Teatro Municipal', 'Praça da Cultura, 10', 300),
(4, 'Centro de Convenções', 'Av. Brasil, 500', 500),
(5, 'Espaço Gourmet', 'Rua da Gastronomia, 300', 150);

-- Inserindo dados na tabela Evento
INSERT INTO Evento (ID_Evento, Tipo_evento, Data_inicio, Data_fim, Hora_evento, ID_Lugar) VALUES
(1, 'Palestra', '2024-11-10', '2024-11-10', '14:00:00', 1),
(2, 'Workshop', '2024-11-12', '2024-11-12', '10:00:00', 2),
(3, 'Show', '2024-11-15', '2024-11-15', '20:00:00', 3),
(4, 'Feira de Empreendedorismo', '2024-11-18', '2024-11-19', '09:00:00', 4),
(5, 'Congresso de Saúde', '2024-11-25', '2024-11-26', '08:00:00', 5);

-- Inserindo dados na tabela Participante
INSERT INTO Participante (ID_Participante, ID_Pessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Inscricao
INSERT INTO Inscricao (ID_Inscricao, Data_Inscricao, Status, ID_Evento, ID_Participante) VALUES
(1, '2024-11-01', 'Confirmada', 1, 1),
(2, '2024-11-02', 'Pendente', 2, 2),
(3, '2024-11-03', 'Confirmada', 3, 3),
(4, '2024-11-04', 'Cancelada', 4, 4),
(5, '2024-11-05', 'Confirmada', 5, 5);
