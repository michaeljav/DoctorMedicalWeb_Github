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
    
    public partial class CategoriaPersonal
    {
        public int DoctSecuencia_fk { get; set; }
        public int CPersSecuencia { get; set; }
        public string CPersNombre { get; set; }
        public Nullable<int> UsuaSecuencia { get; set; }
        public Nullable<System.DateTime> CPersFechaCreacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> CPersFechaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }
    }
}
