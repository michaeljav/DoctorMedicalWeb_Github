//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoctorMedicalWeb.Models
{
    using DoctorMedicalWeb.App_Data;
    using System;
    using System.Collections.Generic;

    public partial class Usar_Plane 
    {
       
    
        public int PlanSecuencia { get; set; }
        public string PlanDescripcion { get; set; }
        public Nullable<decimal> Precio { get; set; }
        public int PMoneSecuencia_fk { get; set; }
    
    public bool EstaDesabilitado { get; set; }
    }
}