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
    
    public partial class AnalisisClinico
    {
        public AnalisisClinico()
        {
            this.RecetaAnalisisClinicoes = new HashSet<RecetaAnalisisClinico>();
        }
    
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int AClinSecuencia { get; set; }
        public string AClinCodigo { get; set; }
        public string AClinNombre { get; set; }
        public string AClinDescripcion { get; set; }
        public string AClinTipoDeMuestra { get; set; }
        public string AClinTiempoDeProceso { get; set; }
        public string AClinCondicionesDelPaciente { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual ICollection<RecetaAnalisisClinico> RecetaAnalisisClinicoes { get; set; }
    }
}
