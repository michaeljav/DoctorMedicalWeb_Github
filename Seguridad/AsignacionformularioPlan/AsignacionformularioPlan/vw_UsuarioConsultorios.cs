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
    
    public partial class vw_UsuarioConsultorios
    {
        public string NombreConsultorio { get; set; }
        public int UsuaSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int clinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int UConsSecuencia { get; set; }
        public string clinRazonSocial { get; set; }
        public string ConsCodigo { get; set; }
        public string ConsDescripcion { get; set; }
        public bool EstaDesabilitado { get; set; }
        public int UsuaSecuencia { get; set; }
        public string UsuaEmail { get; set; }
        public string UsuaClave { get; set; }
        public string UsuaNombre { get; set; }
        public string UsuaApellido { get; set; }
        public string UsuaGenero { get; set; }
        public Nullable<int> RoleSecuencia_fk { get; set; }
        public int UsuaIntentos { get; set; }
        public int PaisSecuencia { get; set; }
        public Nullable<int> PlanSecuencia_fk { get; set; }
        public Nullable<int> EspeSecuencia_fk { get; set; }
        public Nullable<int> UsuaSecuenciaCreacion { get; set; }
        public Nullable<System.DateTime> UsuaFechaCreacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> UsuaFechaModificacion { get; set; }
    }
}
