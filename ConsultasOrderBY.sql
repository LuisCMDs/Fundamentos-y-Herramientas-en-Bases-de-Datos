USE lawfirm;

-- ===================
## CONSULTAS CON ORDER BY
-- ===================

SELECT Nombres, Apellidos, Tarifa_hora 
FROM abogados 
WHERE Tarifa_hora > 150
ORDER BY Tarifa_hora DESC;

SELECT Nombre, Documento 
FROM clientes 
WHERE ID_tipo_cliente = 1 
OR ID_tipo_cliente = 2
ORDER BY Nombre ASC;

SELECT * FROM audiencias 
WHERE Fecha BETWEEN '2024-04-01' AND '2024-04-30'
ORDER BY Fecha ASC;

SELECT Titulo, Autor, Fecha_creacion 
FROM documentos 
WHERE ID_tipo_documento IN (1, 2, 3)
ORDER BY Fecha_creacion DESC;

SELECT Titulo, Fecha_apertura, ID_estado 
FROM casos
ORDER BY Fecha_apertura DESC, Titulo ASC;