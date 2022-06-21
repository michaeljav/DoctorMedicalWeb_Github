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
    
    public partial class Cita
    {
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }
        public int CitaSecuencia { get; set; }
        public Nullable<int> ProgramId { get; set; }
        public string ProgramName { get; set; }
        public System.DateTime ProgramStartTime { get; set; }
        public Nullable<System.TimeSpan> ProgramStartOnlyTime { get; set; }
        public System.DateTime ProgramEndTime { get; set; }
        public Nullable<System.TimeSpan> ProgramEndOlyTime { get; set; }
        public bool IsAllDay { get; set; }
        public bool IsRecurrence { get; set; }
        public string RecurrenceRule { get; set; }
        public string StartTimeZone { get; set; }
        public string EndTimeZone { get; set; }
        public string Comments { get; set; }
        public bool CitaCancelada { get; set; }
        public string CitaCancelacionMotivo { get; set; }
        public int UsuaSecuenciaCreacion { get; set; }
        public System.DateTime CitaFechaCreacion { get; set; }
        public Nullable<System.TimeSpan> CMHistHora { get; set; }
        public Nullable<System.DateTime> UsuaFechaModificacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }
        public Nullable<int> EstadoCita { get; set; }
    
        public virtual Doctor Doctor { get; set; }
        public virtual Paciente Paciente { get; set; }
    }
}
