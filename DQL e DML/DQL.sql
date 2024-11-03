-- Pergunta 1
SELECT SUM(Inscricao.Valor) AS TotalArrecadado
FROM Inscricao
WHERE Inscricao.Status = 'Realizado';

-- Pergunta 2
SELECT Medico.ID_Medico, Pessoa.Nome, COUNT(Consulta.ID_Consulta) AS TotalConsultas
FROM Consulta
JOIN Medico ON Consulta.ID_Medico = Medico.ID_Medico
JOIN Pessoa ON Medico.ID_Pessoa = Pessoa.ID_Pessoa
GROUP BY Medico.ID_Medico, Pessoa.Nome
ORDER BY TotalConsultas DESC;


-- Pergunta 3
SELECT Pedido.Hora, COUNT(Pedido.ID_Pedido) AS TotalPedidos
FROM Pedido
GROUP BY Pedido.Hora
ORDER BY TotalPedidos DESC
LIMIT 1;


-- Pergunta 4
SELECT Funcionario.ID_Funcionario, Pessoa.Nome, Recepcao.Turno
FROM Recepcao
JOIN Funcionario ON Recepcao.ID_Funcionario = Funcionario.ID_Funcionario
JOIN Pessoa ON Funcionario.ID_Pessoa = Pessoa.ID_Pessoa;


-- Pergunta 5
SELECT Mesa.Status, COUNT(Mesa.ID_Mesa) AS QuantidadeMesas
FROM Mesa
WHERE Mesa.Status IN ('Ocupada', 'Reservada')
GROUP BY Mesa.Status;


-- Pergunta 6
SELECT COUNT(DISTINCT Consulta.ID_Paciente) AS TotalPacientes, Medico.Especializacao, COUNT(Consulta.ID_Consulta) AS TotalConsultas
FROM Consulta
JOIN Medico ON Consulta.ID_Medico = Medico.ID_Medico
GROUP BY Medico.Especializacao
ORDER BY TotalConsultas DESC;


-- Pergunta 7
SELECT Lugar.ID_Lugar, Lugar.Nome, Lugar.Capacidade, COUNT(DISTINCT Participante.ID_Participante) AS TotalParticipantes
FROM Lugar
JOIN Evento ON Lugar.ID_Lugar = Evento.ID_Lugar
JOIN Participante ON Evento.ID_Evento = Participante.ID_Evento
GROUP BY Lugar.ID_Lugar, Lugar.Nome, Lugar.Capacidade;


-- Pergunta 8
SELECT Itens.ID_Item, COUNT(Itens.ID_Pedido) AS FrequenciaConsumo
FROM Itens
GROUP BY Itens.ID_Item
ORDER BY FrequenciaConsumo DESC;


-- Pergunta 9
SELECT SUM(Itens.Quantidade) AS TotalItensServidos, Itens.Ingredientes, COUNT(Itens.ID_Item) AS FrequenciaIngrediente
FROM Itens
GROUP BY Itens.Ingredientes
ORDER BY FrequenciaIngrediente DESC;


-- Pergunta 10
SELECT Evento.tipo_evento, COUNT(Inscricao.ID_Inscricao) AS TotalInscricoes
FROM Inscricao
JOIN Evento ON Inscricao.ID_Evento = Evento.ID_Evento
GROUP BY Evento.tipo_evento;
