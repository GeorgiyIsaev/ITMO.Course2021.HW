/*Скрипт от таблицы созданной в ручную*/
USE [ApressFinancial]
GO

/****** Object:  Table [CustomerDetails].[Customers]    Script Date: 28.05.2021 19:23:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CustomerDetails].[Customers](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerTitleId] [int] NOT NULL,
	[CustomerFerstName] [nvarchar](50) NOT NULL,
	[CustomerOtherInitals] [nvarchar](10) NULL,
	[CustomerLastName] [nvarchar](50) NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[AccountNumber] [nchar](15) NOT NULL,
	[AccountTypeId] [int] NOT NULL,
	[CleareBalance] [money] NOT NULL,
	[UndeareBalance] [money] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY NONCLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CustomerDetails].[Customers] ADD  CONSTRAINT [DF_Customers_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Из задания 1' , @level0type=N'SCHEMA',@level0name=N'CustomerDetails', @level1type=N'TABLE',@level1name=N'Customers'
GO


