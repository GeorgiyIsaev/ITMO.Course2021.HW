/*14. Использование предложения GROUP BY*/
SELECT Color, AVG(ListPrice) AS 'AvgListPrice'
FROM Production. Product
WHERE ProductNumber = 'FR-R72R-58'
GROUP BY ALL Color

/*15. Использование предложения HAVING*/
SELECT ProductID, AVG(OrderQty)
AS 'AverageQuantity', SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > $1000000.00 AND AVG(OrderQty) < 3

/*16.v1 Как работают операторы ROLLUP и CUBE*/
SELECT ProductID, Shelf, SUM(Quantity) AS 'QtySum'
FROM Production.ProductInventory
GROUP BY ROLLUP(ProductID, Shelf)

/*16.v2 Как работают операторы ROLLUP и CUBE*/
SELECT SalesOrderID, ProductID,
SUM(OrderQty) AS SumQuantity
FROM Sales.SalesOrderDetail
GROUP BY CUBE(SalesOrderID, ProductID)
ORDER BY SalesOrderID, ProductID

/*16.v3 Как работают операторы ROLLUP и CUBE*/
SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD',
GROUPING(SalesQuota) AS 'Grouping'
FROM sales.SalesPerson
GROUP BY CUBE(SalesQuota)

/*16.v4 Как работают операторы ROLLUP и CUBE*/
SELECT ProductID, Shelf, SUM(Quantity) AS 'TotalQuantity',
GROUPING (Shelf) AS 'Shelfgrouping'
FROM Production.ProductInventory
GROUP BY CUBE(ProductID, Shelf)

/*17.v1 Создание перекрестных запросов*/
SELECT Name, [RED], [BLUE], [BLACK]
FROM (SELECT SafetyStockLevel, Color, Name FROM
Production.Product) P
PIVOT
(
	SUM (SafetyStockLevel) FOR Color IN ([RED], [BLUE],[BLACK])
) AS PVT
WHERE Name LIKE '%Helmet%' ORDER BY Name

/*17.v2 Создание перекрестных запросов*/
SELECT Name, Attribute, Value
FROM
(SELECT Name, CAST (ProductLine as SQL_Variant) ProductLine,
CAST (StandardCost as Sql_variant) StandardCost,
CAST (ListPrice as sql_variant) ListPrice
FROM Production.Product) P UNPIVOT (Value FOR Attribute
IN ([ProductLine], [StandardCost], [ListPrice]))
AS UnPVT Order By Name Desc
