/*”ровень изол€ции REPEATABLE READ*/
USE [test_block];

-- Connection 2
UPDATE dbo.[t1]
 SET [Price] = [Price] + 1.00
WHERE [ID] = 2;