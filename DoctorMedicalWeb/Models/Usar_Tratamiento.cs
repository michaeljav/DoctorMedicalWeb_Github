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

    public partial class Usar_Tratamiento 
    {
       

    
        public int? DoctSecuencia_fk { get; set; }
        public int? PaisSecuencia_fk { get; set; }
        public int? ClinSecuencia_fk { get; set; }
        public int? ConsSecuencia_fk { get; set; }
        public int? TratSecuencia { get; set; }
        public string TratCodigo { get; set; }
        [Display(Name="Nombre")]
        [Required(ErrorMessage="Favor introducir nombre")]
        public string TratNombre { get; set; }
        [Display(Name="Descripción")]
        public string TratDescripcion { get; set; }      
        public bool EstaDesabilitado { get; set; }
    
    
    }
}
