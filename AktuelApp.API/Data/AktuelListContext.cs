using AktuelApp.API.Models;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Data
{
    public class AktuelListContext : DbContext
    {
        public AktuelListContext(DbContextOptions<AktuelListContext> options) : base(options) { }

       

        public DbSet<Value> Values { get; set; }
        public DbSet<Company> Companies{get; set;}
        
        public DbSet<Aktuel> Aktuels{get; set;}

        public DbSet<AktuelDetail> AktuelDetails{get; set;}
    }
}