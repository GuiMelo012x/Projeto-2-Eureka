DELIMITER //
CREATE PROCEDURE RegistrarInscricao(
    IN p_evento_id INT,
    IN p_participante_id INT,
    OUT mensagem VARCHAR(255)
)
BEGIN
    DECLARE capacidade_atual INT;

    -- Verifica a capacidade disponível do evento
    SELECT Lugar.Capacidade - COUNT(Inscricao.ID_Inscricao)
    INTO capacidade_atual
    FROM Evento
    LEFT JOIN Inscricao ON Evento.ID_Evento = Inscricao.ID_Evento
    JOIN Lugar ON Evento.ID_Lugar = Lugar.ID_Lugar
    WHERE Evento.ID_Evento = p_evento_id
    GROUP BY Lugar.Capacidade;

    -- Condicional para verificar se há espaço
    IF capacidade_atual > 0 THEN
        INSERT INTO Inscricao (Data_Inscricao, Status, ID_Evento, ID_Participante)
        VALUES (CURDATE(), 'Confirmada', p_evento_id, p_participante_id);
        SET mensagem = 'Inscrição realizada com sucesso.';
    ELSE
        SET mensagem = 'Evento lotado! Não é possível realizar a inscrição.';
    END IF;
END //
DELIMITER ;
