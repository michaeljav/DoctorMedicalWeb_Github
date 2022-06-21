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
    
    public partial class Paciente
    {
        public Paciente()
        {
            this.ArchivosPacientes = new HashSet<ArchivosPaciente>();
            this.Citas = new HashSet<Cita>();
            this.ConsultaMedicas = new HashSet<ConsultaMedica>();
            this.ConsultaMedicaHistorials = new HashSet<ConsultaMedicaHistorial>();
            this.PacienteFotoes = new HashSet<PacienteFoto>();
            this.Recetas = new HashSet<Receta>();
        }
    
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia { get; set; }
        public string PaciCodigo { get; set; }
        public string PaciDocumento { get; set; }
        public int TDSecuencia { get; set; }
        public Nullable<int> PaciNumeroSeguroSocial { get; set; }
        public Nullable<int> IAsegSecuencia { get; set; }
        public Nullable<int> IAPlanSecuencia { get; set; }
        public Nullable<int> PaciNumeroPoliza { get; set; }
        public bool EsMenor { get; set; }
        public string PaciNombre { get; set; }
        public string PaciApellido1 { get; set; }
        public string PaciApellido2 { get; set; }
        public string PaciApodo { get; set; }
        public Nullable<System.DateTime> PaciFechaNacimiento { get; set; }
        public string PaciLugarNacimiento { get; set; }
        public Nullable<int> PaciEdad { get; set; }
        public string PaciEmail { get; set; }
        public string PaciFacebook { get; set; }
        public string PaciDireccion { get; set; }
        public string PaciTelefono { get; set; }
        public string PaciCelular { get; set; }
        public Nullable<int> PaciCodigoPostal { get; set; }
        public string PaciEstadoCivil { get; set; }
        public string PaciProfesion { get; set; }
        public string PaciNombreEmergencia { get; set; }
        public string PaciApellidoEmergencia { get; set; }
        public string PaciDireccionEmergencia { get; set; }
        public string PaciTelefonoEmergencia { get; set; }
        public Nullable<int> UsuaSecuenciaCreacion { get; set; }
        public Nullable<System.DateTime> UsuaFechaCreacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> UsuaFechaModificacion { get; set; }
        public string PaciFotoPath { get; set; }
        public string PaciFotoNombre { get; set; }
        public string PaciGenero { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual ICollection<ArchivosPaciente> ArchivosPacientes { get; set; }
        public virtual ICollection<Cita> Citas { get; set; }
        public virtual ICollection<ConsultaMedica> ConsultaMedicas { get; set; }
        public virtual ICollection<ConsultaMedicaHistorial> ConsultaMedicaHistorials { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual InstitucionAseguradoraPlane InstitucionAseguradoraPlane { get; set; }
        public virtual InstitucionesAseguradora InstitucionesAseguradora { get; set; }
        public virtual Pai Pai { get; set; }
        public virtual TipoDocumento TipoDocumento { get; set; }
        public virtual ICollection<PacienteFoto> PacienteFotoes { get; set; }
        public virtual ICollection<Receta> Recetas { get; set; }
    }
}
