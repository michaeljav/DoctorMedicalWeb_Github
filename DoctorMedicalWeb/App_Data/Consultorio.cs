//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoctorMedicalWeb.App_Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Consultorio
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Consultorio()
        {
            this.HorarioTrabajoes = new HashSet<HorarioTrabajo>();
        }
    
        public int DoctSecuencia_fk { get; set; }
        public int ConsSecuencia { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public string ConsCodigo { get; set; }
        public string ConsDescripcion { get; set; }
        public string ConsDireccion { get; set; }
        public string ConsTelefono { get; set; }
        public string ConsExtencion { get; set; }
        public string ConsTelefono2 { get; set; }
        public string ConsExtension2 { get; set; }
        public Nullable<int> UsuaSecuenciaCreacion { get; set; }
        public Nullable<System.DateTime> ConsFechaCreacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> ConsFechaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual Clinica Clinica { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual Pai Pai { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HorarioTrabajo> HorarioTrabajoes { get; set; }
    }
}
