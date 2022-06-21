//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoctorMedicalWeb.Models
{
    using DoctorMedicalWeb.App_Data;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public  class Usar_Cita
    {
        public int? DoctSecuencia_fk { get; set; }
        public int? PaisSecuencia_fk { get; set; }
        public int? ClinSecuencia_fk { get; set; }
        public int? ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }

        [Display(Name="C�digo Paciente")]
        public string CodigoPaciente { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "Favor ingresar nombre")]
        public string PaciNombre { get; set; }
        [Display(Name = "Primer Apellido")]
        [Required(ErrorMessage = "Favor ingresar primer apellido")]
        public string PaciApellido1 { get; set; }
        [Display(Name = "Segundo Apellido")]        
        public string PaciApellido2 { get; set; }
            [Display(Name = "Correo Electr�nico")]
        public string PaciEmail { get; set; }
        [Display(Name = "Tel�fono")]
        public string PaciTelefono { get; set; }
        [Display(Name = "Celular")]
        public string PaciCelular { get; set; }
        public int CitaSecuencia { get; set; }
        public Nullable<int> ProgramId { get; set; }
        public string ProgramName { get; set; }
        public System.DateTime ProgramStartTime { get; set; }
        public string ProgramStartTimeString { get; set; }
        public Nullable<System.TimeSpan> ProgramStartOnlyTime { get; set; }
        public string ProgramStartOnlyTimeString { get; set; }
        public System.DateTime ProgramEndTime { get; set; }
        public string ProgramEndTimeString { get; set; }
        public Nullable<System.TimeSpan> ProgramEndOlyTime { get; set; }
        public string ProgramEndOlyTimeString { get; set; }
        public bool IsAllDay { get; set; }
        public bool IsRecurrence { get; set; }
        public string RecurrenceRule { get; set; }
        public string StartTimeZone { get; set; }
        public string EndTimeZone { get; set; }
        public string Comments { get; set; }
        [Display(Name="Cancelada: ")]
        public bool CitaCancelada { get; set; }
        [Display(Name = "Motivo Cancelaci�n")]
        public string CitaCancelacionMotivo { get; set; }
        public int UsuaSecuenciaCreacion { get; set; }
        public System.DateTime CitaFechaCreacion { get; set; }
        public Nullable<System.TimeSpan> CMHistHora { get; set; }
        public Nullable<System.DateTime> UsuaFechaModificacion { get; set; }
        public Nullable<int> UsuaSecuenciaModificacion { get; set; }
        public bool EstaDesabilitado { get; set; }

        [Display(Name="Consultorio")]
        public string ConsultorioClinica { get; set; }

        public Nullable<int> EstadoCita { get; set; }

    
    }
}
