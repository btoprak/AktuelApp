using System;


namespace AktuelApp.API.Models
{
    public class Aktuel
    {
        public int Id { get; set; }
        public string AktuelName { get; set; }
        public int AktuelId { get; set; }
        public DateTime ReleasedDate { get; set; }
        public int CompanyId { get; set; }
        public string AktuelImageUrl { get; set; }  
    }
}
