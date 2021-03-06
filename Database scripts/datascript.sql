USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 9/20/2020 9:45:36 AM ******/
CREATE DATABASE [RealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RealEstate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY FULL 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RealEstate] SET QUERY_STORE = OFF
GO
USE [RealEstate]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[Municipality]    Script Date: 9/20/2020 9:45:37 AM ******/
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
/****** Object:  Table [dbo].[MunicipalityTaxes]    Script Date: 9/20/2020 9:45:37 AM ******/
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
/****** Object:  Table [dbo].[TaxType]    Script Date: 9/20/2020 9:45:37 AM ******/
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
SET IDENTITY_INSERT [dbo].[Municipality] ON 

INSERT [dbo].[Municipality] ([Id], [MunicipalityName]) VALUES (1, N'Copenhagen')
SET IDENTITY_INSERT [dbo].[Municipality] OFF
SET IDENTITY_INSERT [dbo].[MunicipalityTaxes] ON 

INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (1, 1, 1, CAST(N'2020-09-19' AS Date), 70)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (2, 1, 1, CAST(N'2020-01-01' AS Date), 100)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (3, 1, 1, CAST(N'2020-01-02' AS Date), 10)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (4, 1, 1, CAST(N'2020-01-03' AS Date), 30)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (5, 1, 1, CAST(N'2020-01-04' AS Date), 10)
INSERT [dbo].[MunicipalityTaxes] ([Id], [MunicipalityId], [TaxType], [TaxDate], [Tax]) VALUES (6, 1, 1, CAST(N'2017-01-01' AS Date), 70)
SET IDENTITY_INSERT [dbo].[MunicipalityTaxes] OFF
SET IDENTITY_INSERT [dbo].[TaxType] ON 

INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (1, N'Daily')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (2, N'Weekly')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (3, N'Monthly')
INSERT [dbo].[TaxType] ([Id], [Name]) VALUES (4, N'Yearly')
SET IDENTITY_INSERT [dbo].[TaxType] OFF
ALTER TABLE [dbo].[MunicipalityTaxes]  WITH CHECK ADD FOREIGN KEY([MunicipalityId])
REFERENCES [dbo].[Municipality] ([Id])
GO
ALTER TABLE [dbo].[MunicipalityTaxes]  WITH CHECK ADD FOREIGN KEY([TaxType])
REFERENCES [dbo].[TaxType] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[CalculateTax]    Script Date: 9/20/2020 9:45:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateTax]
@MunicipalityName varchar(20),
@taxDate date
as

CREATE TABLE #TEMP(
MunicipalityName varchar(20),
taxDate date,
tax float)

INSERT INTO #TEMP
SELECT 
MunicipalityName,
taxDate,
tax 

FROM MunicipalityTaxes t
JOIN Municipality m ON m.Id = t.MunicipalityId
WHERE TaxDate=@taxDate and m.MunicipalityName= @MunicipalityName

IF not exists (SELECT 1 FROM #TEMP) 
          BEGIN 

		  INSERT INTO #TEMP
SELECT 
m.MunicipalityName,
@taxDate,
AVG(tax)

FROM MunicipalityTaxes t
JOIN Municipality m ON m.Id = t.MunicipalityId
WHERE month(TaxDate) = month( @taxDate) and m.MunicipalityName= @MunicipalityName
GROUP BY month(TaxDate),m.MunicipalityName
       END

	   IF not exists (SELECT 1 FROM #TEMP) 
          BEGIN 

		  INSERT INTO #TEMP
SELECT 
m.MunicipalityName,
@taxDate,
avg(tax)

FROM MunicipalityTaxes t
JOIN Municipality m on m.Id = t.MunicipalityId
WHERE year(TaxDate) = year( @taxDate) and m.MunicipalityName= @MunicipalityName
GROUP BY year(TaxDate), m.MunicipalityName
       END

	   SELECT * FROM #TEMP
GO;
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
