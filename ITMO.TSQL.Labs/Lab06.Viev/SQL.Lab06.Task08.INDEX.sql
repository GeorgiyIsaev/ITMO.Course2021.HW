/*����� �������������*/SELECT * FROM CustomerDetails.v_CustFinProducts
/*������� �������� �������*/
ALTER TABLE CustomerDetails.Customers 
ALTER COLUMN CustomerFirstName nvarchar(100)/*������� ���������������� �������������*/SET ANSI_NULLS ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET ARITHABORT ON
GO
SET QUOTED_IDENTIFIER ON
GOSET NUMERIC_ROUNDABORT OFF
GOSET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GOCREATE UNIQUE CLUSTERED INDEX IX_CustFinProdS
ON CustomerDetails.v_CustFinProducts (AccountNumber, ProductName)