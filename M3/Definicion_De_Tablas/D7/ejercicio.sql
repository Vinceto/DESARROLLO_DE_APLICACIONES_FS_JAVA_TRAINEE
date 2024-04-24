-- Guía de ejercicios - Definición de tablas (I)
-- autor:Vinceto

-- Paso 1: Creamos la base de datos con el nombre mawashi_cars.
create database mawashi_cars;
-- postgres=# \l
--                                                                       List of databases
--            Name           |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | ICU Locale | ICU Rules |   Access privileges
-- --------------------------+----------+----------+-----------------+--------------------+--------------------+------------+-----------+-----------------------
--  desafio2_ramon_munoz_444 | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  desafio_ramon_munoz_024  | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  mawashi_cars             | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  postgres                 | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  registro_viajeros        | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  template0                | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                           |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  template1                | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                           |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  transacciones            | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
-- (8 rows)

-- Paso 2: Nos conectamos a la base de datos.
-- postgres=# \c mawashi_cars;
-- You are now connected to database "mawashi_cars" as user "postgres".

-- Paso 3: Creamos la tabla autos.
CREATE TABLE autos(id int primary key, marca varchar(25), modelo varchar(25), año varchar(25), color varchar(25), precio float);
-- mawashi_cars=# SELECT * FROM  autos;
--  id | marca | modelo | año | color | precio
-- ----+-------+--------+-----+-------+--------
-- (0 rows)

-- Paso 4: Creamos la tabla de ventas.
CREATE TABLE ventas(id serial unique not null, fecha varchar(20), id_auto int, cliente varchar(25), referencia int, cantidad float, metodo_pago varchar(10), foreign key (id_auto) references autos(id));
-- mawashi_cars=# SELECT * FROM  ventas;
--  id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
-- ----+-------+---------+---------+------------+----------+-------------
-- (0 rows)

-- Paso 5: Insertamos 3 registros en la tabla autos.
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES 
(1,'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000),
(2,'Mazda', 'Mazda 3', '2000', 'Azul',2000000),
(3,'Chevrolet', 'Spark', '1998', 'Verde Oscuro', 1200000),
(4,'Nissan', 'Versa', 2018, 'Gris Plata', 5000000),
(5,'Hyundai', 'Accent', 2022, 'Rojo', 10500000),
(6,'Kia', 'Rio', 2020, 'Negro', 8000000),
(7,'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000),
(8,'Fiat', 'Mobi', 2017, 'Blanco', 2800000),
(9,'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000),
(10,'Peugeot', '208', 2021, 'Rojo', 9800000);
-- mawashi_cars=# SELECT * FROM  autos;
--  id |   marca    |    modelo     | año  |    color     |  precio
-- ----+------------+---------------+------+--------------+----------
--   1 | Toyota     | Corolla Araya | 1991 | Blanco       |  1200000
--   2 | Mazda      | Mazda 3       | 2000 | Azul         |  2000000
--   3 | Chevrolet  | Spark         | 1998 | Verde Oscuro |  1200000
--   4 | Nissan     | Versa         | 2018 | Gris Plata   |  5000000
--   5 | Hyundai    | Accent        | 2022 | Rojo         | 10500000
--   6 | Kia        | Rio           | 2020 | Negro        |  8000000
--   7 | Volkswagen | Gol           | 2015 | Azul Marino  |  3500000
--   8 | Fiat       | Mobi          | 2017 | Blanco       |  2800000
--   9 | Suzuki     | Swift         | 2019 | Gris Oxford  |  6200000
--  10 | Peugeot    | 208           | 2021 | Rojo         |  9800000
-- (10 rows)

-- Paso 6: Insertamos algunas ventas.
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES
('2020-10-15', 1, 'Chuck', 43224, 12000000, 'Débito'),
('2020-11-15', 1, 'Donnie', 43334, 12000000, 'Transfer'),
('2020-12-15', 3, 'Jet', 43444, 12000000, 'Cheque'),
('2021-01-05', 1, 'Peter', 43335, 12000000, 'Débito'),
('2021-01-15', 1, 'Abigail', 43554, 12000000, 'Transfer'),
('2021-02-01', 3, 'Jhon', 43456, 12000000, 'Cheque'),
('2021-02-01', 2, 'Walter', 54321, 2000000, 'Efectivo'),
('2021-03-15', 3, 'Sarah', 54322, 1200000, 'Tarjeta'),
('2021-04-05', 4, 'Jessica', 54323, 5000000, 'Débito'),
('2021-05-25', 5, 'Luis', 54324, 10500000, 'Transfer');
-- mawashi_cars=# SELECT * FROM ventas;
--  id |   fecha    | id_auto | cliente | referencia | cantidad | metodo_pago
-- ----+------------+---------+---------+------------+----------+-------------
--   1 | 2020-10-15 |       1 | Chuck   |      43224 | 12000000 | Débito
--   2 | 2020-11-15 |       1 | Donnie  |      43334 | 12000000 | Transfer
--   3 | 2020-12-15 |       3 | Jet     |      43444 | 12000000 | Cheque
--   4 | 2021-01-05 |       1 | Peter   |      43335 | 12000000 | Débito
--   5 | 2021-01-15 |       1 | Abigail |      43554 | 12000000 | Transfer
--   6 | 2021-02-01 |       3 | Jhon    |      43456 | 12000000 | Cheque
--   7 | 2021-02-01 |       2 | Walter  |      54321 |  2000000 | Efectivo
--   8 | 2021-03-15 |       3 | Sarah   |      54322 |  1200000 | Tarjeta
--   9 | 2021-04-05 |       4 | Jessica |      54323 |  5000000 | Débito
--  10 | 2021-05-25 |       5 | Luis    |      54324 | 10500000 | Transfer
-- (10 rows)

-- Paso 7: Obtenemos un reporte con el nombre de los clientes registrados en la tabla venta, junto con la marca y el modelo del auto asociado a la venta realizada.
-- SELECT cliente, marca, modelo FROM ventas INNER JOIN autos ON ventas.id_auto=autos.id;
-- mawashi_cars=# SELECT cliente, marca, modelo FROM ventas INNER JOIN autos ON ventas.id_auto=autos.id;
--  cliente |   marca   |    modelo
-- ---------+-----------+---------------
--  Chuck   | Toyota    | Corolla Araya
--  Donnie  | Toyota    | Corolla Araya
--  Jet     | Chevrolet | Spark
--  Peter   | Toyota    | Corolla Araya
--  Abigail | Toyota    | Corolla Araya
--  Jhon    | Chevrolet | Spark
--  Walter  | Mazda     | Mazda 3
--  Sarah   | Chevrolet | Spark
--  Jessica | Nissan    | Versa
--  Luis    | Hyundai   | Accent
-- (10 rows)

-- Ejercicio propuesto 1
-- La empresa Mawashi Cars ha notado que aproximadamente un 30% de sus autos no se han vendido y está considerando la posibilidad de negociar un convenio con una compañía aliada con estos vehículos, pero necesitará una tabla que muestre los autos que no han sido vendidos. Realizar la consulta necesaria para obtener todos los autos cuyos id no se encuentran en la tabla Ventas.
SELECT * FROM autos
LEFT JOIN ventas ON autos.id = ventas.id_auto
WHERE ventas.id_auto IS NULL;
-- mawashi_cars=# SELECT * FROM autos
-- mawashi_cars-# LEFT JOIN ventas ON autos.id = ventas.id_auto
-- mawashi_cars-# WHERE ventas.id_auto IS NULL;
--  id |   marca    | modelo | año  |    color    | precio  | id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
-- ----+------------+--------+------+-------------+---------+----+-------+---------+---------+------------+----------+-------------
--  10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |       |         |         |            |          |
--   8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000 |    |       |         |         |            |          |
--   6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |       |         |         |            |          |
--   9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000 |    |       |         |         |            |          |
--   7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000 |    |       |         |         |            |          |
-- (5 rows)

-- Ejercicio propuesto 2
-- El dueño de la empresa Mawashi Cars se dio cuenta que para facilitar el proceso de auditoría, sería beneficioso saber los registros que no tienen relación entre ambas tablas para hacer el cruce con la información cedida anteriormente y terminar la auditoría. Realizar la sentencia SQL necesaria para satisfacer este requerimiento.
SELECT *
FROM autos
LEFT JOIN ventas ON autos.id = ventas.id_auto
WHERE ventas.id_auto IS NULL OR autos.id IS NULL;
-- mawashi_cars=# SELECT *
-- mawashi_cars-# FROM autos
-- mawashi_cars-# LEFT JOIN ventas ON autos.id = ventas.id_auto
-- mawashi_cars-# WHERE ventas.id_auto IS NULL OR autos.id IS NULL;
--  id |   marca    | modelo | año  |    color    | precio  | id | fecha | id_auto | cliente | referencia | cantidad | metodo_pago
-- ----+------------+--------+------+-------------+---------+----+-------+---------+---------+------------+----------+-------------
--  10 | Peugeot    | 208    | 2021 | Rojo        | 9800000 |    |       |         |         |            |          |
--   8 | Fiat       | Mobi   | 2017 | Blanco      | 2800000 |    |       |         |         |            |          |
--   6 | Kia        | Rio    | 2020 | Negro       | 8000000 |    |       |         |         |            |          |
--   9 | Suzuki     | Swift  | 2019 | Gris Oxford | 6200000 |    |       |         |         |            |          |
--   7 | Volkswagen | Gol    | 2015 | Azul Marino | 3500000 |    |       |         |         |            |          |
-- (5 rows)