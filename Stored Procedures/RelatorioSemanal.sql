DELIMITER //
CREATE PROCEDURE RelatorioSemanal()
BEGIN
    SELECT 
        DATE_FORMAT(Evento.data_inicio, '%Y-%u') AS Semana,
        COUNT(DISTINCT Inscricao.ID_Inscricao) AS Total_Inscricoes,
        COUNT(DISTINCT Consulta.ID_Consulta) AS Total_Consultas,
        COUNT(DISTINCT Pedido.ID_Pedido) AS Total_Pedidos,
        SUM(Itens.Quantidade) AS Total_Itens,
        SUM(Itens.Preco * Itens.Quantidade) AS Receita_Total
    FROM Evento
    LEFT JOIN Inscricao ON Evento.ID_Evento = Inscricao.ID_Evento
    LEFT JOIN Consulta ON Evento.ID_Evento = Consulta.ID_Evento
    LEFT JOIN Pedido ON Evento.ID_Evento = Pedido.ID_Evento
    LEFT JOIN Itens ON Pedido.ID_Pedido = Itens.ID_Pedido
    WHERE Evento.data_inicio >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK)
    GROUP BY Semana
    ORDER BY Semana DESC;
END //
DELIMITER ;
