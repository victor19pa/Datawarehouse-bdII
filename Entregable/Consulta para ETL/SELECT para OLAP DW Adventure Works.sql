USE AdventureWorks2014;
GO
---------------------------------------------Sales.SalesOrderDetail-----------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
	Sales.SalesOrderDetail.SalesOrderDetailID,
	Sales.SalesOrderDetail.OrderQty
FROM Sales.SalesOrderDetail;

---------------------------------------------Time-----------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
	CONVERT(DATE, Sales.SalesOrderHeader.OrderDate) tiempoID,
	DATEPART(YEAR, Sales.SalesOrderHeader.OrderDate) Año,
	DATEPART(MONTH, Sales.SalesOrderHeader.OrderDate) Mes,
	DATEPART(WEEK, Sales.SalesOrderHeader.OrderDate) Semana,
	DATEPART(QUARTER, Sales.SalesOrderHeader.OrderDate) Trimestre,
	DATENAME(WEEKDAY, Sales.SalesOrderHeader.OrderDate) Dia_Semana
FROM Sales.SalesOrderHeader
GROUP BY Sales.SalesOrderHeader.OrderDate

---------------------------------------------Sales Territory------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT 
	Sales.SalesTerritory.TerritoryID,
	Sales.SalesTerritory.CountryRegionCode,
	Sales.SalesTerritory.[Name],
	Sales.SalesTerritory.[Group]
FROM Sales.SalesTerritory

---------------------------------------------Production.Products--------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
	Production.Product.ProductID,
	Production.Product.[Name],
	Production.Product.ProductNumber,
	Production.Product.StandardCost
FROM Production.Product
---------------------------------------------Hechos.Vendr----------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
	Sales.SalesOrderDetail.SalesOrderDetailID,
	Sales.SalesTerritory.TerritoryID,
	CONVERT(DATE,Sales.SalesOrderHeader.OrderDate) TiempoID,
	Production.Product.ProductID,
	Sales.SalesOrderDetail.LineTotal
FROM Sales.SalesOrderDetail
INNER JOIN Production.Product ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID
INNER JOIN Sales.SalesOrderHeader ON Sales.SalesOrderDetail.SalesOrderID = Sales.SalesOrderHeader.SalesOrderID
INNER JOIN Sales.SalesTerritory ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
