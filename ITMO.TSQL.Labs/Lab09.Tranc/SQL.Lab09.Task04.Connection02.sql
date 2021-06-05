
USE [test_block];

/*Ѕесконечный цикл*/
-- Connection 2
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2

/*«апрос с ожиданием и прерывание если врем€ превышенно*/
-- Connection 2
-- Stop, then set the LOCK_TIMEOUT, then retry
SET LOCK_TIMEOUT 5000;
SELECT [ID], [Price]
FROM dbo.[t1]
WHERE [ID] = 2;

/*«апрос с ожиданием где врем€ по умолчанию*/
-- Connection 2
-- Remove timeout
SET LOCK_TIMEOUT -1;
SELECT [ID], [Price]
FROM dbo.[t1]
WHERE [ID] = 2;