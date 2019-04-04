using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace JPS_web.Models
{
    public class Customer
    {
        [Display(Name = "Customer ID")]
        [Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerId { get; set; }

        public string Id { get; set; }

        [Required(ErrorMessage = "7 digits for Premises No."), Display(Name = "Premises No.")]
        [MinLength(7),MaxLength(7)]
        public string PremisesNumber { get; set; }
    }
}