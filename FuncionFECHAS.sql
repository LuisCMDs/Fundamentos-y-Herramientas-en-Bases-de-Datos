USE lawfirm;

-- *******************************
-- IMPLEMENTAR funciones de FECHAS
-- *******************************

-- Atraer los datos de año, mes y día de la fecha de apertura de casos
SELECT Titulo, YEAR(Fecha_apertura) AS Año, MONTH(Fecha_apertura) AS Mes, DAY(Fecha_apertura) AS Dia
FROM casos

-- Nombre del mes de cada caso
SELECT Titulo, MONTHNAME(Fecha_apertura) AS Mes
FROM casos

-- !!!!!!!!!!!!!!!!!!!!!
-- CALCULOS ENTRE FECHAS
-- ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡

-- cuantos dias hay transcurridos desde que se abreio cada caso?
SELECT Titulo, Fecha_apertura, DATEDIFF(CURDATE(), Fecha_apertura) AS Dias_transcurridos
FROM casos

-- Días restantes hasta la fecha estimada de conclusión
SELECT Titulo, Fecha_estimada, DATEDIFF(Fecha_estimada, CURDATE()) AS Dias_restantes
FROM casos
WHERE Fecha_estimada IS NOT NULL



