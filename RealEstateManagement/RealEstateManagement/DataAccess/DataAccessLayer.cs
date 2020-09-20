using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RealEstateManagement.DataAccess
{
    public class DataAccessLayer
    {
        public List <RealEstateManagement.Models.MunicipalityTax> GetTaxValue(string name, DateTime dateTime)
        {
            Entities _context = new Entities();
            int data = _context.CalculateTax(name, dateTime);

            SqlParameter municipalityName = new SqlParameter("@MunicipalityName", name);
            SqlParameter taxDate = new SqlParameter("@taxDate", dateTime);
            var result = _context.Database.SqlQuery<RealEstateManagement.Models.MunicipalityTax>("exec CalculateTax @MunicipalityName, @taxDate", municipalityName, taxDate).ToList();

            return result;
        }

        public string PostMunicipalityTax(RealEstateManagement.Models.PostMunicipality postMunicipality)
        {
            Entities _context = new Entities();
            var data = new Municipality();
            data = _context.Municipalities.Where(i => i.MunicipalityName == postMunicipality.MunicipalityName).FirstOrDefault();
            if (data != null)
            {
                var checkData = _context.MunicipalityTaxes.Where(i => i.MunicipalityId == data.Id && i.TaxDate == postMunicipality.TaxDate).FirstOrDefault();

                if (checkData == null)
                {
                    var t = new MunicipalityTax()
                    {
                        MunicipalityId = data.Id,
                        TaxType = postMunicipality.TaxType,
                        TaxDate = postMunicipality.TaxDate,
                        Tax = postMunicipality.Tax
                    };
                    _context.MunicipalityTaxes.Add(t);
                    _context.SaveChanges();
                }
                else
                {
                    checkData.Tax = postMunicipality.Tax;
                    checkData.TaxType = postMunicipality.TaxType;
                    _context.SaveChanges();

                    return "Record updated successfully;";
                }
            }
            else
                return "No Municipality found in the given name";
           
            return "New Record inserted successfully;";
        }
    }
}