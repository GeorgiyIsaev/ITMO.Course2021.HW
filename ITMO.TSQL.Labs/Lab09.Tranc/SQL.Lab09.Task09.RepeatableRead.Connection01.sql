/*”ровень изол€ции REPEATABLE READ*/
USE [test_block];
-- Connection 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;
SELECT [ID],[Price] FROM dbo.[t1] WHERE [ID] = 2;

-- Connection 1
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
COMMIT TRAN;