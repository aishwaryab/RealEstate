# RealEstate

To creat Database

Run the Database scripts/datascript.sql
I have inserted TaxType table

Id	Name
1	Daily
2	Weekly
3	Monthly
4	Yearly

********************************************************
ImportTaxData solution

1) Create a CSV file in below format to add the data into the database (without the header row)

   MunicipalityName, TaxType, TaxDate, Tax
   Copenhagen,1,1/1/2020,100
   Copenhagen,1,1/2/2020,10

Note: If taxType is not 1,2,3, or 4, then data will not be inserted for that rwo alone.

2) Place the file in below path 
   project folder "\ImportTaxData\ImportTaxData\DataHistory"

3) Execute the application
 If the MunicipalityName is a new, it will insert the new municipality in "Municipality" table 
	and will add the remaining data in "MunicipalityTax" table.

 If the MunicipalityName is not a new one, then the application will add the data in "MunicipalityTax" table.
	If the same municipality with same date is already available in database, it will update instead of adding.

********************************************************
RealEstateManagement solution

two endpoints are available

1) to get the data from database
If user wants to search for 
municipalityName=Copenhagen
TaxDate=2017-01-08

http://localhost:59520/api/Municipality?municipalityName=Copenhagen&TaxDate=2017-01-08

The Result will be:
[
    {
        "MunicipalityName": "Copenhagen",
        "TaxDate": "2017-01-08T00:00:00",
        "Tax": 37.5
    }
]


Note: This "T" in date will be an issue in Angular. but here it is not removed as I have not done UI part.

Created an stored procedure
It will first search for same date value with same MunicipalityName
If the value for that date is not available then it will take Average of that specific month.
If monthly value is also not available- then it will take average of yearly.

2) To add new tax details into the 

http://localhost:59520/api/Municipality/AddNewTax

Input Body in Json format:
{ 
	"MunicipalityName":"Copenhagen", 
	"TaxDate":"2017/01/01", 
	"Tax":70, 
	"TaxType": 1
}

Output text:
"New Record inserted successfully;"

If the same municipality name and date are already available in database- it will update
"Record updated successfully"

If the given municipality name is not found in the database
"No Municipality found in the given name"
