/*�������� ��������� ����� ������*/
/*��������������� ������ � ������� ���������*/
USE ApressFinancial
GO
ALTER TABLE TransactionDetails.Transactions
WITH NOCHECK
ADD CONSTRAINT FK_Transactions_Shares FOREIGN KEY (RelatedShareId)
REFERENCES ShareDetails.Shares(ShareID)
GO

/*����� �������� ��������� ���� ��� ������� Shares*/
USE ApressFinancial
GO
ALTER TABLE [ShareDetails].[Shares]
ADD CONSTRAINT
PK_ShareID PRIMARY KEY NONCLUSTERED ([ShareID])
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [PRIMARY]
GO