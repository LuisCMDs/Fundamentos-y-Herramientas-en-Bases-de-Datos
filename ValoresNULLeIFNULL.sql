USE lawfirm;

-- ===========================
-- FILTRAR por NULL y NOT NULL
-- ===========================

-- Casos sin fecha estimada de conclusión
SELECT Titulo, Fecha_apertura
FROM casos
WHERE Fecha_estimada IS NULL

-- Casos que sí tienen fecha estimada
SELECT Titulo, Fecha_apertura, Fecha_estimada
FROM casos
WHERE Fecha_estimada IS NOT NULL

-- Clientes sin email registrado
SELECT Nombre, Telefono
FROM clientes
WHERE Email IS NULL

-- Audiencias sin resultado real registrado
SELECT ID_caso, Fecha, Proposito
FROM audiencias
WHERE Resultado_real IS NULL;

-- =================
-- COALESCE o IFNULL
-- =================

-- IFNULL: si no tiene email mostrar "Sin email"
SELECT Nombre, IFNULL(Email, 'Sin email') AS Email
FROM clientes

-- IFNULL: si no tiene fecha estimada mostrar "Sin fecha"
SELECT Titulo, IFNULL(Fecha_estimada, 'Sin fecha') AS Fecha_estimada
FROM casos;
