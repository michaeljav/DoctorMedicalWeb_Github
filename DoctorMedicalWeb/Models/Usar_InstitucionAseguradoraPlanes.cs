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
    using System.ComponentModel.DataAnnotations;

    public partial class Usar_InstitucionAseguradoraPlanes 
    {
        public int? DoctSecuencia { get; set; }
        public int? ClinSecuencia { get; set; }
        public int? ConsSecuencia { get; set; }
        public int? IAsegSecuencia { get; set; }
        public int? IAPlanSecuencia { get; set; }
        public string IAPlanDescripcion { get; set; }
		
		    public bool EstaDesabilitado { get; set; }

    }
}
