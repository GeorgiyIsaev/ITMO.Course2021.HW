/*—крипт измененной таблицы после добавлени€ свз€и в ручную*/
USE [ApressFinancial]
GO

/****** Object:  Table [TransactionDetails].[Transactions]    Script Date: 28.05.2021 19:51:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TransactionDetails].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[DateEntered] [datetime] NOT NULL,
	[Amount] [numeric](18, 5) NOT NULL,
	[ReferenceDetails] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[RelatedShareId] [bigint] NULL,
	[RelatedProductId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [TransactionDetails].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Transactions] FOREIGN KEY([CustomerId])
REFERENCES [CustomerDetails].[Customers] ([CustomerId])
GO

ALTER TABLE [TransactionDetails].[Transactions] CHECK CONSTRAINT [FK_Customers_Transactions]
GO


