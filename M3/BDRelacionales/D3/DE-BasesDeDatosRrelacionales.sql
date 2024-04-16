-- 1
-- psql -U postgres
-- 2
CREATE DATABASE desafio_ramon_munoz_024;
-- 3
-- \c desafio_ramon_munoz_024
-- 4
CREATE TABLE clientes (
	email VARCHAR(50),
	nombre VARCHAR,
	telefono VARCHAR(16),
	empresa VARCHAR(50),
	prioridad_cliente SMALLINT
);
--5
-- Inserta datos aleatorios para 5 clientes
INSERT INTO clientes (email, nombre, telefono, empresa, prioridad_cliente)
VALUES
    ('cliente1@example.com', 'Cliente Uno', '123456789', 'Empresa A', 2),
    ('cliente2@example.com', 'Cliente Dos', '987654321', 'Empresa B', 10),
    ('cliente3@example.com', 'Cliente Tres', '555555555', 'Empresa C', 8),
    ('cliente4@example.com', 'Cliente Cuatro', '444444444', 'Empresa A', 1),
    ('cliente5@example.com', 'Cliente Cinco', '666666666', 'Empresa E', 10);
--6
SELECT * FROM clientes ORDER BY prioridad_cliente DESC limit 3;
--7
-- empresas que se repiten 2 veces o mas
SELECT empresa FROM clientes GROUP BY empresa HAVING COUNT(*) >= 2;
-- prioridad q se repite dos veces o mas
SELECT prioridad_cliente FROM clientes GROUP BY prioridad_cliente HAVING COUNT(*) >= 2;
-- tabla con contadores de repeticion para los campos empresas y prioridad
SELECT item, COUNT(item) AS veces_repetido FROM (    SELECT empresa AS item    FROM clientes    GROUP BY empresa    HAVING COUNT(*) >= 2   
     UNION ALL        SELECT CAST(prioridad_cliente AS VARCHAR) AS item    FROM clientes    GROUP BY prioridad_cliente    HAVING COUNT(*) >= 2) AS combined_results GROUP BY item;
-- \q

