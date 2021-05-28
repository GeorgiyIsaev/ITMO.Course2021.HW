/*9. ���������� ������������ �����*/
SELECT DISTINCT Color
FROM Production. Product
WHERE ProductNumber LIKE 'HL%'

/*10.v1 ������������� ���������*/
SELECT LastName + ',' + FirstName
FROM Person.Person

/*10.v2 ������������� ���������*/
SELECT (LastName + ',' + FirstName)
AS Contacts
FROM Person.Person

/*10.v3 ������������� ���������*/
SELECT (LastName + ',' + FirstName) AS Contacts
FROM Person.Person
WHERE SUBSTRING (LastName,1,3)= 'Mac'

/*11.v1 ���������� �������*/
SELECT AVG(VacationHours)
AS 'AverageVacationHours',
SUM(SickLeaveHours) AS 'TotalSickLeave Hours'
FROM HumanResources.Employee
WHERE JobTitle LIKE 'XVice President%'

/*11.v2 ���������� �������*/
SELECT COUNT(*)
FROM HumanResources.Employee

/*12.v1 ������������� ���������� ������� � NULL*/
SELECT COUNT(*)
FROM Person.Address
WHERE ISNULL (AddressLine2, '0') = '0' 
 
/*12.v1 ������������� ���������� ������� � NULL*/
SELECT COUNT (AddressLine2)
FROM Person.Address

/*12.v1 ������������� ���������� ������� � NULL*/
SELECT COUNT (DISTINCT AddressLine2)
FROM Person.Address

/*13. ���������� ������*/
SELECT ProductID, AVG(DaysToManufacture)
AS 'AvgDaysToManufacture'
FROM Production.Product
GROUP BY ProductID
