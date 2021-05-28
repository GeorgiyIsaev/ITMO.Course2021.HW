/*1/���������� ��� ������� � ������� Person*/
SELECT *
FROM Person.Person
/*2. ���������� ������ ��������� ������� � ������� Person*/
SELECT Title, FirstName, LastName, MiddleName
FROM Person.Person
/*3. ��������� ���������� ����� � ������� v.1*/
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production. Product
WHERE ListPrice < $100
/*3. ��������� ���������� ����� � ������� v.2*/
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE ListPrice < $100
AND ProductNumber LIKE 'SO%'
/*4. ���������� ������ � ������� ��������� �����*/
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production. Product
WHERE ListPrice < $100
AND ProductNumber Like 'SO%'
OR ProductNumber Like 'TG%'
/*5. ��������� ��������� �������*/
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production. Product
WHERE ProductNumber LIKE 'SOX'
OR (ListPrice Between $50 and $180
AND ProductNumber LIKE 'TG%')