/*������ ��������*/

USE [test_block];

-- Connection 1
BEGIN TRAN;
 UPDATE dbo.[t1]
 SET [Price] = [Price] + 1.00
 WHERE [ID] = 2;
SELECT [ID],[Price] FROM dbo.[t1] WHERE [ID] = 2;

/*����� ����������*/
-- Connection 1
ROLLBACK TRAN;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2
/*����������. ���������� ������ ��������. ��� ������ ��������� ������.*/