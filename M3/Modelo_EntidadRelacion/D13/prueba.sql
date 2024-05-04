-- Autor: Vinceto

-- 1. Crear una base de datos
-- CREATE DATABASE pruebaG7M3D1314;
-- postgres=# CREATE DATABASE pruebaG7M3D1314;
-- CREATE DATABASE

-- postgres=# \c pruebag7m3d1314
-- You are now connected to database "pruebag7m3d1314" as user "postgres".

SET client_encoding = 'UTF8';

-- 1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos. (1 punto)
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    anno DATE
);
-- CREATE TABLE
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL
);
-- CREATE TABLE
CREATE TABLE detalle_peliculas (
    id SERIAL PRIMARY KEY,
    pelicula_id INT REFERENCES peliculas(id) NOT NULL,
    tag_id INT REFERENCES tags(id) NOT NULL
);
-- CREATE TABLE

-- 2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados. (1 punto)
INSERT INTO peliculas (nombre, anno) VALUES
('Pulp Fiction', '1994-01-01'),
('The Lord of the Rings: The Fellowship of the Ring', '2001-01-01'),
('Inception', '2010-01-01'),
('The Shawshank Redemption', '1994-01-01'),
('Forrest Gump', '1994-01-01');
-- INSERT 0 5

INSERT INTO tags (nombre) VALUES
('Violento'),
('Humor Negro'),
('Intriga'),
('Fantasia Epica'),
('Aventura');
-- INSERT 0 5

INSERT INTO detalle_peliculas (pelicula_id, tag_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5);
-- INSERT 0 5

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0. (1 punto)
SELECT p.nombre, COALESCE(COUNT(dt.tag_id), 0) AS cantidad_tags
FROM peliculas p
LEFT JOIN detalle_peliculas dt ON p.id = dt.pelicula_id
GROUP BY p.id, p.nombre;
--                       nombre                       | cantidad_tags
-- ---------------------------------------------------+---------------
--  Inception                                         |             0
--  Forrest Gump                                      |             0
--  The Shawshank Redemption                          |             0
--  The Lord of the Rings: The Fellowship of the Ring |             2
--  Pulp Fiction                                      |             3
-- (5 rows)

-- 4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos. (1 punto)
CREATE TABLE preguntas (
    id SERIAL PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    respuesta_correcta VARCHAR(255) NOT NULL
);
-- CREATE TABLE
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT CHECK (edad >= 18) -- Agregada restricción para edad >= 18
);
-- CREATE TABLE
CREATE TABLE respuestas (
    id SERIAL PRIMARY KEY,
    respuesta VARCHAR(255) NOT NULL,
    pregunta_id INT REFERENCES preguntas(id) ON DELETE CASCADE, -- Agregada opción ON DELETE CASCADE
    usuario_id INT REFERENCES usuarios(id) ON DELETE CASCADE -- Agregada opción ON DELETE CASCADE
);
-- CREATE TABLE

-- 5. Agrega 5 registros a la tabla preguntas, de los cuales: (1 punto)
-- a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios distintos
-- b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
-- c. 3. Los otros dos registros deben ser respuestas incorrectas.
-- Hint: Contestada correctamente significa que la respuesta indicada en la tabla respuestas es exactamente igual al texto indicado en la tabla de preguntas.
INSERT INTO preguntas (pregunta, respuesta_correcta) VALUES
('¿Cual es la capital de Francia?', 'Paris'),
('¿Quien escribio "Cien años de soledad"?', 'Gabriel Garcia Marquez'),
('¿Cual es el resultado de 2 + 2?', '4'),
('¿Cual es el oceano mas grande?', 'Pacifico'),
('¿Quien pinto la Mona Lisa?', 'Leonardo da Vinci');
-- INSERT 0 5

INSERT INTO usuarios (nombre, edad) VALUES
('Juan Perez', 23),
('Maria Garcia', 36),
('Carlos Lopez', 29);
-- INSERT 0 3

INSERT INTO respuestas (respuesta, pregunta_id, usuario_id) VALUES
('Paris', 1, 1),
('Paris', 1, 2),
('Gabriel Garcia Marquez', 2, 1),
('5', 3, 1),-- Respuesta incorrecta
('Atlantico', 4, 1); -- Respuesta incorrecta
-- INSERT 0 5

-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta). (1 punto)
SELECT u.nombre, COUNT(r.id) AS respuestas_correctas
FROM usuarios u
LEFT JOIN respuestas r ON u.id = r.usuario_id
INNER JOIN preguntas p ON r.pregunta_id = p.id AND r.respuesta = p.respuesta_correcta
GROUP BY u.id, u.nombre;
--     nombre    | respuestas_correctas
-- --------------+----------------------
--  Juan Perez   |                    2
--  Maria Garcia |                    1
-- (2 rows)

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta. (1 punto)
SELECT p.pregunta, COUNT(DISTINCT r.usuario_id) AS usuarios_con_respuesta_correcta
FROM preguntas p
LEFT JOIN respuestas r ON p.id = r.pregunta_id AND r.respuesta = p.respuesta_correcta
GROUP BY p.id, p.pregunta;
--                  pregunta                  | usuarios_con_respuesta_correcta
-- -------------------------------------------+---------------------------------
--  ┬┐Cual es la capital de Francia?          |                               2
--  ┬┐Quien escribio "Cien a├▒os de soledad"? |                               1
--  ┬┐Cual es el resultado de 2 + 2?          |                               0
--  ┬┐Cual es el oceano mas grande?           |                               0
--  ┬┐Quien pinto la Mona Lisa?               |                               0
-- (5 rows)

-- 8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación. (1 punto)

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos. (1 punto)

-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único. (1 punto)
ALTER TABLE usuarios ADD COLUMN email VARCHAR(255) UNIQUE;
-- ALTER TABLE