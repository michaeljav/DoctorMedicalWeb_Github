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
    
    public partial class Imagene
    {
        public Imagene()
        {
            this.RecetaImagenes = new HashSet<RecetaImagene>();
        }
    
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int ImagSecuencia { get; set; }
        public string ImagCodigo { get; set; }
        public string ImagNombre { get; set; }
        public string ImagDescripcion { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual ICollection<RecetaImagene> RecetaImagenes { get; set; }
    }
}
