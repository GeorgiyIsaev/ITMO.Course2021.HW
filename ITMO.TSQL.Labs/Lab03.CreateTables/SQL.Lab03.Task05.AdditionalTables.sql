/*Создание дополнительных таблиц из скрипта!*/

USE ApressFinancial
GO

CREATE TABLE CustomerDetails.CustomersProducts
(
	CustomerFinancialProductID bigint IDENTITY (1,1) NOT NULL,
	CustomerId bigint NOT NULL,
	FinancialProductID bigint NOT NULL,
	AmountToCollect money NOT NULL,
	Frequency smallint NOT NULL,
	LastCollected datetime NOT NULL,
	LastCollection datetime NOT NULL,
	Renewable bit NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE CustomerDetails.FinancialProducts
(
	ProductID bigint NOT NULL,
	ProductName nvarchar(50) NOT NULL
) ON [PRIMARY]
GO

-- Создадим схему ShareDetails и в ней таблицу SharePrices одной инструкцией!
CREATE SCHEMA ShareDetails AUTHORIZATION dbo
CREATE TABLE SharePrices 
(
	SharePriceID bigint IDENTITY (1,1) NOT NULL,
	ShareID bigint NOT NULL,
	Price numeric(18,5) NOT NULL, PriceDate datetime NOT NULL
 ) 
GO

CREATE TABLE ShareDetails.Shares
(
	ShareID bigint IDENTITY (1,1) NOT NULL,
	ShareDesc nvarchar(50) NOT NULL,
	ShareTickerID nvarchar(50) NULL,
	CurrentPrice numeric(18,5) NOT NULL
) ON [PRIMARY]
GO