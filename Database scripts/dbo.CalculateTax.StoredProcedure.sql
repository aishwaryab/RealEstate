USE [RealEstate]
GO
/****** Object:  StoredProcedure [dbo].[CalculateTax]    Script Date: 9/20/2020 9:43:46 AM ******/
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
