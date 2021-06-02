/*Обновление по условию*/
USE ApressFinancial
GO
UPDATE CustomerDetails.Customers
SET CustomerLastName = 'Brodie'
WHERE CustomerId = 4/*Обновление с помощью информации из другой таблицы*/USE ApressFinancial
GO
DECLARE @ValueToUpdate VARCHAR(30)
SET @ValueToUpdate = 'McGlynn'
UPDATE CustomerDetails.Customers
SET CustomerLastName = @ValueToUpdate,
 CleareBalance = CleareBalance + UncleareBalance,
 UncleareBalance = 0
WHERE CustomerLastName = 'Brodie'/*Обновление столбцов данные которых не совпадают*/USE ApressFinancial
GO
DECLARE @WrongDataType VARCHAR(20)
SET @WrongDataType = '4311.22'
UPDATE CustomerDetails.Customers
SET CleareBalance = @WrongDataType
WHERE CustomerId = 4