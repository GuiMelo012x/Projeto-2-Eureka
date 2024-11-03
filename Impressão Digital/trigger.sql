CREATE TRIGGER AlertaAltaDemanda AFTER INSERT ON Consulta
FOR EACH ROW
BEGIN
    DECLARE total_consultas INT;
    SELECT COUNT(*) INTO total_consultas
    FROM Consulta
    WHERE ID_Medico = NEW.ID_Medico;

    IF total_consultas > 50 THEN
        INSERT INTO Alertas (Mensagem, Data_Alerta) 
        VALUES ('Alta demanda na especialidade ' || (SELECT especializacao FROM Medico WHERE ID_Medico = NEW.ID_Medico), NOW());
    END IF;
END;
