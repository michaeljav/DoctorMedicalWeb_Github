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
    
    public partial class TipoFormulario
    {
        public TipoFormulario()
        {
            this.Formularios = new HashSet<Formulario>();
        }
    
        public int TFormSecuencia { get; set; }
        public string TFormDescripcion { get; set; }
    
        public virtual ICollection<Formulario> Formularios { get; set; }
    }
}
