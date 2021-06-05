ALTER DATABASE [test_block] SET ALLOW_SNAPSHOT_ISOLATION ON

-- Connection 1
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
UPDATE dbo.[t1]
 SET [Price] = [Price] + 1.00
WHERE [ID] = 2;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
-- Connection 1
COMMIT TRAN;

-- Connection 1, Step 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRAN;
SELECT [ID],[Price] FROM dbo.[t1] WHERE [ID] = 2;-- Connection 1, Step 2
 UPDATE dbo.[t1]
 SET [Price] = 20.00
 WHERE [ID] = 2;
COMMIT TRAN;

-- Connection 1, Step 1
BEGIN TRAN;
SELECT [ID],[Price] FROM dbo.[t1] WHERE [ID] = 2;

-- Connection 1, Step 2
 UPDATE dbo.[t1]
 SET [Price] = 20.00
 WHERE [ID] = 2;