DELIMITER //
CREATE PROCEDURE AltaDemandaPorMedicos(IN p_mes INT, IN p_ano INT)
BEGIN
    SELECT 
        Medico.ID_Medico,
        Medico.Especializacao,
        COUNT(Consulta.ID_Consulta) AS Total_Consultas
    FROM Medico
    JOIN Consulta ON Medico.ID_Medico = Consulta.ID_Medico
    WHERE MONTH(Consulta.Data_consulta) = p_mes AND YEAR(Consulta.Data_consulta) = p_ano
    GROUP BY Medico.ID_Medico
    HAVING Total_Consultas > 10;
END //
DELIMITER ;
