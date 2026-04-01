USE lawfirm;

-- =============================
-- INCORPORAR LIMIT en CONSULTAS
-- =============================

-- Los 3 abogados con mayor tarifa
SELECT Nombres, Apellidos, Tarifa_hora
FROM abogados
ORDER BY Tarifa_hora DESC
LIMIT 3

-- El caso más reciente
SELECT Titulo, Fecha_apertura
FROM casos
ORDER BY Fecha_apertura DESC
LIMIT 1

-- Los 2 documentos más recientes
SELECT Titulo, Autor, Fecha_creacion
FROM documentos
ORDER BY Fecha_creacion DESC
LIMIT 2

-- ===================
-- LIMIT y PAGINACIÓN
-- ===================

-- Página 1 (registros 1-2)
SELECT Nombres, Apellidos, Tarifa_hora
FROM abogados
ORDER BY Apellidos ASC
LIMIT 2 OFFSET 0

-- Página 2 (registros 3-4)
SELECT Nombres, Apellidos, Tarifa_hora
FROM abogados
ORDER BY Apellidos ASC
LIMIT 2 OFFSET 2



