CREATE DATABASE Veterinaria;
USE Veterinaria;

-- CREACIÓN DE LAS TABLAS

CREATE TABLE Propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(50)
);

select * from Propietarios;

CREATE TABLE Mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raza VARCHAR(50),
    edad INT CHECK (edad >= 0),
    id_propietario INT NOT NULL,
    FOREIGN KEY (id_propietario)
    REFERENCES Propietarios(id_propietario)
);

select * from Mascotas;

CREATE TABLE Veterinarios (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);

select * from Veterinarios;

CREATE TABLE Citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    motivo VARCHAR(200),
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_mascota)
    REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_veterinario)
    REFERENCES Veterinarios(id_veterinario)
);

select * from Citas;

ALTER TABLE Propietarios
MODIFY correo VARCHAR(100);

DESCRIBE Propietarios;

-- INSERCIÓN DE DATOS

INSERT INTO Propietarios
(documento,nombre,telefono,correo)
VALUES
('1010','Carlos Gómez','3001111111','carlos@gmail.com'),
('2020','Laura Ruiz','3002222222','laura@gmail.com'),
('3030','Andrés Torres','3003333333','andres@gmail.com');

select * from Propietarios;

INSERT INTO Mascotas
(nombre,especie,raza,edad,id_propietario)
VALUES
('Max','Perro','Labrador',5,1),
('Luna','Gato','Persa',3,2),
('Rocky','Perro','Pastor Alemán',4,1),
('Milo','Gato','Siamés',2,3),
('Toby','Perro','Pug',6,2),
('Nala','Gato','Angora',1,3);

INSERT INTO Mascotas
(nombre,especie,raza,edad,id_propietario)
VALUES
('Lucas','Perro','Labrador',8,2);

select * from Mascotas;

INSERT INTO Veterinarios
(nombre,especialidad)
VALUES
('Juan Pérez','Cirugía'),
('Sandra López','Medicina General'),
('Camilo Díaz','Dermatología');

select * from Veterinarios;

INSERT INTO Citas
(fecha,motivo,id_mascota,id_veterinario)
VALUES
('2026-10-01','Vacunación',1,2),
('2026-10-02','Control general',2,2),
('2026-10-03','Cirugía menor',3,1),
('2026-10-04','Problema de piel',4,3),
('2026-10-05','Desparasitación',5,2);

select * from Citas;

INSERT INTO Citas
(fecha,motivo,id_mascota,id_veterinario)
VALUES
('2026-10-01','Vacunación',7,2);

-- CONSULTAS DE VALIDACIÓN

SELECT * FROM Propietarios;

SELECT * FROM Mascotas;

SELECT * FROM Veterinarios;

SELECT * FROM Citas;

SELECT
    m.nombre AS mascota,
    m.especie,
    p.nombre AS propietario
FROM Mascotas m
INNER JOIN Propietarios p
    ON m.id_propietario = p.id_propietario;

SELECT
    c.id_cita,
    c.fecha,
    c.motivo,
    m.nombre AS mascota,
    v.nombre AS veterinario
FROM Citas c
INNER JOIN Mascotas m
    ON c.id_mascota = m.id_mascota
INNER JOIN Veterinarios v
    ON c.id_veterinario = v.id_veterinario;

