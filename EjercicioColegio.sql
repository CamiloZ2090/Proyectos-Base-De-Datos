DROP DATABASE IF EXISTS Colegio;
CREATE DATABASE Colegio;
USE Colegio;
/*Sirve para crear una tabla*/
CREATE TABLE Estudiantes (
id INT PRIMARY KEY,
nombre VARCHAR(100),
edad INT
);

CREATE TABLE Estudiantes1 (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) 
);

CREATE TABLE Matriculas (
    id INT PRIMARY KEY,
    clase VARCHAR(100),
    idEstudiante INT
);

CREATE VIEW vistaEstudiantes AS			/* Sirve para hacer consultas ademas de eso */ 
SELECT nombre, edad
FROM Estudiantes;

CREATE VIEW vistaEstudiantes1 AS
SELECT nombre
FROM Estudiantes1;

#CREAR UN INDICE
CREATE INDEX idex_nombre
ON Estudiantes(nombre);

#SIRVE PARA ALTERAR ATRIBUTOS DENTRO DE LA TABLA
ALTER TABLE Estudiantes
ADD correo VARCHAR(100);

ALTER TABLE Estudiantes
MODIFY nombre VARCHAR(150);

ALTER TABLE Estudiantes
CHANGE COLUMN correo Email VARCHAR(100);

ALTER TABLE Estudiantes
DROP COLUMN Email;

SELECT * FROM Estudiantes;
SELECT * FROM Estudiantes1;
SELECT * FROM Matriculas;

#AGREGAR UNA CLAVE FORANEA

ALTER TABLE Matriculas
ADD CONSTRAINT fk_estuidnate
FOREIGN KEY (idEstudiante)
REFERENCES Estudiantes(id);







