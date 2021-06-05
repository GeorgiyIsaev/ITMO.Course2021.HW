/*Транзакции - работа COMMIT TRAN*/
USE ApressFinancial
GO

SELECT 'Before',ShareId,ShareDesc,CurrentPrice
	FROM ShareDetails.Shares
	WHERE ShareId = 3
BEGIN TRAN ShareUpd
	UPDATE ShareDetails.Shares
	SET CurrentPrice = CurrentPrice * 1.1
	WHERE ShareId = 3
COMMIT TRAN

SELECT 'After',ShareId,ShareDesc,CurrentPrice
	FROM ShareDetails.Shares
	WHERE ShareId = 3