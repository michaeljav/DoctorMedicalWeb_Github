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
    
    public partial class FacturaDetalle
    {
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }
        public int FactSecuencia { get; set; }
        public int FDetaSecuencia { get; set; }
        public int FacCodigo { get; set; }
        public int ProcSecuencia_fk { get; set; }
        public System.DateTime FDetaFecha { get; set; }
        public decimal FDetaCantidad { get; set; }
        public decimal FDetaReclamado { get; set; }
        public decimal FDetaItbis { get; set; }
        public decimal FDetaDescuento { get; set; }
        public decimal FDetaCobertura { get; set; }
        public decimal FDetaDiferencia { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual Factura Factura { get; set; }
        public virtual Procedimiento Procedimiento { get; set; }
    }
}
