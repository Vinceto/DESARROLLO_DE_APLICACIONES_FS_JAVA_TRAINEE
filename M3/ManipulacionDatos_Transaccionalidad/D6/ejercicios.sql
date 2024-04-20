--crear base de datos
--CREATE DATABASE transacciones;

--salgo de la consola para importar este archivo
--psql -U postgres -d desafio2_ramon_munoz_444 -f prueba.sql 

--entro a la consola de postgres
--psql -U postgres


-- 1. Creación de la tabla:
CREATE TABLE cuentas (numero_cuenta int not null unique primary key,
balance float check(balance >= 0.00));
-- 2. Inserción de registros:
INSERT INTO cuentas (numero_cuenta, balance) values (1, 1000);
INSERT INTO cuentas (numero_cuenta, balance) values (2, 1000);
-- 3. Transacción controlada donde pasamos los $1000 de la cuenta 1 a la cuenta 2.
begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
-- 4. Confirmamos la transacción:
commit;

-- Paso 1: Nos conectamos a la base de datos
-- \c transacciones;

-- Paso 2: En la tabla cuentas realizamos una transacción en donde transferimos $1000 de la cuenta 1 a la cuenta 2 y no obtuvimos ningún error. Sin embargo, podemos verificar que en las transacciones que terminan en error no se altera el estado de nuestros datos. ¿Y cómo lo hacemos?
-- Ejecuta el siguiente código en tu terminal.
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
ROLLBACK;
-- transacciones=# BEGIN TRANSACTION;
-- BEGIN
-- transacciones=*# UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
-- UPDATE 0
-- transacciones=*# UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
-- UPDATE 0
-- transacciones=*# ROLLBACK;
-- ROLLBACK


-- Al ejecutarlo veremos el siguiente error debido a la restricción de la columna balance que realizamos con check al momento de crear la tabla.
-- DETAIL: Failing row contains (1, -1000).

-- ● Paso 3: Verificamos el estado de la tabla.
SELECT * FROM cuentas;
-- transacciones=# select * from cuentas;
--  numero_cuenta | balance
-- ---------------+---------
-- (0 rows)

-- Paso 4: Intentemos registrar una nueva cuenta de número 3 en nuestra tabla “cuentas” con un saldo de $5000 y justo luego guardemos ese punto de la transacción con un SAVEPOINT de nombre “nueva_cuenta”.
BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance) VALUES (3,
5000);
SAVEPOINT nueva_cuenta;
-- transacciones=# BEGIN TRANSACTION;
-- BEGIN
-- transacciones=*# INSERT INTO cuentas(numero_cuenta, balance) VALUES (3,
-- transacciones(*# 5000);
-- INSERT 0 1
-- transacciones=*# SAVEPOINT nueva_cuenta;
-- SAVEPOINT

-- Paso 5: Hasta este punto tenemos la transacción en curso y hemos fijado que podríamos volver a este estado en cualquier circunstancia. Ahora, intentemos transferir a esta nueva cuenta $3000 desde la cuenta 2. Para esto continua la transacción de la siguiente manera.
UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;
ROLLBACK TO nueva_cuenta;
COMMIT;
-- transacciones=*# UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 3;
-- UPDATE 1
-- transacciones=*# UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;
-- UPDATE 0
-- transacciones=*# ROLLBACK TO nueva_cuenta;
-- ROLLBACK
-- transacciones=*# COMMIT;
-- COMMIT

INSERT INTO cuentas(numero_cuenta, balance) VALUES 
(4,7000),
(5,500),
(6,12000),
(7,900),
(8,100),
(9,20000),
(10,50);

-- Reporta aquellas cuentas cuyo balance sea mayor a 2000.
SELECT * FROM cuentas WHERE balance > 2000;
-- ● Reporta cuántas tienen un balance inferior a 1000.
SELECT * FROM cuentas WHERE balance < 1000;
-- ● Reporta el promedio total de las cuentas registradas según su balance.
SELECT avg(balance) FROM cuentas;
-- ● Reporta el promedio de cuentas cuyo balance sea mayor o igual a 10000.
SELECT avg(balance) FROM cuentas WHERE balance >= 10000;