/*”ровень изол€ции READ COMMITTED SNAPSHOT*/
ALTER DATABASE [test_block] SET READ_COMMITTED_SNAPSHOT ON;

-- Connection 1
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
UPDATE dbo.[t1]
 SET [Price] = [Price] + 1.00
WHERE [ID] = 2;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
-- Connection 1
COMMIT TRAN;
