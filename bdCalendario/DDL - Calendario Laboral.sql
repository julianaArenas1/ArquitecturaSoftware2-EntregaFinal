-- En Docker la base de datos 'calendariolaboral' ya la crea la imagen de Postgres
-- (variable POSTGRES_DB) y este script se ejecuta conectado a ella, por eso estas dos
-- instrucciones quedan comentadas (solo se usan al ejecutar el script a mano):
--Ejecutar primero
--DROP DATABASE CalendarioLaboral WITH (FORCE);
--Ejecutar segundo
--CREATE DATABASE CalendarioLaboral; 

--Para las siguientes instrucciones, se debe cambiar la conexión

--Crear la tabla TIPO
CREATE TABLE Tipo(
	Id SERIAL PRIMARY KEY,
	Tipo VARCHAR(100) NOT NULL
	);

/* Crear indice para TIPO
	ordenado por FECHA */
CREATE UNIQUE INDEX ixTipo
	ON Tipo(Tipo);

--Crear la tabla CALENDARIO
CREATE TABLE Calendario(
	Id SERIAL PRIMARY KEY,
	Fecha DATE NOT NULL,
	IdTipo INT NOT NULL,
    CONSTRAINT fkCalendario_Tipo FOREIGN KEY (IdTipo) REFERENCES Tipo(Id),
    Descripcion VARCHAR(100) NULL
	);
    
/* Crear indice para CALENDARIO
	ordenado por FECHA */
CREATE UNIQUE INDEX ixCalendario
	ON Calendario(Fecha);
    