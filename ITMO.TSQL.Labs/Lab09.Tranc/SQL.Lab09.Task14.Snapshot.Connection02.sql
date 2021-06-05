USE [test_block];

-- Connection 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;

-- Connection 2
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
COMMIT TRAN;-- Connection 2, Step 1
 UPDATE dbo.[t1]
 SET [Price] = 25.00
 WHERE [ID] = 2;