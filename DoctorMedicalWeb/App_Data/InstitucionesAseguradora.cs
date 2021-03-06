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
    
    public partial class InstitucionesAseguradora
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InstitucionesAseguradora()
        {
            this.InstitucionAseguradoraPlanes = new HashSet<InstitucionAseguradoraPlane>();
            this.Pacientes = new HashSet<Paciente>();
        }
    
        public int DoctSecuencia { get; set; }
        public int ClinSecuencia { get; set; }
        public int ConsSecuencia { get; set; }
        public int IAsegSecuencia { get; set; }
        public string IAsegCodigo { get; set; }
        public string IAsegNombre { get; set; }
        public int IAsegRNC { get; set; }
        public string IAsegTelefono { get; set; }
        public string IAsegCorreo { get; set; }
        public string IAsegWeb { get; set; }
        public Nullable<int> usuaSecuenciaCreacion { get; set; }
        public Nullable<int> usuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> IAsegFechaCreacion { get; set; }
        public Nullable<System.DateTime> IAsegFechaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual Doctor Doctor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InstitucionAseguradoraPlane> InstitucionAseguradoraPlanes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Paciente> Pacientes { get; set; }
    }
}
