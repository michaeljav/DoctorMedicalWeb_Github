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

    public partial class Usar_FormulariosAccion 
    {
        public int FAcciSecuencia { get; set; }
        public int FormSecuencia_fk { get; set; }
        public int AcciSecuencia_fk { get; set; }
    
        public virtual Accione Accione { get; set; }
        public virtual Formulario Formulario { get; set; }
    }
}
