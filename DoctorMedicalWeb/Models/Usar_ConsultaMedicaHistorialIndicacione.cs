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

    public class Usar_ConsultaMedicaHistorialIndicacione
    {


        public int? DoctSecuencia_fk { get; set; }
        public int? PaisSecuencia_fk { get; set; }
        public int? ClinSecuencia_fk { get; set; }
        public int? ConsSecuencia_fk { get; set; }
        public int? TIndiSecuencia_fk { get; set; }
        public int? UMediSecuencia_fk { get; set; }
        public int? IndiSecuencia { get; set; }
        public string IndiCodigo { get; set; }
        public string IndiNombre { get; set; }
        public string IndiDescripcion { get; set; }
        public string IndiPrecentacion { get; set; }
        public string IndiMarca { get; set; }
        public string IndiComentario { get; set; }
        public bool EstaDesabilitado { get; set; }

    }
}
