USE ApressFinancial
GO

/*��������� ���������������� ����;*/
ALTER TABLE CustomerDetails.CustomersProducts
ADD CONSTRAINT PK_CustomersProducts
PRIMARY KEY CLUSTERED 
 (CustomerFinancialProductID)
ON [PRIMARY]
GO

/*����������� ��� ������� AmountToCollect, ������� �����������, ��� � ����� ������� ��� 
���� ����������� ������� ���� ������ ���� ������ ����;*/
ALTER TABLE CustomerDetails.CustomersProducts
WITH NOCHECK
ADD CONSTRAINT CK_CustProds_AmtCheck
CHECK (AmountToCollect > 0 )
GO

/* ����������� DEFAULT ��� ������� Renewable, �.�. ����� ��������� �������� 0, ���� � 
���� ������� �� ����� ������� �������� (��� ��������, ��� ���������� ������ �������� 
�������);*/
ALTER TABLE CustomerDetails.CustomersProducts
WITH NOCHECK
ADD CONSTRAINT DF_CustProds_Renewable
 DEFAULT (0)
 FOR Renewable
GO
