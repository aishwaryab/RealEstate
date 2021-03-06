USE [RealEstate]
GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 9/20/2020 9:43:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TaxType] ON 

INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (1, N'Daily')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (2, N'Weekly')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (3, N'Monthly')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (4, N'Yearly')
SET IDENTITY_INSERT [dbo].[TaxType] OFF
