//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AsignacionformularioPlan
{
    using System;
    using System.Collections.Generic;
    
    public partial class ConsultaMedicaCirugia
    {
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }
        public int CMediSecuencia_fk { get; set; }
        public int CiruSecuencia_fk { get; set; }
        public string CiruComentario { get; set; }
        public Nullable<int> EdadCirugia { get; set; }
    
        public virtual Cirugia Cirugia { get; set; }
        public virtual ConsultaMedica ConsultaMedica { get; set; }
    }
}
