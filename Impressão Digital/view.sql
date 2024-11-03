CREATE VIEW Relatorio_Semanal AS
SELECT
    DATE_TRUNC('week', Evento.data_inicio) AS Semana,
    COUNT(DISTINCT Inscricao.ID_Inscricao) AS Total_Inscricoes,
    COUNT(DISTINCT Participante.ID_Participante) AS Total_Participantes,
    COUNT(DISTINCT Consulta.ID_Consulta) AS Total_Consultas,
    COUNT(DISTINCT Pedido.ID_Pedido) AS Total_Pedidos_Restaurante,
    COUNT(DISTINCT Mesa.ID_Mesa) AS Mesas_Ocupadas,
    COUNT(DISTINCT Lugar.ID_Lugar) AS Locais_Utilizados,
    SUM(Itens.Quantidade) AS Total_Itens_Consumidos,
    SUM(Itens.Preco * Itens.Quantidade) AS Receita_Total_Restaurante
FROM
    Evento
    LEFT JOIN Inscricao ON Evento.ID_Evento = Inscricao.ID_Evento
    LEFT JOIN Participante ON Inscricao.ID_Participante = Participante.ID_Participante
    LEFT JOIN Consulta ON Evento.ID_Evento = Consulta.ID_Evento
    LEFT JOIN Pedido ON Evento.ID_Evento = Pedido.ID_Evento
    LEFT JOIN Mesa ON Pedido.ID_Mesa = Mesa.ID_Mesa
    LEFT JOIN Lugar ON Evento.ID_Lugar = Lugar.ID_Lugar
    LEFT JOIN Itens ON Pedido.ID_Pedido = Itens.ID_Pedido
WHERE
    Evento.data_inicio >= NOW() - INTERVAL '1 week'
GROUP BY
    Semana
ORDER BY
    Semana DESC;
