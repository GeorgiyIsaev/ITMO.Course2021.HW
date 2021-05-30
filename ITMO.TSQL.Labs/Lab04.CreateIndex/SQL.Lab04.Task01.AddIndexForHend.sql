/*Этот индекс создан вручную через проект таблицы*/
USE [ApressFinancial]
GO

/****** Object:  Index [IX_Customers_CustomerId]    Script Date: 30.05.2021 20:05:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_CustomerId] ON [CustomerDetails].[Customers]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


