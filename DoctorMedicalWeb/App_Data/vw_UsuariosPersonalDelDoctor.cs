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
    
    public partial class vw_UsuariosPersonalDelDoctor
    {
        public int UsuaSecuencia { get; set; }
        public string UsuaEmail { get; set; }
        public string UsuaClave { get; set; }
        public string UsuaNombre { get; set; }
        public string UsuaApellido { get; set; }
        public Nullable<System.DateTime> UsuaFechaNacimiento { get; set; }
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
        public int DoctSecuencia_fk { get; set; }
        public int PersSecuencia { get; set; }
    }
}
