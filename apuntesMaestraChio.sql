/* Consulta Basica
SELECT * FROM netflixdb.actores;
*/

/* Camel case o Snake case
USE netflixdb;
SELECT episodio_id FROM episodios;
*/

/* Elegir uno o mas datos
USE netflixdb;
SELECT episodio_id, titulo FROM episodios;
*/

/* Distinct 
SELECT genero FROM series;
*/

/*
SELECT año_lanzamiento FROM series;
*/

/*
SELECT titulo, duracion FROM episodios;
*/

/*
USE netflixdb;
SELECT titulo, duracion FROM episodios ORDER BY duracion;
*/

/* ORdenar datos de Mayor a Menor
SELECT titulo, duracion FROM episodios ORDER BY duracion ASC;
SELECT titulo, duracion FROM episodios ORDER BY duracion DESC;
*/

/*
SELECT titulo FROM series ORDER BY titulo ASC;
*/

/* Limit
USE netflixdb;
SELECT * FROM episodios LIMIT 5;
*/

/* LIMIT & ORDER BY
USE netflixdb;
SELECT titulo, duracion FROM episodios ORDER BY duracion DESC LIMIT 5;
*/

/*
SELECT titulo, duracion FROM episodios ORDER BY titulo ASC limit 7;
*/

/* Clausula where 
SELECT * FROM series WHERE  genero = 'Drama';
*/

/* 
SELECT * FROM series WHERE año_lanzamiento >= 2010;
*/

/*
SELECT * FROM series WHERE genero = 'Comedia';
*/

/*
SELECT * FROM actores WHERE fecha_nacimiento = '1983-05-05';
*/

/*
SELECT * FROM series WHERE año_lanzamiento >= '2020';
*/

/*
SELECT titulo, duracion, rating_imdb FROM episodios WHERE duracion >= 60 AND rating_imdb >= 9.5; 
*/

/*
SELECT * FROM series WHERE genero = 'Comedia' OR genero = 'Animacion';
*/

/*
SELECT * FROM series WHERE genero = 'Comedia' AND genero = 'Animacion';
*/

/* not / diferente de:
SELECT * FROM series WHERE genero <> 'Drama'
*/

/*
SELECT * FROM series WHERE genero <> 'Comedia';

*/

/*
USE netflixdb;
SELECT temporada, AVG (rating_imdb) FROM episodios GROUP BY temporada;
*/

/*
SELECT temporada, COUNT(*) AS total_episodios FROM episodios GROUP BY temporada;
*/

/*
SELECT temporada, MAX(rating_imdb) FROM episodios GROUP BY temporada;
*/

/*
USE netflixdb;
SELECT temporada, AVG(rating_imdb) FROM episodios GROUP BY temporada ORDER BY rating_imdb DESC;
*/

/* Group by
SELECT genero, COUNT(*) FROM series GROUP BY genero HAVING COUNT(*) > 6;
*/

/*
SELECT temporada, MAX(duracion) FROM episodios GROUP BY temporada HAVING MAX(duracion) > 70;
*/

/*
USE netflixdb;
SELECT s.titulo, e.titulo FROM series s JOIN episodios e USING (serie_id) WHERE s.titulo = 'Stranger things';
SELECT s.titulo, e.titulo FROM series AS s JOIN episodios AS e ON s.serie_id= e.serie_id WHERE s.titulo = "Stranger things";
*/

/*
SELECT series.titulo AS "Titulo de la serie" , episodios.titulo AS "Titulo de episodio" FROM series LEFT JOIN episodios ON series.serie_id = episodios.serie_id ORDER BY series.titulo;
*/

/*
CREATE DATABASE IF NOT EXISTS EmpresaDB;
*/

/*
USE netflixdb;
*/


/*
CREATE TABLE IF NOT EXISTS Empresadb;
*/

/*
CREATE TABLE IF NOT EXISTS departamentos (depto_id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR (255) NOT NULL, ubicacion VARCHAR (255));

CREATE TABLE IF NOT EXISTS Empleados(
empleado_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
email VARCHAR (255) UNIQUE NOT NULL,
depto_id INT,

FOREIGN KEY (depto_id) 
REFERENCES Departamentos(depto_id)
ON DELETE SET NULL
);

ALTER TABLE departamentos ADD COLUMN curp VARCHAR (255);
*/

/*
USE empresadb;
CREATE DATABASE IF NOT EXISTS EmpresaDB;
CREATE TABLE IF NOT EXISTS departamentos(
depto_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
ubicacion VARCHAR(255)
);

USE empresadb;
INSERT INTO departamentos(nombre, ubicacion) VALUES
('Recursos Humanos', 'Edificio B'),
('Marketing', 'Edificio Central');

SELECT * FROM departamentos;

DELETE FROM departamentos;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE departamentos;
SET FOREIGN_KEY_CHECKS = 1;

UPDATE departamentos SET ubicacion = 'Edificio E' WHERE nombre = 'Marketing';
*/

DELETE FROM departamentos WHERE nombre = 'Marketing';
SELECT * FROM departamentos;

