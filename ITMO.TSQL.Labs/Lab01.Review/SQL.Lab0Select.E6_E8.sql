/*6. ��������� ������ ��������*/
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production. Product
WHERE ProductNumber LIKE 'SO%'
OR (ListPrice Between $50 and $180
AND ProductNumber LIKE 'TG%'
AND Size IN ('M', 'L'))

/*7.v1 ������ �� ���������� NUL*/
SELECT ProductNumber, Name, Weight
FROM Production. Product
WHERE ProductLine = NULL

/*7.v2 ������ �� ���������� NUL*/
SELECT ProductNumber, Name, Weight
FROM Production.Product
WHERE ProductLine IS NULL

/*7.v3 ������ �� ���������� NUL*/
SELECT ProductNumber, Name, Weight,
ISNULL(ProductLine, 'NA')
FROM Production.Product

/*7.v4 ������ �� ���������� NUL*/
SELECT ProductNumber, Name, Weight,
ISNULL(ProductLine, 'NA') AS 'Product Line'
FROM Production. Product

/*7.v5 ������ �� ���������� NUL*/
SELECT ProductNumber, Name, COALESCE (CONVERT(NVARCHAR, Weight),
SIZE, 'NA') AS Measurement,
ISNULL(ProductLine, 'NA') AS 'Product Line'
FROM Production. Product


/*8.v1 ���������� ������*/
SELECT ProductNumber, Name, Class
FROM Production.Product
ORDER BY Class

/*8.v2 ���������� ������*/
SELECT ProductNumber, Name, Class, ListPrice
FROM Production. Product
ORDER BY Class, ListPrice Desc















