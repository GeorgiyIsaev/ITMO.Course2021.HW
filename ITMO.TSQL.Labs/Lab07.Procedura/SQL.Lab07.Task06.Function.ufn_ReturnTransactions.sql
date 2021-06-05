/*�������� �������*/
CREATE FUNCTION TransactionDetails.ufn_ReturnTransactions (@CustID bigint)
RETURNS @Trans TABLE (TransactionId bigint,
	CustomerId bigint,
	TransactionDescription nvarchar(30),
	DateEntered datetime,
	Amount money)
AS
BEGIN
	INSERT INTO @Trans
	SELECT TransactionId, CustomerId,TransactionDescription,
		DateEntered, Amount
	FROM TransactionDetails.Transactions AS t
		JOIN TransactionDetails.TransactionTypes AS tt
		ON tt.TransactionTypesId = t.TransactionType
	WHERE CustomerId = @CustID
	RETURN
END;/*������������� ������� - ������� 1*/SELECT c.CustomerFirstName, c.CustomerLastName,
Trans.TransactionId, TransactionDescription,
DateEntered, Amount
FROM CustomerDetails.Customers AS c
CROSS APPLY
TransactionDetails.ufn_ReturnTransactions (c.CustomerId) AS Trans;
/*������������� ������� - ������� 2*/
SELECT c.CustomerFirstName, c.CustomerLastName,
Trans.TransactionId, TransactionDescription,
DateEntered, Amount
FROM CustomerDetails.Customers AS c
OUTER APPLY
TransactionDetails.ufn_ReturnTransactions (c.CustomerId) AS Trans;