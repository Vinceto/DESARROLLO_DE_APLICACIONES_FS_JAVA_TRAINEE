-- /* Creando un modelo de datos con integridad referencial */
-- autor:Vinceto

-- Paso 1: Creamos la base de datos con el nombre lg_company.
create database lg_company;

-- postgres=# \l
--                                                                  List of databases
--       Name      |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | ICU Locale | ICU Rules |   Access privileges
-- ----------------+----------+----------+-----------------+--------------------+--------------------+------------+-----------+-----------------------
--  bbdd_gimnasios | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  lg_company     | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  postgres       | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  prueba1        | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  template0      | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                 |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  template1      | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                 |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
-- (6 rows)  

-- Paso 2: Nos conectamos a la base de datos.
-- postgres=# \c lg_company;
-- You are now connected to database "lg_company" as user "postgres".

-- Paso 1: Creamos la tabla clientes create table clientes;
CREATE TABLE clientes (id integer unique not null, name varchar(25) not null, email varchar(50));
-- lg_company=# CREATE TABLE clientes (id integer unique not null, name varchar(25) not null, email varchar(50));
-- CREATE TABLE
-- lg_company=# SELECT * FROM clientes;
--  id | name | email
-- ----+------+-------
-- (0 rows)

-- Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
INSERT INTO clientes(id, name) VALUES (1, 'Nombre 1');
INSERT INTO clientes(id, name) VALUES (2, 'Nombre 2');
INSERT INTO clientes(id, name) VALUES (3, 'Nombre 3');
-- lg_company=# INSERT INTO clientes(id, name) VALUES (1, 'Nombre 1');
-- INSERT 0 1
-- lg_company=# INSERT INTO clientes(id, name) VALUES (2, 'Nombre 2');
-- INSERT 0 1
-- lg_company=# INSERT INTO clientes(id, name) VALUES (3, 'Nombre 3');
-- INSERT 0 1
-- lg_company=# SELECT * FROM clientes;
--  id |   name   | email
-- ----+----------+-------
--   1 | Nombre 1 |
--   2 | Nombre 2 |
--   3 | Nombre 3 |
-- (3 rows)

-- Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- lg_company=# ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- ERROR:  la columna «email» de la relación «clientes» contiene valores null

UPDATE clientes SET email = '' WHERE email IS NULL;
-- lg_company=# UPDATE clientes SET email = '' WHERE email IS NULL;
-- UPDATE 3
-- busco los datos y consulto si el campo email tiene data o viene nulo
-- lg_company=# SELECT id, name, COALESCE(email, 'Null') AS email FROM clientes;
--  id |   name   | email
-- ----+----------+-------
--   1 | Nombre 1 |
--   2 | Nombre 2 |
--   3 | Nombre 3 |
-- (3 rows)

-- Paso 5: Corremos nuevamente el comando de alteración de la columna
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- lg_company=# ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- ALTER TABLE

--
-- Aplica lo aprendido
--
-- ALTER TABLE clientes ADD COLUMN fecha DATE;
-- lg_company=# ALTER TABLE clientes ADD COLUMN fecha DATE;
-- ALTER TABLE
-- lg_company=# SELECT * FROM clientes;
--  id |   name   | email | fecha
-- ----+----------+-------+-------
--   1 | Nombre 1 |       |
--   2 | Nombre 2 |       |
--   3 | Nombre 3 |       |
-- (3 rows)
UPDATE clientes SET fecha = '01-01-1111' WHERE fecha IS NULL;
-- lg_company=# UPDATE clientes SET fecha = '01-01-1111' WHERE fecha IS NULL;
-- UPDATE 3
-- lg_company=# SELECT * FROM clientes;
--  id |   name   | email |   fecha
-- ----+----------+-------+------------
--   1 | Nombre 1 |       | 1111-01-01
--   2 | Nombre 2 |       | 1111-01-01
--   3 | Nombre 3 |       | 1111-01-01
-- (3 rows)
ALTER TABLE clientes ALTER COLUMN fecha SET NOT NULL;
-- lg_company=# ALTER TABLE clientes ALTER COLUMN fecha SET NOT NULL;
-- ALTER TABLE

-- Paso 6: Agregamos un nuevo campo a la tabla de clientes pero los registros que ya existen no tienen dicha fecha incorporada. Asignemos una fecha a esos registros con COALESCE.
UPDATE clientes SET fecha = COALESCE(fecha, '2024-01-01');
--esto deberia setear las fechas que encuentre en nulo con la fecha '2024-01-01', pero como ya realice la modificacion antes no encontrara nada que modificar. Y esta es la razon es porque ya no existen nulos.
-- lg_company=# UPDATE clientes SET fecha = null  WHERE fecha = '01-01-1111';
-- ERROR:  el valor nulo en la columna «fecha» de la relación «clientes» viola la restricción de no nulo
-- DETAIL:  La fila que falla contiene (1, Nombre 1, , null).



--
-- Datos nulos en tabla de productos
--
-- lg_company=# \i dataset-productos.sql
-- CREATE TABLE
-- INSERT 0 38
-- lg_company=# SELECT *FROM productos;
--  id |            nombre             | precio  | sku
-- ----+-------------------------------+---------+-----
--   1 | Televisor 50 pulgadas         | 1500.00 |
--   2 | Celular de alta gama          | 1000.00 |
--   3 | Laptop de ├║ltima generaci├│n | 2000.00 |
--   4 | Nevera con congelador         |  500.00 |
--   5 | Lavadora autom├ítica          |  300.00 |
--   6 | Cocina a gas                  |  400.00 |
--   7 | Horno microondas              |  250.00 |
--   8 | Juego de ollas                |  100.00 |
--   9 | Set de cubiertos              |   50.00 |
--  10 | Cafetera el├®ctrica           |   75.00 |
--  11 | Tostadora                     |   50.00 |
--  12 | Plancha de vapor              |  100.00 |
--  13 | Secadora de ropa              |  200.00 |
--  14 | Aspiradora                    |  150.00 |
--  15 | Robot aspirador               |  300.00 |
--  16 | Silla de oficina              |  200.00 |
--  17 | Mesa de escritorio            |  150.00 |
--  18 | Escritorio para computadora   |  250.00 |
--  19 | Sill├│n para sala             |  300.00 |
--  20 | Sof├í cama                    |  400.00 |
--  21 | Mesa de centro                |  200.00 |
--  22 | Silla para comedor            |  150.00 |
--  23 | Mesa para comedor             |  250.00 |
--  24 | Cama matrimonial              |  400.00 |
--  25 | Cabecera para cama            |  250.00 |
--  26 | Mesa de noche                 |  150.00 |
--  27 | Armario ropero                |  300.00 |
--  28 | Espejo para ba├▒o             |  200.00 |
--  29 | Inodoro                       |  150.00 |
--  30 | Lavabo                        |  250.00 |
--  31 | Grifer├¡a para ba├▒o          |  100.00 |
--  32 | Ducha                         |   75.00 |
--  33 | Ba├▒era                       |   50.00 |
--  34 | Cocina de inducci├│n          |  400.00 |
--  35 | Campana extractora            |  300.00 |
--  36 | Microondas                    |  250.00 |
--  37 | Lavavajillas                  | 1000.00 |
--  38 | Lavadora secadora             | 2000.00 |
-- (38 rows)

-- Borrar tablas relacionadas
-- ● Paso 1: Creamos las tablas libros y autores con el siguiente código.

CREATE TABLE autores (
 id INT NOT NULL,
 nombre VARCHAR(255) NOT NULL,
 PRIMARY KEY (id)
);
-- CREATE TABLE
-- lg_company=# SELECT * FROM autores;
--  id | nombre
-- ----+--------
-- (0 rows)

CREATE TABLE libros (
 id INT NOT NULL,
 titulo VARCHAR(255) NOT NULL,
 autor_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (autor_id) REFERENCES autores (id)
);
-- CREATE TABLE
-- lg_company=# SELECT * FROM libros;
--  id | titulo | autor_id
-- ----+--------+----------
-- (0 rows)

-- Paso 2: Insertamos algunos datos en ambas tablas

INSERT INTO autores (id, nombre)
VALUES
 (1, 'Juan Pérez'),
 (2, 'María García'),
 (3, 'Pedro Rodríguez');
-- INSERT 0 3
-- lg_company=# SELECT * FROM autores;
--  id |     nombre
-- ----+-----------------
--   1 | Juan Pérez
--   2 | María García
--   3 | Pedro Rodríguez
-- (3 rows)

INSERT INTO libros (id, titulo, autor_id)
VALUES
 (1, 'El Quijote', 1),
 (2, 'La Divina Comedia', 2),
 (3, 'Hamlet', 3);
--  INSERT 0 3
-- lg_company=# SELECT * FROM libros;
--  id |      titulo       | autor_id
-- ----+-------------------+----------
--   1 | El Quijote        |        1
--   2 | La Divina Comedia |        2
--   3 | Hamlet            |        3
-- (3 rows)

-- Paso 4: Comprobación de la restricción de clave foránea.
DELETE FROM autores;
-- lg_company=# DELETE FROM autores;
-- ERROR:  update o delete en «autores» viola la llave foránea «libros_autor_id_fkey» en la tabla «libros»
-- DETAIL:  La llave (id)=(1) todavía es referida desde la tabla «libros».

DELETE FROM libros;
-- lg_company=# DELETE FROM libros;
-- DELETE 3

SELECT * FROM autores LEFT JOIN libros ON libros.autor_id = autores.id;
-- lg_company=# SELECT * FROM autores LEFT JOIN libros ON libros.autor_id = autores.id;
--  id |     nombre      | id | titulo | autor_id
-- ----+-----------------+----+--------+----------
--   2 | María García    |    |        |
--   1 | Juan Pérez      |    |        |
--   3 | Pedro Rodríguez |    |        |
-- (3 rows)