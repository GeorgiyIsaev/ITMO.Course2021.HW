/*����� �������������*/
/*������� �������� �������*/
ALTER TABLE CustomerDetails.Customers 
ALTER COLUMN CustomerFirstName nvarchar(100)
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
GO
GO
GO
SET QUOTED_IDENTIFIER OFF
GO
ON CustomerDetails.v_CustFinProducts (AccountNumber, ProductName)