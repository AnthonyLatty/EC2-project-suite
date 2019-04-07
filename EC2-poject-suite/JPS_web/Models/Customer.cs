using System.ComponentModel.DataAnnotations;

namespace JPS_web.Models
{
    public class Customer
    {
        [Key]
        [Display(Name = "Customer ID")]
        [Editable(false)]
        // Reference ID from ASP user email
        public string Id { get; set; }

        [Display(Name = "UserName")]
        [Editable(false)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "7 digits for Premises No."), Display(Name = "Premises No.")]
        [MinLength(7),MaxLength(7)]
        public string PremisesNumber { get; set; }
    }
}