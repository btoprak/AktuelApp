using System.Threading.Tasks;
using AktuelApp.API.Data;
using AktuelApp.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AktuelDetailsController : ControllerBase
    {
        private readonly IEntityRepository _repo;

        public AktuelDetailsController(IEntityRepository repo)
        {
            _repo = repo;
        }
        // GET api/values
        [HttpGet]
        public IActionResult GetAktuelDetails()
        {
            var aktueldetails = _repo.GetAktuelDetails();
            return Ok(aktueldetails);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public IActionResult GetAktuelDetail(int id)
        {
            var aktueldetail = _repo.GetAktuelDetail(p => p.Id == id);
            return Ok(aktueldetail);
        }

        [HttpGet("aktuel/{id}")]
        public IActionResult GetListByAktuelId(int id)
        {
            var aktuelphotos = _repo.GetAktuelDetails();
            var lists = _repo.GetAktuelDetails(d => d.AktuelId == id);
            
            return Ok(lists);
        }
        
        [HttpPost]
        public IActionResult Post([FromBody]AktuelDetail aktuelDetail)
        {
            try
            {
                _repo.Add(aktuelDetail);
                return new StatusCodeResult(201);
            }
            catch
            {
            }
            return BadRequest();
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public IActionResult Put(AktuelDetail aktueldetails)
        {
            try
            {
                _repo.Update(aktueldetails);
                return Ok(aktueldetails);
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
                _repo.Delete(new AktuelDetail { Id=id});
                return Ok();
            }
            catch
            {
            }
            return BadRequest();
        }
    }
}