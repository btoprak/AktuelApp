using System.Threading.Tasks;
using AktuelApp.API.Data;
using AktuelApp.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        private readonly IEntityRepository _repo;

        public CompaniesController(IEntityRepository repo)
        {
            _repo = repo;

        }
        // GET api/values
        [HttpGet]
        public IActionResult GetCompanies()
        {
            var companies =  _repo.GetCompanies();
            return Ok(companies);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public IActionResult GetCompany(int id)
        {
            try
            {
                var company = _repo.GetCompany(p => p.Id == id);
                if (company == null)
                {
                    return NotFound($"There is no company with Id={id}");
                }
                return Ok(company);
            }
            catch { }
            return BadRequest();
        }
        [HttpPost]
        public IActionResult Post([FromBody]Company company)
        {
           try
            {
                _repo.Add(company);
                return new StatusCodeResult(201);
            }
            catch
            {
            }
            return BadRequest();
        }

        // PUT api/values/5
        [HttpPut]
        public IActionResult Put(Company company)
        {
            try
            {
                _repo.Update(company);
                return Ok(company);
            }
            catch
            {
            }
            return BadRequest();
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                _repo.Delete(new Company { Id=id});
                return Ok();
            }
            catch
            {
            }
            return BadRequest();
        }
    }
}