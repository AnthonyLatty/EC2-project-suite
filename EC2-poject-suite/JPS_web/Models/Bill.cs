using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace JPS_web.Models
{
    public class Bill
    {
        [Key, Display(Name = "Bill ID")]
        [Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BillId { get; set; }

        //Customer Navigation Property
        [Required, Display(Name = "Customer Email")]
        public string Id { get; set; }
        public Customer Customer { get; set; }

        [Required, Display(Name = "Create Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillGenerationDate { get; set; }

        [Required, Display(Name = "Due Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime BillDueDate { get; set; }

        [Required, Display(Name = "Premises No.")]
        public int PremisesNumber { get; set; }

        [EnumDataType(typeof(BillStatus)), Display(Name = "Bill Status")]
        public BillStatus BillStatus { get; set; }

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