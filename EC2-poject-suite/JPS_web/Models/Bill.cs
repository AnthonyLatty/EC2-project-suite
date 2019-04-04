using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JPS_web.Models
{
    public class Bill
    {
        [Key, Display(Name = "Bill ID")]
        [Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BillId { get; set; }

        [Required, Display(Name = "Create Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillGenerationDate { get; set; }

        [Required, Display(Name = "Due Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillDueDate { get; set; }

        // Navigation Property
        [Required, Display(Name = "Customer ID")]
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }

        // Premises No. for Customers with multiple Premises
        [Required, Display(Name = "Premises No.")]
        public int PremisesNumber { get; set; }

        [EnumDataType(typeof(BillStatus)), Display(Name = "Bill Status")]
        public BillStatus Status { get; set; }

        [Required, StringLength(100)]
        public string Address { get; set; }

        [Required, Display(Name = "Amount (JMD)")]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:C}")]
        public decimal Amount { get; set; }
    }

    public enum BillStatus
    {
        Pending,
        Paid
    }
}