//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BanOto.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class TinNhan
    {
        public string From { get; set; }
        public string To { get; set; }
    
        public virtual NoiDung NoiDung { get; set; }
    }
}
