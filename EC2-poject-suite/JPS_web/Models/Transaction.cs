using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JPS_web.Models
{
    /// <summary>
    /// Domain model for simulating Payment of a bill
    /// </summary>
    public class Transaction
    {
        [Key]
        [ForeignKey("Bill")]
        [Display(Name = "Bill ID (ID of the bill you are paying for)")]
        public int BillId { get; set; }
        public virtual Bill Bill { get; set; }

        [Required]
        [Display(Name = "Card No.")]
        [StringLength(100)]
        public string CardNumber { get; set; }

        [Display(Name = "Card Type")]
        [EnumDataType(typeof(CardType))]
        public CardType CardType { get; set; }

        [Required, Display(Name = "Transaction Date")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime Timestamp { get; set; }
    }

    public enum CardType
    {
        Credit,
        DebitCard
    }
}