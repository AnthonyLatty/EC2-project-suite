using System.Data.Entity;

namespace JPS_web.Models
{
    /// <summary>
    /// JPS database context using Entity Framework
    /// </summary>
    public class JPSContext : DbContext
    {
        public DbSet<CustomerBill> CustomerBills { get; set; }
    }
}