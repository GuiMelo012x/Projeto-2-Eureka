-- Pergunta 1
SELECT COUNT(*) AS Total_Inscricoes FROM Inscricao;

-- Pergunta 2
SELECT P.Nome AS Nome_Medico, COUNT(C.ID_Consulta) AS Total_Consultas
     FROM Medico M
     JOIN Pessoa P ON M.ID_Pessoa = P.ID_Pessoa
     LEFT JOIN Consulta C ON M.ID_Medico = C.ID_Medico 
     GROUP BY P.Nome;



-- Pergunta 3
SELECT Hora, COUNT(*) AS Total_Pedidos
FROM Pedido
GROUP BY Hora
ORDER BY Total_Pedidos DESC:



-- Pergunta 4
SELECT P.Nome, R.Turno
FROM Funcionario F
JOIN Pessoa P ON F.ID_Pessoa = P.ID_Pessoa
JOIN Recepcao R ON F.ID_Funcionario = R.ID_Funcionario;

-- Pergunta 5
SELECT Status, COUNT(*) AS Total_Mesas
FROM Mesa
GROUP BY Status;

-- Pergunta 6
SELECT COUNT(DISTINCT P.ID_Paciente) AS Total_Pacientes, M.Especialidade, COUNT(*) AS Total_Consultas
FROM Paciente P
JOIN Consulta C ON P.ID_Paciente = C.ID_Paciente
JOIN Medico M ON C.ID_Medico = M.ID_Medico
GROUP BY M.Especialidade;


-- Pergunta 7 ESTÁ DANDO PROBLEMA
SELECT Lugar.ID_Lugar, Lugar.Nome, Lugar.Capacidade, COUNT(DISTINCT Participante.ID_Participante) AS TotalParticipantes
FROM Lugar
JOIN Evento ON Lugar.ID_Lugar = Evento.ID_Lugar
JOIN Participante ON Evento.ID_Evento = Participante.ID_Evento
GROUP BY Lugar.ID_Lugar, Lugar.Nome, Lugar.Capacidade;


-- Pergunta 8
SELECT I.Ingredientes, COUNT(*) AS Frequencia
FROM Itens I
JOIN Pedido P ON I.ID_Pedido = P.ID_Pedido
GROUP BY I.Ingredientes
ORDER BY Frequencia DESC
LIMIT 5;  -- Para os 5 mais frequentes

-- Pergunta 9
-- total de itens:
SELECT SUM(Quantidade) AS Total_Itens_Servidos FROM Itens;
#ingredientes utilizados
SELECT Ingredientes, SUM(Quantidade) AS Total_Quantidade
FROM Itens
GROUP BY Ingredientes
ORDER BY Total_Quantidade DESC;

-- Pergunta 10
-- total
SELECT COUNT(*) AS Total_Inscricoes FROM Inscricao;
 -- tipos está com erro
