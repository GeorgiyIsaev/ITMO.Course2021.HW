/*”ровень изол€ции SERIALIZABLE*/
USE [test_block];
-- Connection 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN;
 SELECT [ID], [Name], [Price], [Discount]
 FROM dbo.[t1]
 WHERE [Discount] < 0.20;

-- Connection 1
 SELECT [ID], [Name], [Price], [Discount]
 FROM dbo.[t1]
 WHERE [Discount] < 0.20;
COMMIT TRAN;