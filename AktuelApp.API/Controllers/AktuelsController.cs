using System.Threading.Tasks;
using AktuelApp.API.Data;
using AktuelApp.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AktuelsController : ControllerBase
    {
        private readonly IEntityRepository _repo;

        public AktuelsController(IEntityRepository repo)
        {
            _repo = repo;
        }
        // GET api/values
        [HttpGet]
        public IActionResult GetAktuels()
        {
            var aktuels = _repo.GetAktuels();
            return Ok(aktuels);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public IActionResult GetAktuel(int id)
        {
            var aktuel = _repo.GetAktuel(p => p.Id == id);
            return Ok(aktuel);
        }

        [HttpGet("company/{id}")]
        public IActionResult GetListByCompanyId(int id)
        {
            var aktuels = _repo.GetAktuels();
            var lists = _repo.GetAktuels(d => d.CompanyId == id);
            
            return Ok(lists);
        }
        [HttpPost]
        public IActionResult Post([FromBody]Aktuel aktuel)
        {
            try
            {
                _repo.Add(aktuel);
                return new StatusCodeResult(201);
            }
            catch
            {
            }
            return BadRequest();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public IActionResult Put(Aktuel aktuel)
        {
            try
            {
                _repo.Update(aktuel);
                return Ok(aktuel);
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