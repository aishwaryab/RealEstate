using RealEstateManagement.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RealEstateManagement.Controllers
{
    [Route("api/Municipality")]
    public class MunicipalityController : ApiController
    {
        [HttpGet]
        // GET api/Municipality
        public IEnumerable<RealEstateManagement.Models.MunicipalityTax> Get(string municipalityName, DateTime TaxDate)
        {
            DataAccessLayer _context = new DataAccessLayer();
            return _context.GetTaxValue(municipalityName, TaxDate);
        }
        [Route("api/Municipality/AddNewTax")]
        [HttpGet]
        public IHttpActionResult AddNewTax(RealEstateManagement.Models.PostMunicipality postMunicipality)
        {
            DataAccessLayer dataAccessLayer = new DataAccessLayer();
           var result = dataAccessLayer.PostMunicipalityTax(postMunicipality);
            return Ok(result);
        }
       
    }
}
