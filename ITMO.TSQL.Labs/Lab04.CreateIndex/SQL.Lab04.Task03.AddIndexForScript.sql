/*Создание индекса через скрипт*/
USE ApressFinancial
GO
CREATE UNIQUE CLUSTERED INDEX IX_TransactionTypes
ON TransactionDetails.TransactionTypes 
(TransactionTypesId ASC)
WITH 
(
	STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF
) 
ON [PRIMARY]
GO

/* таким образом создали уникальный кластеризованный индекс для таблицы TransactionDetails.TransactionTypes */
/* теперь создадим некластеризованный индекс
 для таблицы TransactionDetails.Transactions
 на основе столбца TransactionType*/
CREATE NONCLUSTERED INDEX IX_Transactions_TTypes
ON TransactionDetails.Transactions 
(TransactionType ASC)
WITH 
(
	STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF
) 
ON [PRIMARY]
GO