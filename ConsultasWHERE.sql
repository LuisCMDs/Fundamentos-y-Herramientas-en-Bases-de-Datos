USE lawfirm; 

-- ===================
## CONSULTAS CON WHERE
-- ===================

-- 1. ¿Cuáles son todas las actuaciones de un caso específico?
SELECT * FROM actuaciones 
WHERE ID_caso = 1;

-- 2. ¿Qué abogados tienen tarifa por hora superior a 150?
SELECT Nombres, Apellidos, Tarifa_hora FROM abogados 
WHERE Tarifa_hora > 150;

-- 3. ¿Cuáles son los casos de tipo Civil en estado "En proceso"?
SELECT Titulo, Fecha_apertura, Contraparte FROM casos 
WHERE ID_rama_derecho = 1 
AND ID_estado = 3;

-- 4. ¿Qué clientes son personas naturales o empresas PYME?
SELECT Nombre, Documento FROM clientes 
WHERE ID_tipo_cliente = 1 OR ID_tipo_cliente = 2;

-- 5. ¿Cuáles son las audiencias programadas en abril de 2024?
SELECT * FROM audiencias 
WHERE Fecha BETWEEN '2024-04-01' AND '2024-04-30';

-- 6. ¿Qué documentos son de tipo Contrato, Demanda o Recurso?
SELECT Titulo, Autor, Fecha_creacion FROM documentos 
WHERE ID_tipo_documento IN (1, 2, 3);

-- 7. ¿Cuáles son los precedentes legales con resúmenes que contienen "propiedad intelectual" o "derecho de autor"?
SELECT Tema, Resumen FROM precedentes 
WHERE Resumen LIKE '%propiedad intelectual%' OR Resumen LIKE '%derecho de autor%';

-- 8. ¿Qué actuaciones procesales no tienen resultado registrado?
SELECT ID_caso, Fecha, Descripcion FROM actuaciones 
WHERE Resultado IS NULL;

-- 9. ¿Cuáles son los casos ordenados por fecha de apertura descendente?
SELECT Titulo, Fecha_apertura, ID_estado FROM casos 
ORDER BY Fecha_apertura DESC;

-- 10. ¿Cuál es el porcentaje de éxito (casos ganados) por abogado y tipo de caso?
## -------------