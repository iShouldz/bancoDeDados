SELECT CURDATE() AS 'Data atual';

SELECT curtime() AS 'Hora Atual';

#Range de data, em boleto
SELECT date_add(CURDATE(), INTERVAL 3 DAY) AS 'Data limite!';

SELECT date_sub(CURDATE(), INTERVAL 10 DAY) AS 'Data de matricula';

SELECT datediff(CURDATE(), date_sub(CURDATE(), INTERVAL 10 DAY)) AS 'Dias em atraso';

SELECT date_format(CURDATE(), '%d/%m/%Y ') AS 'Data atual';