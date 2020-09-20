using ImportTaxData.Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportTaxData
{
    class MunicipalityTax
    {
        public string MunicipalityName { get; set; }
        public byte TaxType { get; set; }
        public DateTime TaxDate { get; set; }
        public double Tax { get; set; }
    }

    class Municipality
    {
        public string MunicipalityName { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var historicalData = File.ReadAllLines(@"..\..\DataHistory\DataHistory.csv");

            var tax = from i in historicalData
                      let data = i.Split(',')
                      select new MunicipalityTax
                      {
                          MunicipalityName = data[0],
                          TaxType = Convert.ToByte(data[1]),
                          TaxDate = Convert.ToDateTime(data[2]),
                          Tax = Convert.ToDouble(data[3])
                      };

            foreach (var i in tax)
            {
                bool result =PostData(i);
                if(result == true)
                    Console.WriteLine(i.MunicipalityName + "|" + i.TaxType + "|" + i.TaxDate + "|" + i.Tax + " --inserted successfully");
                else
                    Console.WriteLine(i.MunicipalityName + "|" + i.TaxType + "|" + i.TaxDate + "|" + i.Tax + " --Insertion failed as TaxType is wrong. Please correct it and try again.");
            }

            Console.WriteLine("Press any key to exit");
            Console.ReadLine();
        }
        public static bool PostData(MunicipalityTax municipality)
        {
            RealEstateEntities _context = new RealEstateEntities();
            var checkTaxtype = _context.TaxTypes.Where(i => i.Id == municipality.TaxType).FirstOrDefault();
            if (checkTaxtype == null)
                return false;
            
            var municipal = _context.Municipalities.Where(i => i.MunicipalityName == municipality.MunicipalityName).FirstOrDefault();
            if (municipal == null)
            {
                var t = new Data.Municipality();
                t.MunicipalityName = municipality.MunicipalityName;
                _context.Municipalities.Add(t);
                _context.SaveChanges();
            }

            var m = _context.MunicipalityTaxes.Where(i => i.Municipality.MunicipalityName == municipality.MunicipalityName && i.TaxDate == municipality.TaxDate).FirstOrDefault();
            var currentValue = _context.Municipalities.Where(i => i.MunicipalityName == municipality.MunicipalityName).FirstOrDefault();
            if (m == null)
            {
                var t = new Data.MunicipalityTax()
                {
                    MunicipalityId = currentValue.Id,
                    TaxDate = municipality.TaxDate,
                    Tax = municipality.Tax,
                    TaxType = municipality.TaxType
                };
                _context.MunicipalityTaxes.Add(t);
                _context.SaveChanges();
            }
            else
            {
                m.TaxType = municipality.TaxType;
                m.Tax = municipality.Tax;
                _context.SaveChanges();
            }
            return true;
        }
    }


}
