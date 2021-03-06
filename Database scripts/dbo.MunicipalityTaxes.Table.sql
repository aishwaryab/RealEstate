USE [RealEstate]
GO
/****** Object:  Table [dbo].[MunicipalityTaxes]    Script Date: 9/20/2020 9:43:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunicipalityTaxes](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[MunicipalityId] [tinyint] NOT NULL,
	[TaxType] [tinyint] NOT NULL,
	[TaxDate] [date] NOT NULL,
	[Tax] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MunicipalityTaxes] ON 

INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (1, 1, 1, CAST(N'2020-09-19' AS Date), 70)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (2, 1, 1, CAST(N'2020-01-01' AS Date), 100)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (3, 1, 1, CAST(N'2020-01-02' AS Date), 10)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (4, 1, 1, CAST(N'2020-01-03' AS Date), 30)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (5, 1, 1, CAST(N'2020-01-04' AS Date), 10)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (6, 1, 1, CAST(N'2017-01-01' AS Date), 70)
SET IDENTITY_INSERT [dbo].[MunicipalityTaxes] OFF
ALTER TABLE [dbo].[MunicipalityTaxes]  WITH CHECK ADD FOREIGN KEY([MunicipalityId])
REFERENCES [dbo].[Municipality] ([Id])
GO
ALTER TABLE [dbo].[MunicipalityTaxes]  WITH CHECK ADD FOREIGN KEY([TaxType])
REFERENCES [dbo].[TaxType] ([Id])
GO
