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
    
    public partial class Auditoria
    {
        public int AudiSecuencia { get; set; }
        public Nullable<int> PaisSecuencia { get; set; }
        public Nullable<int> ClinSecuencia { get; set; }
        public Nullable<int> ConsSecuencia { get; set; }
        public Nullable<int> DoctSecuencia { get; set; }
        public Nullable<int> PersSecuencia { get; set; }
        public Nullable<int> TPersSecuencia { get; set; }
        public Nullable<System.DateTime> AudiFechaMaquina { get; set; }
        public Nullable<System.DateTime> AudiFechaServidor { get; set; }
        public string AudiValorOriginal { get; set; }
        public string AudiValorNuevo { get; set; }
        public Nullable<int> UsuaCodigo { get; set; }
        public string AudiIpMaquina { get; set; }
        public string PagiSecuencia { get; set; }
        public Nullable<int> TablSecuencia { get; set; }
        public string Accion { get; set; }
        public string DescripcionError { get; set; }
        public bool EstaDesabilitado { get; set; }
    }
}
