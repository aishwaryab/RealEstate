USE [RealEstate]
GO
/****** Object:  Table [dbo].[Municipality]    Script Date: 9/20/2020 9:43:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipality](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[MunicipalityName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Municipality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Municipality] ON 

INSERT [dbo].[Municipality] ([Id], [MunicipalityName]) VALUES (1, N'Copenhagen')
SET IDENTITY_INSERT [dbo].[Municipality] OFF
