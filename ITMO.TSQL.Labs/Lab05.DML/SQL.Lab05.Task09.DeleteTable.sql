/*������� ������� � �� tempdb �� ������� ������� �� �� ApressFinancial*/
USE tempdb
GO
SELECT CustomerId, CustomerFirstName,
 CustomerOtherInitials, CustomerLastName
INTO dbo.Customers
FROM ApressFinancial.CustomerDetails.CustomersSelect * FROM dbo.Customers/*�������� ������ �� ��������� �������*/DELETE FROM dbo.Customers
WHERE CustomerId = 4

Select * FROM dbo.Customers

/*�������� ���� ������*/
DELETE FROM dbo.Customers

Select * FROM dbo.Customers

/*������� ��������*/
INSERT INTO [dbo].[Customers]
           ([CustomerFirstName]
           ,[CustomerOtherInitials]
           ,[CustomerLastName])
     VALUES ('testFN','testOI','testLN')
GO
Select * FROM dbo.Customers

/*�������� ����� ����� TRUNCATE*/
TRUNCATE TABLE dbo.Customers
/*������� ��������*/
INSERT INTO [dbo].[Customers]
           ([CustomerFirstName]
           ,[CustomerOtherInitials]
           ,[CustomerLastName])
     VALUES ('testFN','testOI','testLN')
GO
Select * FROM dbo.Customers
