USE [test_block];

-- Connection 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT [ID], [Price] FROM dbo.[t1] WHERE [ID] = 2;

/*������ ����������� ����, �� ���������� ����������� � ������ ������*/