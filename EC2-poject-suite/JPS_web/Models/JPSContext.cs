using System.Data.Entity;

namespace JPS_web.Models
{
    /// <summary>
    /// JPS database context using Entity Framework
    /// </summary>
    public class JPSContext : DbContext
    {
        public DbSet<Bill> Bills { get; set; }
        public DbSet<Customer> Customers { get; set; }
    }
}