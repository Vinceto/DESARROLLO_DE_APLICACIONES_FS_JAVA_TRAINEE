--  Paso 1: Generamos la base de datos con el nombre registro_viajeros
-- CREATE DATABASE registro_viajeros;
--  Paso 2: Nos conectamos a la base de datos.
-- \c registro_viajeros;

-- Crear la tabla Viajeros--  Paso 1: Generamos la base de datos con el nombre registro_viajeros
-- CREATE DATABASE registro_viajeros;
--  Paso 2: Nos conectamos a la base de datos.
-- \c registro_viajeros;
--psql -U postgres -d registro_viajeros -f ejercicios.sql

-- Crear la tabla Viajeros
CREATE TABLE Viajeros (
    viajero_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    genero CHAR(5) NOT NULL,
    email VARCHAR(250),
    telefono CHAR(50) NOT NULL,
    rut CHAR(10) NOT NULL UNIQUE
);

-- Crear la tabla Destinos
CREATE TABLE Destinos (
    destino_id SERIAL PRIMARY KEY,
    nombre_destino VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);
-- Crear la tabla Tickets
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    destino_id INT REFERENCES DESTINOS (destino_id),
    viajero_id INT REFERENCES Viajeros(viajero_id),
    numero_boleto VARCHAR(50) NOT NULL UNIQUE,
    fecha_emision DATE,
    fecha_salida DATE,
    fecha_retorno DATE
);


-- Inserts para la tabla Viajeros
INSERT INTO Viajeros (nombre, genero, email, telefono, rut) VALUES
('Juan Perez', 'M', 'juan@email.com', '123456789', '1111111111'),
('Maria Rodriguez', 'F', 'maria@email.com', '987654321', '2222222222'),
('Carlos Gonzalez', 'M', 'carlos@email.com', '111222333', '3333333333'),
('Luisa Martinez', 'F', 'luisa@email.com', '444555666', '4444444444'),
('Pedro Hernandez', 'M', 'pedro@email.com', '777888999', '5555555555'),
('Ana Lopez', 'F', 'ana@email.com', '333444555', '6666666666'),
('Jorge Ramirez', 'M', 'jorge@email.com', '666777888', '7777777777'),
('Sofia Torres', 'F', 'sofia@email.com', '999000111', '8888888888'),
('Daniel Castro', 'M', 'daniel@email.com', '222333444', '9999999999'),
('Laura Garcia', 'F', 'laura@email.com', '555666777', '0000000000'),
('Manuel Silva', 'M', 'manuel@email.com', '888999000', '1231231231'),
('Elena Vargas', 'F', 'elena@email.com', '111222333', '4564564564'),
('Gabriel Morales', 'M', 'gabriel@email.com', '444555666', '7897897897'),
('Isabel Rios', 'F', 'isabel@email.com', '777888999', '0120120120'),
('Hector Mendoza', 'M', 'hector@email.com', '333444555', '9876543210');

-- Inserts para la tabla Destinos
INSERT INTO Destinos (nombre_destino, ciudad, pais) VALUES
('Playa del Carmen', 'Playa del Carmen', 'México'),
('Machu Picchu', 'Cuzco', 'Perú'),
('Torres del Paine', 'Puerto Natales', 'Chile'),
('Gran Barrera de Coral', 'Queensland', 'Australia'),
('Monte Everest', 'Khumbu', 'Nepal'),
('Santorini', 'Santorini', 'Grecia'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Kioto', 'Kioto', 'Japón'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos'),
('Marrakech', 'Marrakech', 'Marruecos');

-- Inserts para la tabla Tickets
INSERT INTO Tickets (viajero_id, destino_id, numero_boleto, fecha_emision, fecha_salida, fecha_retorno) VALUES
(1, 1, 'T111111', '2024-01-04', '2024-01-10', '2024-01-20'),
(2, 2, 'T222222', '2024-01-05', '2024-02-01', '2024-02-15'),
(2, 3, 'T333333', '2024-01-06', '2024-03-05', '2024-03-20'),
(4, 4, 'T444444', '2024-01-07', '2024-04-12', '2024-05-01'),
(5, 5, 'T555555', '2024-01-08', '2024-06-02', '2024-06-20'),
(6, 1, 'T666666', '2024-01-09', '2024-07-15', '2024-08-01'),
(4, 2, 'T777777', '2024-01-10', '2024-09-03', '2024-09-20'),
(8, 3, 'T888888', '2024-01-11', '2024-10-18', '2024-11-01'),
(9, 4, 'T999999', '2024-01-12', '2024-12-05', '2024-12-20'),
(10, 5, 'T101010', '2024-01-13', '2025-01-02', '2025-01-20'),
(15, 1, 'T1111111', '2024-01-14', '2025-02-10', '2025-02-25'),
(12, 2, 'T121212', '2024-01-15', '2025-03-15', '2025-04-01'),
(13, 3, 'T131313', '2024-01-16', '2025-05-02', '2025-05-20'),
(14, 4, 'T141414', '2024-01-17', '2025-06-12', '2025-06-30'),
(15, 5, 'T151515', '2024-01-18', '2025-07-20', '2025-08-05');

-- Paso 7: El cliente nos solicita un pequeño reporte de pruebas donde se registren el nombre de todos los viajeros con y sin boletos, el número de boleto (para los casosque correspondan) y el nombre del destino.
SELECT viajeros.nombre, tickets.numero_boleto, destinos.nombre_destino
FROM viajeros
LEFT JOIN tickets ON viajeros.viajero_id = tickets.viajero_id
LEFT JOIN destinos ON tickets.destino_id = destinos.destino_id;

-- 1. Obtener una lista de todos los viajeros y la información de sus boletos, incluyendo aquellos viajeros que no tengan boletos emitidos En el caso de los viajeros con boleto, mostrar su destino.
SELECT v.nombre AS nombre_viajero, t.*, d.nombre_destino
FROM viajeros as v
LEFT JOIN tickets as t ON v.viajero_id = t.viajero_id
LEFT JOIN destinos as d ON t.destino_id = d.destino_id;

-- 2. Mostrar la información del boleto T123456 junto con los detalles del viajero y destino correspondiente a ese boleto.
SELECT tickets.*, viajeros.*, destinos.nombre_destino
FROM viajeros
LEFT JOIN tickets ON viajeros.viajero_id = tickets.viajero_id
LEFT JOIN destinos ON tickets.destino_id = destinos.destino_id
WHERE tickets.numero_boleto = 'T123456';

-- 3. Listar todos los viajeros que tienen fecha de salida o de retorno el '2024-01-10'
SELECT tickets.viajero_id, viajeros.nombre
FROM viajeros
LEFT JOIN tickets ON viajeros.viajero_id = tickets.viajero_id
WHERE tickets.fecha_salida = '2024-01-10' OR tickets.fecha_retorno = '2024-01-10';

-- 4. Obtener el número total de boletos por cada género
SELECT 
    SUM(CASE WHEN viajeros.genero = 'M' THEN 1 ELSE 0 END) AS total_hombres,
    SUM(CASE WHEN viajeros.genero = 'F' THEN 1 ELSE 0 END) AS total_mujeres
FROM viajeros 
INNER JOIN tickets ON viajeros.viajero_id = tickets.viajero_id;

--diego
SELECT genero, count(genero) as cantidad
FROM viajeros 
INNER JOIN tickets ON viajeros.viajero_id = tickets.ticket_id 
GROUP BY viajeros.genero;

--digo fix
SELECT viajeros.genero, COUNT(tickets.ticket_id) AS cantidad
FROM viajeros 
INNER JOIN tickets ON viajeros.viajero_id = tickets.viajero_id 
GROUP BY viajeros.genero;

-- 5. Obtener un listado de todos los viajeros que han viajado a Playa del Carmen
SELECT viajeros.nombre
FROM viajeros
INNER JOIN tickets ON viajeros.viajero_id = tickets.viajero_id
INNER JOIN destinos ON tickets.destino_id = destinos.destino_id
WHERE destinos.nombre_destino = 'Playa del Carmen';

--diego
SELECT viajeros.*
FROM viajeros 
JOIN tickets ON viajeros.viajero_id = tickets.viajero_id 
JOIN destinos ON tickets.destino_id = destinos.destino_id
WHERE destinos.nombre_destino = 'Playa del Carmen';