/*�������� ��������� ������*/
USE ApressFinancial
GO
CREATE UNIQUE CLUSTERED INDEX IX_SharePrices
ON ShareDetails.SharePrices
(ShareID ASC, PriceDate ASC)
WITH 
(
	STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF
) 
ON [PRIMARY];

/*��� ��������� ������� ��� ������� ALTER!!*/
/*��� ���� ��� �� �������� ������ ��� ���������� �����������*/
/*��� ����� �������� �������� DROP_EXISTING = ON */


/*������������ ������*/
USE ApressFinancial
GO
CREATE UNIQUE CLUSTERED INDEX IX_SharePrices
ON ShareDetails.SharePrices
(ShareID ASC, PriceDate DESC, Price)
WITH 
(
	STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = ON, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF
) 
ON [PRIMARY]