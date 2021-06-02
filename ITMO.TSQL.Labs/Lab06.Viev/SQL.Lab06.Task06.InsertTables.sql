USE ApressFinancial
GO

INSERT INTO CustomerDetails.FinancialProducts 
	(ProductID,ProductName)
VALUES 
	 (1, 'Regular Savings'),
	 (2, 'Bonds Account'),
	 (3, 'Share Account'),
	 (4, 'Life Insurance');

INSERT INTO CustomerDetails.CustomersProducts
	(CustomerId,FinancialProductID,AmountToCollect,
	Frequency, LastCollected, LastCollection, Renewable )
 VALUES 
	 (1, 1, 200, 1, '31.10.2008', '31.10.2025', 0),
	 (1, 2, 50, 1, '24.10.2010', '24.03.2012', 0),
	 (2, 4, 150, 3, '20.10.2010', '20.10.2010', 1),
	 (3, 3, 500, 0, '24.10.2010', '24.10.2010', 0);