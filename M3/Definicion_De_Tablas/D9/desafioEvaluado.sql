-- Autor: Vinceto

-- 1. Crear una base de datos llamada películas. Pequeño cambio de nombre
CREATE DATABASE desafioFlix;
-- postgres=# CREATE DATABASE desafioFlix;
-- CREATE DATABASE
-- postgres=# \l
--                                                                       List of databases
--            Name           |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | ICU Locale | ICU Rules |   Access privileges
-- --------------------------+----------+----------+-----------------+--------------------+--------------------+------------+-----------+-----------------------
--  desafio2_ramon_munoz_444 | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  desafio_ramon_munoz_024  | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  desafioflix              | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  mawashi_cars             | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  postgres                 | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  registro_viajeros        | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
--  template0                | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                           |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  template1                | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           | =c/postgres          +
--                           |          |          |                 |                    |                    |            |           | postgres=CTc/postgres
--  transacciones            | postgres | UTF8     | libc            | Spanish_Spain.1252 | Spanish_Spain.1252 |            |           |
-- (9 rows)

-- postgres=# \c desafioflix
-- You are now connected to database "desafioflix" as user "postgres".

-- Crear la tabla películas
CREATE TABLE películas (
    id SERIAL PRIMARY KEY,
    Película VARCHAR(255),
    Año_estreno INT,
    Director VARCHAR(255)
);
-- CREATE TABLE

-- Crear la tabla reparto
CREATE TABLE reparto (
    id_pelicula INT,
    actor VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES películas(id)
);
-- CREATE TABLE

--2. Cargar ambos archivos a su tabla correspondiente.
-- copiar data desde csv
\copy películas FROM 'peliculas.csv' DELIMITER ',' CSV HEADER;
-- COPY 100
-- desafioflix=# SELECT COUNT(*) FROM películas;
--  count
-- -------
--    100
-- (1 row)

-- copiar data desde csv
\copy reparto FROM 'reparto.csv' DELIMITER ',' CSV HEADER;
-- COPY 1051
-- desafioflix=# SELECT COUNT(*) FROM reparto;
--  count
-- -------
--   1051
-- (1 row)

-- 3. Obtener el ID de la película “Titanic”.
SELECT id FROM películas WHERE Película = 'Titanic';
-- desafioflix=# SELECT id FROM películas WHERE Película = 'Titanic';
--  id
-- ----
--   2
-- (1 row)

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor FROM reparto WHERE id_pelicula = (SELECT id FROM películas WHERE Película = 'Titanic');
-- desafioflix=# SELECT actor FROM reparto WHERE id_pelicula = (SELECT id FROM películas WHERE Película = 'Titanic');
--        actor
-- -------------------
--  Leonardo DiCaprio
--  Kate Winslet
--  Billy Zane
--  Kathy Bates
--  Frances Fisher
--  Bernard Hill
--  Jonathan Hyde
--  Danny Nucci
--  David Warner
--  Bill Paxton
--  Gloria Stuart
--  Victor Garber
--  Suzy Amis
-- (13 rows)

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT(*) FROM películas AS p INNER JOIN reparto AS r ON  p.id = r.id_pelicula WHERE r.actor = 'Harrison Ford';
-- desafioflix=# SELECT COUNT(*) FROM películas AS p INNER JOIN reparto AS r ON  p.id = r.id_pelicula WHERE r.actor = 'Harrison Ford';
--  count
-- -------
--      8
-- (1 row)

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT Película, Año_estreno FROM películas WHERE Año_estreno BETWEEN 1990 AND 1999 ORDER BY Película ASC;
-- desafioflix=# SELECT Película, Año_estreno FROM películas WHERE Año_estreno BETWEEN 1990 AND 1999 ORDER BY Película ASC;
--                   película                  | año_estreno
-- --------------------------------------------+-------------
--  American Beauty                            |        1999
--  American History X                         |        1998
--  Braveheart                                 |        1995
--  Cadena perpetua                            |        1994
--  Eduardo Manostijeras                       |        1990
--  El club de la pelea                        |        1999
--  El Padrino. Parte III                      |        1990
--  El profesional                             |        1994
--  El sexto sentido                           |        1999
--  El show de Truman                          |        1998
--  El silencio de los corderos                |        1991
--  Entrevista con el vampiro                  |        1994
--  Forest Gump                                |        1994
--  Hombres de negro                           |        1997
--  La lista de Schindler                      |        1993
--  La milla verde                             |        1999
--  Matrix                                     |        1999
--  Mejor... imposible                         |        1997
--  Parque Jur├ísico                           |        1993
--  Pesadilla antes de navidad                 |        1993
--  Pulp Fiction                               |        1994
--  Salvar al soldado Ryan                     |        1998
--  Seven                                      |        1995
--  Star Wars. Episodio I: La amenaza fantasma |        1999
--  Terminator 2: el juicio final              |        1991
--  Titanic                                    |        1997
--  Toy Story                                  |        1995
--  Toy Story 2                                |        1999
--  Trainspotting                              |        1996
--  Uno de los nuestros                        |        1990
-- (30 rows)

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT Película, LENGTH(Película) AS longitud_titulo FROM películas;
-- desafioflix=# SELECT Película, LENGTH(Película) AS longitud_titulo FROM películas;
--                        película                        | longitud_titulo
-- -------------------------------------------------------+-----------------
--  Forest Gump                                           |              11
--  Titanic                                               |               7
--  El Padrino                                            |              10
--  Gladiator                                             |               9
-- ...

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(Película)) AS longitud_máxima FROM películas;
-- desafioflix=# SELECT MAX(LENGTH(Película)) AS longitud_máxima FROM películas;
--  longitud_máxima
-- -----------------
--               53
SELECT Película, LENGTH(Película) AS longitud_título FROM películas ORDER BY LENGTH(Película) DESC LIMIT 1;
-- desafioflix-# SELECT Película, LENGTH(Película) AS longitud_título FROM películas ORDER BY LENGTH(Película) DESC LIMIT 1;
--                        película                        | longitud_título
-- -------------------------------------------------------+-----------------
--  Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
-- (1 row)