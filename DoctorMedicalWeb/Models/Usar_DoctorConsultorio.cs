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

    public  class Usar_DoctorConsultorio 
    {
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int clinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int DConsSecuencia { get; set; }
        public int UsuaSecuenciaCreacion { get; set; }
        public System.DateTime DClinFechaCreacion { get; set; }
        public int UsuaSecuenciaModificacion { get; set; }
        public System.DateTime DClinFechaModificacion { get; set; }
    
     
    }
}