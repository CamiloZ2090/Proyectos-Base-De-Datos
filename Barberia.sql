DROP DATABASE IF EXISTS Barberia;
CREATE DATABASE Barberia;

USE Barberia;

#Tablas

CREATE TABLE Barbero1 (
	idBarbero1 INT,
    nombre VARCHAR(100),
    experiencia VARCHAR(500),
    edad INT
);
CREATE TABLE Cliente (
	idCliente INT,
	nombre VARCHAR(100),
    edad INT
);
CREATE  TABLE Cita (
	idCita INT,
	horaCita TIME,
    diaCita DATE,
    idCliente INT,
    idBarbero1 INT
);

#Consultas

CREATE VIEW Vista_Barbero1 AS
SELECT nombre, experiencia
FROM Barbero1;

CREATE VIEW Vista_Cliente AS
SELECT nombre
FROM Cliente;

CREATE VIEW Vista_Cita AS
SELECT horacita, diaCita
FROM Cita;

#Asignacion llaves primarias

ALTER TABLE Barbero1
ADD PRIMARY KEY (idBarbero1);

ALTER TABLE Cliente
ADD PRIMARY KEY(idCliente);

ALTER TABLE Cita
ADD PRIMARY KEY(idCita);

#Relaciones

ALTER TABLE Cita
ADD CONSTRAINT fk_CitaBarbero
FOREIGN KEY (idBarbero1)
REFERENCES Barbero1(idBarbero1);

ALTER TABLE Cita
ADD CONSTRAINT fk_CitaCliente
FOREIGN KEY (idCliente)
REFERENCES Cliente(idCliente);

#Ejecutable

SELECT * FROM Barbero1;
SELECT * FROM Cliente;
SELECT * FROM Cita;

DESCRIBE Barbero1;
DESCRIBE Cliente;
DESCRIBE Cita;
