using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateManagement.Models
{
    public class PostMunicipality
    {
        public string MunicipalityName { get; set; }
        public DateTime TaxDate { get; set; }
        public byte TaxType { get; set; }
        public double Tax { get; set; }
    }
}