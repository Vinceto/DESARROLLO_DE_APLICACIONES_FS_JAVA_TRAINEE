CREATE DATABASE bbdd_gimnasios;

-- \c bbdd_gimnasios;

CREATE TABLE clientes(nombre varchar(50), apellido varchar(50), rut int,email varchar(50));

ALTER TABLE clientes add primary key(rut);

CREATE TABLE matriculas(monto varchar(50), estado boolean, cliente_rut int references clientes(rut));

INSERT INTO clientes VALUES 
('Cliente 1', 'Apellido cliente 1','999999999', 'cliente1@email.com'),
('Cliente 2', 'Apellido cliente 2','888888888', 'cliente2@email.com'),
('Cliente 3', 'Apellido cliente 3','777777777', 'cliente3@email.com'),
('Cliente 4', 'Apellido cliente 4','666666666', 'cliente4@email.com'),
('Cliente 5', 'Apellido cliente 5','555555555', 'cliente5@email.com');

INSERT INTO matriculas VALUES 
('40000', True, '999999999'),
('40000', False, '888888888'),
('55000', True, '555555555'),
('35000', True, '777777777'),
('60000', False, '666666666');

SELECT email, rut, monto, estado FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut;

SELECT email, rut, monto, estado FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut ORDER BY matriculas.monto;

SELECT monto, count(monto) FROM matriculas GROUP BY monto HAVING count(monto) >= 2;

SELECT email, rut, monto, estado, count(matriculas.*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY email,monto, rut, estado;

--paso 12
SELECT email, rut, monto, estado, count(matriculas.*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY email,monto, rut, estado HAVING count(matriculas.*) >= 2;

-- Agregando integridad referencial en la tabla cliente
DELETE FROM matriculas;
DELETE FROM clientes;

ALTER TABLE clientes ADD COLUMN cliente_id SERIAL PRIMARY KEY;

ALTER TABLE matriculas ADD COLUMN matricula_id SERIAL PRIMARY KEY;

INSERT INTO clientes VALUES 
('Cliente 1', 'Apellido cliente 1','999999999', 'cliente1@email.com'),
('Cliente 2', 'Apellido cliente 2','888888888', 'cliente2@email.com'),
('Cliente 3', 'Apellido cliente 3','777777777', 'cliente3@email.com'),
('Cliente 4', 'Apellido cliente 4','666666666', 'cliente4@email.com'),
('Cliente 5', 'Apellido cliente 5','555555555', 'cliente5@email.com');

INSERT INTO matriculas VALUES 
('40000', True, '999999999'),
('40000', False, '888888888'),
('55000', True, '555555555'),
('35000', True, '777777777'),
('60000', False, '666666666');

-- agregar otra matrícula al cliente 1
INSERT INTO matriculas (monto, estado, cliente_rut) VALUES ('60000', False, 999999999);

-- Realizamos la consulta del paso 12
SELECT email, rut, monto, estado, count(matriculas.*)
FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut 
GROUP BY email,monto, rut, estado 
HAVING COUNT(matriculas.matricula_id) >= 2;

-- contar cuantas matriculas tiene cada cliente
SELECT clientes.email, clientes.rut, COUNT(matriculas.matricula_id) AS total_matriculas
FROM clientes 
INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut 
GROUP BY clientes.email, clientes.rut




