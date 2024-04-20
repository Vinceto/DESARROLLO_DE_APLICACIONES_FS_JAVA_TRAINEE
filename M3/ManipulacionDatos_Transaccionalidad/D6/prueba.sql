--crear base de datos
--CREATE DATABASE desafio2_ramon_munoz_444;

--salgo de la consola para importar este archivo
--psql -U postgres -d desafio2_ramon_munoz_444 -f prueba.sql 

--crear tabla inscritos
CREATE TABLE IF NOT EXISTS INSCRITOS(
    cantidad INT, 
    fecha DATE, 
    fuente VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

--Retorno de la importacion
--PS C:\Users\...\DESARROLLO_DE_APLICACIONES_FS_JAVA_TRAINEE\M3\ManipulacionDatos_Transaccionalidad\D6> psql -U postgres -d registro_viajeros -f prueba.sql
-- Password for user postgres: 
-- CREATE TABLE
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1
-- INSERT 0 1

-- PRUEBA
-- Aplicando los conceptos y herramientas aprendidas hasta ahora, crea las querys SQLnecesarias que contesten las siguientes preguntas.

-- 1. ¿Cuántos registros hay?
SELECT COUNT(*) FROM INSCRITOS;
-- desafio2_ramon_munoz_444=# SELECT * FROM INSCRITOS;        
--  cantidad |   fecha    | fuente
-- ----------+------------+---------
--        44 | 2021-01-01 | Blog
--        56 | 2021-01-01 | P├ígina
--        39 | 2021-02-01 | Blog
--        81 | 2021-02-01 | P├ígina
--        12 | 2021-03-01 | Blog
--        91 | 2021-03-01 | P├ígina
--        48 | 2021-04-01 | Blog
--        45 | 2021-04-01 | P├ígina
--        55 | 2021-05-01 | Blog
--        33 | 2021-05-01 | P├ígina
--        18 | 2021-06-01 | Blog
--        12 | 2021-06-01 | P├ígina
--        34 | 2021-07-01 | Blog
--        24 | 2021-07-01 | P├ígina
--        83 | 2021-08-01 | Blog
--        99 | 2021-08-01 | P├ígina
-- (16 rows)

-- 2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM INSCRITOS;
-- desafio2_ramon_munoz_444=# SELECT SUM(cantidad) FROM INSCRITOS;
--  sum
-- -----
--  774
-- (1 row)

-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad? HINT: ocupar subconsultas
SELECT * FROM INSCRITOS WHERE fecha = ( SELECT MIN(fecha) FROM INSCRITOS);
-- desafio2_ramon_munoz_444=# SELECT * FROM INSCRITOS WHERE fecha = ( SELECT MAX(fecha) FROM INSCRITOS);
--  cantidad |   fecha    | fuente
-- ----------+------------+---------
--        83 | 2021-08-01 | Blog
--        99 | 2021-08-01 | P├ígina
-- (2 rows)
SELECT * FROM INSCRITOS ORDER BY fecha DESC LIMIT 3;
-- desafio2_ramon_munoz_444=# SELECT * FROM INSCRITOS ORDER BY fecha DESC LIMIT 3;
--  cantidad |   fecha    | fuente
-- ----------+------------+---------
--        83 | 2021-08-01 | Blog
--        99 | 2021-08-01 | P├ígina
--        24 | 2021-07-01 | P├ígina
-- (3 rows)

-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT i.fecha, SUM(i.cantidad) FROM INSCRITOS as i GROUP BY i.fecha ORDER BY i.fecha;
-- desafio2_ramon_munoz_444=# SELECT i.fecha, SUM(i.cantidad) FROM INSCRITOS as i GROUP BY i.fecha ORDER BY i.fecha;
--    fecha    | sum
-- ------------+-----
--  2021-01-01 | 100
--  2021-02-01 | 120
--  2021-03-01 | 103
--  2021-04-01 |  93
--  2021-05-01 |  88
--  2021-06-01 |  30
--  2021-07-01 |  58
--  2021-08-01 | 182
-- (8 rows)

-- 5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS Total_Inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY Total_Inscritos DESC
LIMIT 1;
-- desafio2_ramon_munoz_444=# SELECT fecha, SUM(cantidad) AS Total_Inscritos
-- desafio2_ramon_munoz_444-# FROM INSCRITOS
-- desafio2_ramon_munoz_444-# GROUP BY fecha
-- desafio2_ramon_munoz_444-# ORDER BY Total_Inscritos DESC
-- desafio2_ramon_munoz_444-# LIMIT 1;
--    fecha    | total_inscritos
-- ------------+-----------------
--  2021-08-01 |             182
-- (1 row)