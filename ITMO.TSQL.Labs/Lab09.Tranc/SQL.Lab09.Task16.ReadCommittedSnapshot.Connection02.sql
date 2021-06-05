USE [test_block];
go

-- Connection 2
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;
-- Connection 2
BEGIN TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;

/*¬ернуть свойства базы в изначалное состо€ние*/
ALTER DATABASE [test_block] SET ALLOW_SNAPSHOT_ISOLATION OFF;
ALTER DATABASE [test_block] SET READ_COMMITTED_SNAPSHOT OFF;