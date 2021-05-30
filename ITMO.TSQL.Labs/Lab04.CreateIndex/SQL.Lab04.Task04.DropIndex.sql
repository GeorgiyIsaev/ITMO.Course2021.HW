/*Удаление индекса через скрипт*/
USE ApressFinancial
GO
DROP INDEX IX_TransactionTypes 
ON TransactionDetails.TransactionTypes

/*Создать этот индекс заново!*/