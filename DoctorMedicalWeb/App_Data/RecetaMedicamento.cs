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
    
    public partial class RecetaMedicamento
    {
        public int DoctSecuencia_fk { get; set; }
        public int PaisSecuencia_fk { get; set; }
        public int ClinSecuencia_fk { get; set; }
        public int ConsSecuencia_fk { get; set; }
        public int PaciSecuencia_fk { get; set; }
        public int CMHistSecuencia_fk { get; set; }
        public int ReceSecuencia_fk { get; set; }
        public int MediSecuencia_fk { get; set; }
        public int RMediSecuencia { get; set; }
        public bool EstaDesabilitado { get; set; }
    
        public virtual Medicamento Medicamento { get; set; }
        public virtual Receta Receta { get; set; }
    }
}
