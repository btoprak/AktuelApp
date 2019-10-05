using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AktuelApp.API.Data;
using AktuelApp.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly AktuelListContext _context;

        public ValuesController(AktuelListContext context)
        {
            _context = context;

        }
        // GET api/values
        [HttpGet]
        public async Task<IActionResult> GetValues()
        {
            var values=await _context.Values.ToListAsync();
            return Ok(values);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetValue(int id)
        {
            var value=await _context.Values.FirstOrDefaultAsync(x=>x.Id==id);
            return Ok(value);
        }

        // POST api/values
        [HttpPost]
        public IActionResult Post([FromBody]Value value)
        {
            _context.Values.Add(value);
            return new StatusCodeResult(201);
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
