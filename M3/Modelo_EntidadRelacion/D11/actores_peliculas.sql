-- Creación de la tabla de actores
CREATE TABLE Actores (
    actor_id INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

-- Creación de la tabla de películas
CREATE TABLE Peliculas (
    pelicula_id INT PRIMARY KEY,
    nombre VARCHAR(30),
    genero VARCHAR(30) NOT NULL
);

-- Creación de la tabla intermedia para la relación N:N entre actores y películas
CREATE TABLE ActoresPeliculas (
    pelicula_id INT,
    actor_id INT,
    PRIMARY KEY (actor_id, pelicula_id),
    FOREIGN KEY (actor_id) REFERENCES Actores(actor_id),
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(pelicula_id)
);