/*Создание тригера DML*/
USE ApressFinancial
GO
CREATE TRIGGER TransactionDetails.trgInsTransactions
ON TransactionDetails.Transactions
AFTER INSERT
AS
UPDATE CustomerDetails.Customers
SET CleareBalance = CleareBalance +
(
	SELECT CASE WHEN CreditType = 0
		THEN i.Amount * -1
		ELSE i.Amount
	END
	FROM INSERTED AS i
		JOIN TransactionDetails.TransactionTypes AS tt
		ON tt.TransactionTypesId = i.TransactionType
	WHERE AffectCashBalance = 1 
)
FROM CustomerDetails.Customers AS c
	JOIN INSERTED AS i
	ON i.CustomerId = c.CustomerId;

/*Тест тригера*/
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1;
INSERT INTO TransactionDetails.Transactions
	(CustomerId,TransactionType,Amount,RelatedProductId,DateEntered)
VALUES (1, 2, 200, 1, GETDATE())
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1;

/**Надежная транзакция*/
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1;
INSERT INTO TransactionDetails.Transactions
	(CustomerId,TransactionType,Amount,RelatedProductId,DateEntered)
VALUES (1, 3, 200, 1, GETDATE())
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1;/*Изменение тригера*/ALTER TRIGGER TransactionDetails.trgInsTransactions
ON TransactionDetails.Transactions
AFTER INSERT
AS
UPDATE CustomerDetails.Customers
SET CleareBalance = CleareBalance +
ISNULL((SELECT CASE WHEN CreditType = 0
		THEN i.Amount * -1
		ELSE i.Amount
	END
	FROM INSERTED AS i
		JOIN TransactionDetails.TransactionTypes AS tt
		ON tt.TransactionTypesId = i.TransactionType
	WHERE AffectCashBalance = 1 ), 0)
	FROM CustomerDetails.Customers AS c
		JOIN INSERTED AS i
		ON i.CustomerId = c.CustomerId;

/*Вызов тригера при ставки данных*/
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1;
INSERT INTO TransactionDetails.Transactions
(CustomerId,TransactionType,Amount,RelatedProductId,DateEntered)
VALUES (1, 3, 200, 1, GETDATE())
SELECT CleareBalance FROM CustomerDetails.Customers WHERE CustomerId=1