USE lawfirm; 

-- *************************************
## CONSULTAS JOIN con diversas CLAUSULAS
-- *************************************

-- 1. ¿Qué abogado lleva casos activos?		[INNER JOIN + WHERE]
SELECT Titulo, Fecha_apertura, Nombres, Apellidos, Tarifa_hora FROM casos
INNER JOIN abogados ON casos.ID_abogado_principal = abogados.ID
INNER JOIN estados_caso ON casos.ID_estado = estados_caso.ID
WHERE Estado = 'Activo' -- Hay 6 estados: Activo, Cerrado, En espera, Ganado, Perdido y Conciliado
## Busca los casos que estan en estado 'Activo' y muestra el abogado principal
## que se le asignó a cada caso. Solo apareceran los casos que sí tienen un abogado asignado


-- 2. ¿Qué clientes tienen casos y cuáles no?		[LEFT JOIN + ORDER BY]
SELECT Nombre, Email, Titulo, Fecha_apertura FROM clientes
LEFT JOIN casos ON clientes.ID = casos.ID_cliente
ORDER BY Nombre ASC, Fecha_apertura DESC
## Devuelve en pantalla todos los clientes y los casos que tienen registrados
## Como todos tienen casos registrados, no devuelve clientes que no tengan casos.


-- 3. ¿Qué clientes nunca han tenido un caso?		[LEFT JOIN + IS NULL]
SELECT Nombre, Telefono, Email FROM clientes
LEFT JOIN casos ON clientes.ID = casos.ID_cliente
WHERE casos.ID IS NULL
## Todos los clientes tienen casos registrados, por lo que no devuelve nombres en pantalla


-- 4. ¿Qué abogados tienen solo un caso en total?		[INNER JOIN + GROUP BY + HAVING]
SELECT Nombres, Apellidos, COUNT(casos.ID) AS Total_casos FROM abogados
INNER JOIN casos ON abogados.ID = casos.ID_abogado_principal
GROUP BY abogados.ID, Nombres, Apellidos
HAVING Total_casos = 1
## Sirve para contar los casos que tiene asignado cada abogado como principal y
## la clausula HAVING filtra solo los que tienen 1 caso (todos)


-- 5. ¿Quw audiencias hubo en el primer TRIMESTRE de 2024? [INNER JOIN + BETWEEN]
SELECT Titulo, Tipo_audiencia, audiencias.Fecha, Lugar
FROM audiencias
INNER JOIN casos ON audiencias.ID_caso = casos.ID
INNER JOIN tipos_audiencia ON audiencias.ID_tipo_audiencia = tipos_audiencia.ID
WHERE audiencias.Fecha BETWEEN '2024-01-01' AND '2024-03-30'
## Devuelve en pantalla las audiencias programadas en el primer trimestre de 2024
## junto a el caso, el lugar y tipo de audiencia al que pertenecen


-- 6. ¿Cuál es la tarifa promedio por especialidad? [INNER JOIN + GROUP BYY + AGREGAcIÓ]
SELECT Especialidad, COUNT(abogados.ID) AS Total_abogados, ROUND(AVG(Tarifa_hora), 2) AS Tarifa_promedio, MIN(Tarifa_hora) AS Tarifa_minima, MAX(Tarifa_hora) AS Tarifa_maxima FROM abogados
INNER JOIN especialidades ON abogados.ID_especialidad = especialidades.ID
GROUP BY especialidades.ID, Especialidad
ORDER BY Tarifa_promedio DESC
## Como solo hay un abogado por especialidad, la tarifa promedio, minima y máxima son iguales.
## Pero si hubieran más abogados las tarifas cambiarían


-- 7. ¿Qué documentos de tipo ""demanda"" están asociados a qué casos?		[INNER JOIN + LIKE]
SELECT casos.Titulo AS Caso, documentos.Titulo AS Documento, Autor, Fecha_creacion, Estado
FROM documentos
INNER JOIN casos ON documentos.ID_caso = casos.ID
INNER JOIN estados_documento ON documentos.ID_estado = estados_documento.ID
WHERE documentos.Titulo LIKE '%demanda%' -- Puede ser contrato, demanda, recurso.... segun como esté en la tabla docuemtnos
-- - - - - - - - - - - - - SELECT * FROM documentos (necesitaba recordar que titulos habia)
## Va a mostrar documentos que de título contenga la palabra 'demanda'
## y muestra el caso al que pertenecen y su estado actual


-- 8. ¿Qué abogados cobran más que el promedio del bufete de abogados?		[JOIN + SUBCONSuLTA]
SELECT Nombres, Apellidos, Especialidad, Tarifa_hora, ROUND((SELECT AVG(Tarifa_hora) FROM abogados), 2) AS Tarifa_promedio
FROM abogados
INNER JOIN especialidades ON abogados.ID_especialidad = especialidades.ID
WHERE Tarifa_hora > (SELECT AVG(Tarifa_hora) FROM abogados)
ORDER BY Tarifa_hora ASC
## Devuelve en pantalla los abogados los cuales su tarifa por hora supera el promedio
## del bufete de abogados y es calculado usando una subconsulta en el WHERE


-- 9.  ¿Cuántos días lleva abierto cada caso? [LEFT JOIN + FUNCIONES DE FECHA]
SELECT casos.Titulo, clientes.Nombre AS Cliente, Nombres AS Abogado, Apellidos, Fecha_apertura, DATEDIFF(CURDATE(), Fecha_apertura) AS Dias_abierto, IFNULL(Estado, 'Sin estado') AS Estado FROM casos
LEFT JOIN clientes ON casos.ID_cliente = clientes.ID
LEFT JOIN abogados ON casos.ID_abogado_principal = abogados.ID
LEFT JOIN estados_caso ON casos.ID_estado = estados_caso.ID
ORDER BY Dias_abierto ASC
## Hace el calculo de cuántos días lleva abierto cada caso usando la funcion de fecha DATEDIFF
## Asdemas, muuestra el cliente y abogado asignado aunque alguno sea NULL. (ninguno es null)



-- 10. ¿Qué clientes tienen más casos y en qué rama legal? [INNER JOIN + GROUP BY + HAVIING]
SELECT Nombre AS Cliente, Rama_derecho, COUNT(casos.ID) AS Total_casos, MIN(Fecha_apertura) AS Primer_caso, MAX(Fecha_apertura) AS Ultimo_caso
FROM casos
INNER JOIN clientes ON casos.ID_cliente = clientes.ID
INNER JOIN ramas_derecho ON casos.ID_rama_derecho = ramas_derecho.ID
GROUP BY clientes.ID, Nombre, ramas_derecho.ID, Rama_derecho
HAVING Total_casos >= 1
## Va mostrar los casos por cliente y rama del derecho para identificar
## que clientes son más recurrentes y en qué área legal se mueven



 



