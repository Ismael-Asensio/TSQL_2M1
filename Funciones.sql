CREATE DATABASE FuncPeli

USE FuncPeli

CREATE TABLE Pais(
IdP INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NomP NVARCHAR(55) NOT NULL
)

CREATE TABLE Departamento(
IdDep INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NomDep NVARCHAR(55) NOT NULL,
IdP INT FOREIGN KEY REFERENCES Pais(IdP) NOT NULL
)

CREATE TABLE Municipio(
IdMun INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NomMun NVARCHAR NOT NULL,
IdDep INT FOREIGN KEY REFERENCES Departamento(IdDep) NOT NULL
)

CREATE TABLE Participante(
IdPar INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CanPel INT NOT NULL,
PNP NVARCHAR(25) NOT NULL,
SNP NVARCHAR(25),
PAP NVARCHAR(25) NOT NULL,
SAP NVARCHAR(25),
IdP INT FOREIGN KEY REFERENCES Pais(IdP) NOT NULL
)

CREATE TABLE Actor(
IdAc INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TipAc CHAR(1) CHECK(TipAc LIKE '[P|S|R|p|s|r]') NOT NULL,
IdPar INT FOREIGN KEY REFERENCES Participante(IdPar) NOT NULL
)

CREATE TABLE Director(
IdDir INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TipDir CHAR(1) CHECK(TipDir LIKE '[P|C|p|c]') NOT NULL,
IdPar INT FOREIGN KEY REFERENCES Participante(IdPar) NOT NULL
)

-- CLASIFICACIONES SEGUN MPAA SON G, PG, PG-13, R, NC-17... PERO TAMBIEN SE PUEDE USAR APTO PARA TODOS, +9, +15, +18

CREATE TABLE ClasifacionPelicula(
TipCla NVARCHAR(5) PRIMARY KEY NOT NULL,
DescCla NVARCHAR (75) NOT NULL,
)

CREATE TABLE GeneroPelicula(
IdG INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NomG NVARCHAR(55) NOT NULL,
DescG NVARCHAR(125) NOT NULL,
)

CREATE TABLE Peliculas(
IdtPel CHAR(8) PRIMARY KEY NOT NULL,
TitOr NVARCHAR(95) NOT NULL,
TitDis NVARCHAR(95) NOT NULL,
IdiOr NVARCHAR(25) NOT NULL,
YearPro DATE NOT NULL,
DurPel TIME NOT NULL,
FecEst DATE NOT NULL,
ResPel NVARCHAR(225) NOT NULL,
SubPel CHAR(1) CHECK(SubPel LIKE '[S|N|s|n]') NOT NULL,
IdG INT FOREIGN KEY REFERENCES GeneroPelicula(IdG) NOT NULL,
IdP INT FOREIGN KEY REFERENCES Pais(IdP) NOT NULL,
TipCla NVARCHAR(5) FOREIGN KEY REFERENCES ClasifacionPelicula(TipCla) NOT NULL
)

-- DETERMINAMOS LA CALIFICACION SEGUN LA OPINION OBRA MAESTRA, MUY BUENA, BUENA, REGULAR, MALA

CREATE TABLE Calificacion(
TipCal NVARCHAR(15) PRIMARY KEY NOT NULL,
DescCal NVARCHAR (125) NOT NULL,
)

CREATE TABLE Opinion(
NoOp INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
FecOp DATE NOT NULL,
EdRe CHAR(2) CHECK (EdRe LIKE '[0-9][0-9]') NOT NULL,
PNR NVARCHAR(25) NOT NULL,
SNR NVARCHAR(25),
PAR NVARCHAR(25) NOT NULL,
SAR NVARCHAR(25),
TipCal NVARCHAR(15) FOREIGN KEY REFERENCES Calificacion(TipCal) NOT NULL,
IdtPel CHAR(8) FOREIGN KEY REFERENCES Peliculas(IdtPel) NOT NULL
)

-- INSERTAR SI ES COMBO O PROMOCION ESPECIAL, ADEM�S DE LA DURACI�N DE LA PROMOCI�N ESPECIAL

CREATE TABLE TipoPromo(
IdTP INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdentTP CHAR (1) CHECK (IdentTP LIKE '[C|E|c|e]') NOT NULL,
FecITP DATE NOT NULL,
FecFTP DATE NOT NULL,
NomTP NVARCHAR(65) NOT NULL,
DescTP NVARCHAR(125) NOT NULL
)

CREATE TABLE Promo(
IdProm INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
DProm FLOAT NOT NULL,
DetProm NVARCHAR(125) NOT NULL,
IdTP INT FOREIGN KEY REFERENCES TipoPromo(IdTP) NOT NULL
)

CREATE TABLE Funcion(
IdFun INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
HoraIni TIME NOT NULL,
Dur TIME NOT NULL,
IdProm INT FOREIGN KEY REFERENCES Promo(IdProm) NOT NULL,
IdtPel CHAR(8) FOREIGN KEY REFERENCES Peliculas(IdtPel) NOT NULL
)

CREATE TABLE Sala(
NoS INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NomS NVARCHAR(55) NOT NULL,
TelS CHAR(8) CHECK(TelS LIKE '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
IdFun INT FOREIGN KEY REFERENCES Funcion(IdFun) NOT NULL
)