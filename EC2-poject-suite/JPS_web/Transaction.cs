//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JPS_web
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transaction
    {
        public int BillId { get; set; }
        public string CardNumber { get; set; }
        public int CardType { get; set; }
        public System.DateTime Timestamp { get; set; }
    
        public virtual Bill Bill { get; set; }
    }
}
