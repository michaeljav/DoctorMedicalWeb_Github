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
    
    public partial class Factura
    {
        public Factura()
        {
            this.Citas = new HashSet<Cita>();
            this.FacturaDetalles = new HashSet<FacturaDetalle>();
        }
    
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }
        public Nullable<int> PersSecuencia_fk { get; set; }
        public Nullable<int> CPersSecuencia_fk { get; set; }
        public int FactSecuencia { get; set; }
        public Nullable<int> FactCodigo { get; set; }
        public System.DateTime FactFecha { get; set; }
        public int FEstaSecuencia_fk { get; set; }
        public Nullable<int> CFisCodigo { get; set; }
        public string FactNCF { get; set; }
        public Nullable<int> TPagoSecuencia_fk { get; set; }
        public decimal FactReclamado { get; set; }
        public decimal FactCobertura { get; set; }
        public decimal FactSubtotal { get; set; }
        public decimal FactItbis { get; set; }
        public decimal FactDescuento { get; set; }
        public decimal FactTotal { get; set; }
        public int UsuaSecuencia { get; set; }
        public Nullable<decimal> FactPorDescuento { get; set; }
        public Nullable<decimal> FactPagado { get; set; }
        public int UsuaSecuenciaCreacion { get; set; }
        public System.DateTime FactFechaCreacion { get; set; }
        public int UsuaSecuenciaModificacion { get; set; }
        public System.DateTime FactFechaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual ICollection<Cita> Citas { get; set; }
        public virtual FacturaEstado FacturaEstado { get; set; }
        public virtual Personal Personal { get; set; }
        public virtual TipoPago TipoPago { get; set; }
        public virtual ICollection<FacturaDetalle> FacturaDetalles { get; set; }
    }
}
