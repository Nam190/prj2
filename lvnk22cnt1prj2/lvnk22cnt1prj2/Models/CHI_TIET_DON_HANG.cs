//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace lvnk22cnt1prj2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHI_TIET_DON_HANG
    {
        public int OrderDetailID { get; set; }
        public Nullable<int> OrderID { get; set; }
        public Nullable<int> ProductID { get; set; }
        public Nullable<int> So_luong { get; set; }
        public Nullable<decimal> Gia { get; set; }
    
        public virtual DON_HANG DON_HANG { get; set; }
        public virtual SAN_PHAM SAN_PHAM { get; set; }
    }
}
