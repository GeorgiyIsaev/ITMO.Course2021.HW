USE ApressFinancial
GO

/*первичный кластеризованный ключ;*/
ALTER TABLE CustomerDetails.CustomersProducts
ADD CONSTRAINT PK_CustomersProducts
PRIMARY KEY CLUSTERED 
 (CustomerFinancialProductID)
ON [PRIMARY]
GO

/*ограничение для столбца AmountToCollect, которое гарантирует, что с этого момента для 
всех вставляемых записей долг должен быть больше нуля;*/
ALTER TABLE CustomerDetails.CustomersProducts
WITH NOCHECK
ADD CONSTRAINT CK_CustProds_AmtCheck
CHECK (AmountToCollect > 0 )
GO

/* ограничение DEFAULT для столбца Renewable, т.е. будет вставлено значение 0, если в 
этот столбец не будет введено значение (это означает, что полученная премия является 
разовой);*/
ALTER TABLE CustomerDetails.CustomersProducts
WITH NOCHECK
ADD CONSTRAINT DF_CustProds_Renewable
 DEFAULT (0)
 FOR Renewable
GO
