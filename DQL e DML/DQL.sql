-- Pergunta 1:
-- Qual o total arrecadado com as inscrições dos eventos realizados?
SELECT COUNT(*) * 50 AS Total_Arrecadado
FROM Inscricao 
WHERE Status = 'Confirmada';

-- Pergunta 2:
-- Quantas consultas foram realizadas por cada médico durante o evento?
SELECT m.ID_Medico, COUNT(c.ID_Consulta) AS Total_Consultas
FROM Medico m
LEFT JOIN Consulta c ON m.ID_Medico = c.ID_Medico
GROUP BY m.ID_Medico;

-- Pergunta 3:
-- Qual é o horário de maior movimento de pedidos no restaurante?
SELECT Hora, COUNT(*) AS Total_Pedidos
FROM Pedido
GROUP BY Hora;

-- Pergunta 4:
-- Quais funcionários trabalharam na recepção durante o evento e em quais turnos?
SELECT f.ID_Funcionario, f.Turno, r.Nome_recepcionista
FROM Funcionario f
JOIN Recepcao r ON f.ID_Funcionario = r.ID_Funcionario;

-- Pergunta 5:
-- Quantas mesas foram ocupadas e reservadas ao longo do evento?
SELECT Status, COUNT(*) AS Total_Mesas
FROM Mesa
WHERE Status IN ('Ocupada', 'Reservada')
GROUP BY Status;

-- Pergunta 6:
-- Quantos pacientes participaram do evento e quais especialidades médicas foram mais procuradas?
SELECT COUNT(DISTINCT p.ID_Paciente) AS Total_Pacientes, 
       m.Especializacao
FROM Paciente p
JOIN Consulta c ON p.ID_Paciente = c.ID_Paciente
JOIN Medico m ON c.ID_Medico = m.ID_Medico
GROUP BY m.Especializacao;

-- Pergunta 7:
-- Qual foi a capacidade de cada local utilizado no evento e quantas pessoas participaram em cada um?
SELECT l.Nome, l.Capacidade, COUNT(i.ID_Participante) AS Participantes
FROM Lugar l
LEFT JOIN Evento e ON l.ID_Lugar = e.ID_Lugar
LEFT JOIN Inscricao i ON e.ID_Evento = i.ID_Evento
GROUP BY l.ID_Lugar;

-- Pergunta 8:
-- Quais foram os pedidos com maior frequência de consumo?
SELECT i.ID_Item, i.Nome_Item, COUNT(*) AS Total_Vendas
FROM Itens i
JOIN Pedido p ON i.ID_Pedido = p.ID_Pedido
GROUP BY i.ID_Item, i.Nome_Item
ORDER BY Total_Vendas DESC;

-- Pergunta 9:
-- Qual foi o número total de itens servidos no restaurante, e quais foram os ingredientes mais utilizados?
SELECT COUNT(*) AS Total_Itens_Servidos
FROM Itens;

SELECT Ingredientes, COUNT(*) AS Total_Utilizados
FROM Itens
GROUP BY Ingredientes
ORDER BY Total_Utilizados DESC;

-- Pergunta 10:
-- Qual foi o número total de inscrições no evento e quantas foram realizadas por tipo de evento (seminários, palestras, consultas médicas)?
SELECT COUNT(*) AS Total_Inscricoes
FROM Inscricao;

SELECT e.Tipo_evento, COUNT(i.ID_Inscricao) AS Total_Inscricoes
FROM Evento e
LEFT JOIN Inscricao i ON e.ID_Evento = i.ID_Evento
GROUP BY e.Tipo_evento;
