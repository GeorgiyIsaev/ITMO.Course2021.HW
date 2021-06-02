/*Создать таблицу в БД tempdb на основле таблицы из БД ApressFinancial*/
USE tempdb
GO
SELECT CustomerId, CustomerFirstName,
 CustomerOtherInitials, CustomerLastName
INTO dbo.Customers
FROM ApressFinancial.CustomerDetails.CustomersSelect * FROM dbo.Customers/*Удаление данных из созданной таблицы*/DELETE FROM dbo.Customers
WHERE CustomerId = 4

Select * FROM dbo.Customers

/*Удаление всех данных*/
DELETE FROM dbo.Customers

Select * FROM dbo.Customers

/*Добавим значение*/
INSERT INTO [dbo].[Customers]
           ([CustomerFirstName]
           ,[CustomerOtherInitials]
           ,[CustomerLastName])
     VALUES ('testFN','testOI','testLN')
GO
Select * FROM dbo.Customers

/*Удаление даных через TRUNCATE*/
TRUNCATE TABLE dbo.Customers
/*Добавим значение*/
INSERT INTO [dbo].[Customers]
           ([CustomerFirstName]
           ,[CustomerOtherInitials]
           ,[CustomerLastName])
     VALUES ('testFN','testOI','testLN')
GO
Select * FROM dbo.Customers
