CREATE DATABASE DW_AdventureWorks;
GO
USE DW_AdventureWorks;
GO


CREATE TABLE SalesOrderDetail(
	SalesOrderDetailID INTEGER NOT NULL UNIQUE,
	OrderQty SMALLINT
);

CREATE TABLE Territory(
	TerritoryID INTEGER NOT NULL UNIQUE,
	[Name] NVARCHAR(50),
	CountryRegionCode NVARCHAR(3),
	[Group] NVARCHAR(50)
);

CREATE TABLE Tiempo (
	TiempoID DATE NOT NULL,
	Año INTEGER,
	Mes INTEGER,
	Semana INTEGER,
	Trimestre INTEGER,
	DiaDeSemana VARCHAR(15)
);

CREATE TABLE Product(
	ProductID INTEGER NOT NULL UNIQUE,
	[Name] NVARCHAR(50),
	ProductNumber NVARCHAR(25),
	StandardCost MONEY
);

CREATE TABLE Hechos_Ventas (
	Hechos_Ventas_ID INTEGER IDENTITY(1,1) NOT NULL UNIQUE,
	SalesOrderDetailID INTEGER NOT NULL,
	TerritoryID INTEGER NOT NULL,
	TiempoID DATE NOT NULL,
	ProductID INTEGER NOT NULL,
	LineTotal NUMERIC(38,6)
);
------------------------Llaves Primarias----------------------------------
--------------------------------------------------------------------------

ALTER TABLE SalesOrderDetail ADD CONSTRAINT SalesOrderDetail_PK PRIMARY KEY (SalesOrderDetailID);

ALTER TABLE Territory ADD CONSTRAINT Territory_PK PRIMARY KEY (TerritoryID);

ALTER TABLE Tiempo ADD CONSTRAINT Tiempo_PK PRIMARY KEY (TiempoID);

ALTER TABLE Product ADD CONSTRAINT Product_PK PRIMARY KEY (ProductID);

ALTER TABLE Hechos_Ventas ADD CONSTRAINT Hechos_Ventas_PK PRIMARY KEY (Hechos_Ventas_ID);

------------------------Llaves Foraneas-----------------------------------
--------------------------------------------------------------------------
ALTER TABLE Hechos_Ventas ADD CONSTRAINT Hechos_Ventas_FK1 FOREIGN KEY (SalesOrderDetailID) REFERENCES SalesOrderDetail (SalesOrderDetailID);
ALTER TABLE Hechos_Ventas ADD CONSTRAINT Hechos_Ventas_FK2 FOREIGN KEY (TerritoryID) REFERENCES Territory (TerritoryID);
ALTER TABLE Hechos_Ventas ADD CONSTRAINT Hechos_Ventas_FK3 FOREIGN KEY (TiempoID) REFERENCES Tiempo (TiempoID);
ALTER TABLE Hechos_Ventas ADD CONSTRAINT Hechos_Ventas_FK4 FOREIGN KEY (ProductID) REFERENCES Product (ProductID);