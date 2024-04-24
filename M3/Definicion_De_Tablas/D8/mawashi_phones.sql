-- Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
CREATE DATABASE mawashi_phones;
-- postgres=# CREATE DATABASE mawashi_phones;
-- CREATE DATABASE

-- postgres=# \l
--                                                                  List of databases
--       Name      |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | ICU Locale | ICU Rules |   Access privileges
-- ----------------+----------+----------+-----------------+--------------------+--------------------+------------+-----------+-----------------------
--  bbdd_gimnasios | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  lg_company     | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  mawashi_phones | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  postgres       | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  prueba1        | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  template0      | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                 |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  template1      | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                 |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
-- (7 rows)

-- Paso 2: Nos conectamos a la base de datos.
-- postgres=# \c mawashi_phones
-- You are now connected to database "mawashi_phones" as user "postgres".

-- Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
CREATE TABLE phones (id int primary key, modelo varchar(50), mac_address int unique, fecha_fabricacion varchar(50));
-- CREATE TABLE
-- mawashi_phones=# SELECT * FROM phones
-- mawashi_phones-# ;
--  id | modelo | mac_address | fecha_fabricacion
-- ----+--------+-------------+-------------------
-- (0 rows)

-- Paso 4: Insertamos un registro para probar la tabla.
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) VALUES (1, 'Iphone14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
-- ERROR:  la sintaxis de entrada no es válida para tipo integer: «1B:2A:3C:4D:5F:6G»
-- LINE 1: ...ddress, fecha_fabricacion) VALUES (1, 'Iphone14', '1B:2A:3C:...

-- Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
ALTER TABLE phones ALTER column mac_address type varchar(50);
-- mawashi_phones=# ALTER TABLE phones ALTER column mac_address type varchar(50);
-- ALTER TABLE

-- Paso 6: Comprobamos que se hayan aplicado los cambios.
-- \d phones
-- mawashi_phones=# \d phones
--                            Table "public.phones"
--       Column       |         Type          | Collation | Nullable | Default
-- -------------------+-----------------------+-----------+----------+---------
--  id                | integer               |           | not null |
--  modelo            | character varying(50) |           |          |
--  mac_address       | character varying(50) |           |          |
--  fecha_fabricacion | character varying(50) |           |          |
-- Indexes:
--     "phones_pkey" PRIMARY KEY, btree (id)
--     "phones_mac_address_key" UNIQUE CONSTRAINT, btree (mac_address)

-- Paso 7: Insertamos nuevamente el registro.
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) VALUES (1, 'Iphone14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
-- INSERT 0 1
-- mawashi_phones=# SELECT * FROM phones;
--  id |  modelo  |    mac_address    | fecha_fabricacion
-- ----+----------+-------------------+-------------------
--   1 | Iphone14 | 1B:2A:3C:4D:5F:6G | 2022-09-09
-- (1 row)

-- Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
ALTER TABLE phones ALTER column mac_address SET NOT NULL;
-- mawashi_phones=# ALTER TABLE phones ALTER column mac_address SET NOT NULL;
-- ALTER TABLE
-- \d phones
-- mawashi_phones=# \d phones
--                            Table "public.phones"
--       Column       |         Type          | Collation | Nullable | Default
-- -------------------+-----------------------+-----------+----------+---------
--  id                | integer               |           | not null |
--  modelo            | character varying(50) |           |          |
--  mac_address       | character varying(50) |           | not null |
--  fecha_fabricacion | character varying(50) |           |          |
-- Indexes:
--     "phones_pkey" PRIMARY KEY, btree (id)
--     "phones_mac_address_key" UNIQUE CONSTRAINT, btree (mac_address)

-- Paso 9: Insertamos un nuevo registro a la tabla phones.
INSERT INTO phones (id, modelo, mac_address, fecha_fabricacion) VALUES (2, 'Iphone13', '5B:1A:2C:7D:8F:7h', '2021-09-24');
-- INSERT 0 1

-- Paso 10: Aplicamos truncate a la tabla y vemos su resultado.
TRUNCATE phones;
-- mawashi_phones=# SELECT * FROM phones;
--  id |  modelo  |    mac_address    | fecha_fabricacion
-- ----+----------+-------------------+-------------------
--   1 | Iphone14 | 1B:2A:3C:4D:5F:6G | 2022-09-09
--   2 | Iphone13 | 5B:1A:2C:7D:8F:7h | 2021-09-24
-- (2 rows)


-- mawashi_phones=# TRUNCATE phones;
-- TRUNCATE TABLE
-- mawashi_phones=# SELECT * FROM phones;
--  id | modelo | mac_address | fecha_fabricacion
-- ----+--------+-------------+-------------------
-- (0 rows)



--
-- Agregar campos a phones
--
-- incorporando los siguientes
-- campos a la tabla phones:
-- ● Memoria interna.
-- ● Memoria ram.
-- ● Peso.
-- ● Dimensiones.

ALTER TABLE phones
ADD COLUMN memoria_interna VARCHAR(50),
ADD COLUMN memoria_ram VARCHAR(50),
ADD COLUMN peso DECIMAL(10,2),
ADD COLUMN dimensiones VARCHAR(100);
-- mawashi_phones-# \d phones
--                             Table "public.phones"
--       Column       |          Type          | Collation | Nullable | Default
-- -------------------+------------------------+-----------+----------+---------
--  id                | integer                |           | not null |
--  modelo            | character varying(50)  |           |          |
--  mac_address       | character varying(50)  |           | not null |
--  fecha_fabricacion | character varying(50)  |           |          |
--  memoria_interna   | character varying(50)  |           |          |
--  memoria_ram       | character varying(50)  |           |          |
--  peso              | numeric(10,2)          |           |          |
--  dimensiones       | character varying(100) |           |          |
-- Indexes:
--     "phones_pkey" PRIMARY KEY, btree (id)
--     "phones_mac_address_key" UNIQUE CONSTRAINT, btree (mac_address)


-- Además, agrega al campo ID la instrucción SERIAL para que al momento de generarse un nuevo registro esta columna sea llenada de manera automática e incremental.
-- Eliminar la columna id existente
ALTER TABLE phones DROP COLUMN id;
-- ALTER TABLE

-- Agregar una nueva columna id con la instrucción SERIAL
ALTER TABLE phones ADD COLUMN id SERIAL PRIMARY KEY;
-- ALTER TABLE
-- mawashi_phones=# \d phones
--                                          Table "public.phones"
--       Column       |          Type          | Collation | Nullable |              Default
-- -------------------+------------------------+-----------+----------+------------------------------------
--  modelo            | character varying(50)  |           |          |
--  mac_address       | character varying(50)  |           | not null |
--  fecha_fabricacion | character varying(50)  |           |          |
--  memoria_interna   | character varying(50)  |           |          |
--  memoria_ram       | character varying(50)  |           |          |
--  peso              | numeric(10,2)          |           |          |
--  dimensiones       | character varying(100) |           |          |
--  id                | integer                |           | not null | nextval('phones_id_seq'::regclass)
-- Indexes:
--     "phones_pkey" PRIMARY KEY, btree (id)
--     "phones_mac_address_key" UNIQUE CONSTRAINT, btree (mac_address)