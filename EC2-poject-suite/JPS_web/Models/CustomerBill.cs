using System;
using System.ComponentModel.DataAnnotations;

namespace JPS_web.Models
{
    public class CustomerBill
    {
        [Key, Display(Name = "Bill ID")]
        public int BillId { get; set; }

        [Required, Display(Name = "Create Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillGenerationDate { get; set; }

        [Required, Display(Name = "Due Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillDueDate { get; set; }

        [Required, Display(Name = "Premises No.")]
        public int PremisesNumber { get; set; }

        [Required, Display(Name = "Customer ID")]
        public int CustomerId { get; set; }

        [Required, StringLength(100)]
        public string Address { get; set; }

        [Required, Display(Name = "Amount (JMD)")]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:C}")]
        public decimal Amount { get; set; }
    }
}