
USE ApressFinancial
GO

DELETE FROM CustomerDetails.Customers
DBCC CHECKIDENT ('CustomerDetails.Customers',RESEED,0)

INSERT INTO CustomerDetails.Customers
 (CustomerTitleId, CustomerLastName, CustomerFirstName,
 CustomerOtherInitials, AddressId, AccountNumber,
 AccountTypeId, CleareBalance, UncleareBalance)
VALUES (1, 'Brust', 'Andrew', 'J.', 133, 18176111, 1, 200.00, 2.00),
 (3, 'Lobel', 'Leonard', NULL, 145, 53431993, 1, 437.97, -10.56)