using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JPS_web.Models
{
    public class Customer
    {
        [Key]
        [Display(Name = "Customer ID")]
        [Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerId { get; set; }

        // Reference ID for ASP User and call it Email
        [Display(Name = "Email")]
        public string Id { get; set; }

        [Required(ErrorMessage = "7 digits for Premises No."), Display(Name = "Premises No.")]
        [MinLength(7),MaxLength(7)]
        public string PremisesNumber { get; set; }
    }
}