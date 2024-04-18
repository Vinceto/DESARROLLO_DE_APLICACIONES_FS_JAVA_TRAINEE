-- Creamos una base de datos de comidas típicas chilenas.
CREATE DATABASE comidas_tipicas;

-- Creamos una tabla llamada cocina chilena con los campos id y nombre.
create table cocina_chilena(
    id int, 
    nombre varchar(50)
);

-- Insertamos 2 registros a la tabla con sus respectivos campos.
INSERT INTO cocina_chilena (id, nombre) VALUES ('1','Pastel de choclo');
INSERT INTO cocina_chilena (id, nombre) VALUES ('2', 'Umitas');

--  Para actualizar un registro utilizamos update.
UPDATE cocina_chilena SET nombre='Humitas' WHERE id = 2;

--"Ingresa 3 registros más a la tabla e intenciona el update en al menos 2 de ellos"
INSERT INTO cocina_chilena (id, nombre) VALUES 
('3','Pastel de Haiba'),
('4','Curanto'),
('5', 'Asao');

UPDATE cocina_chilena SET nombre='Pastel de Jaiba' WHERE id = 3;
UPDATE cocina_chilena SET nombre='Asado' WHERE id = 5;

-- Paso 5: Eliminar un registro lo podremos hacer con la sentencia Delete. Asícomo hicimos con la actualización, utilizaremos el id para capturar un registropuntual.
DELETE FROM cocina_chilena WHERE id = 2;

-- Paso 6: Eliminar múltiples registros en la tabla. Para ello añadiremos platos decocina chilena.
INSERT INTO cocina_chilena (id, nombre) VALUES 
('2','Humitas'),
('3','Cazuela'),
('4','Empanada chilena'),
('5','Charquicán');

-- Eliminamos entonces múltiples registros, supongamos que queremos eliminaraquellos cuyo id vayan del 3 hasta el 5.
DELETE FROM cocina_chilena WHERE id IN (3, 4, 5);