DELIMITER //
CREATE PROCEDURE AtualizarConsultasAntigas()
BEGIN
    UPDATE Consulta
    SET Receita = CONCAT(Receita, ' - Finalizada')
    WHERE Data_consulta < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
END //
DELIMITER ;
