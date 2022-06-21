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

    public partial class Usar_InstitucionesAseguradora 
    {
           public bool EstaDesabilitado { get; set; }
    
        public int? DoctSecuencia { get; set; }
        public int? ClinSecuencia { get; set; }
        public int? ConsSecuencia { get; set; }
        public int? IAsegSecuencia { get; set; }
          [Display(Name = "C�digo")]
        public string  IAsegCodigo { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "Favor ingresar nombre aseguradora.")]
        public string IAsegNombre { get; set; }

        [Display(Name = "RNC")]
        [Required(ErrorMessage = "Favor ingresar rnc")]
        public int? IAsegRNC { get; set; }
        [Display(Name = "Tel�fono")]
        [Required(ErrorMessage = "Favor ingresar telefono")]
        public string IAsegTelefono { get; set; }
        [Display(Name = "Correo")]

        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}", ErrorMessage = "Favor ingresar un correo valido.")]
        public string IAsegCorreo { get; set; }
        [Url]
        [Display(Name = "P�gina Web")]
        public string IAsegWeb { get; set; }

        public Nullable<int> usuaSecuenciaCreacion { get; set; }
        public Nullable<int> usuaSecuenciaModificacion { get; set; }
        public Nullable<System.DateTime> IAsegFechaCreacion { get; set; }
        public string IAsegFechaCreacionString
        {
            get
            {
                string fecha = "";
                if (IAsegFechaCreacion != null)
                {
                    fecha = this.IAsegFechaCreacion.Value.ToString("dd/MM/yyyy");

                }
                return fecha;
            }
            set
            {
                string fecha = "";
                if (IAsegFechaCreacion != null)
                {
                    fecha = this.IAsegFechaCreacion.Value.ToString("dd/MM/yyyy");

                }
                value = fecha;
            }
        }
        public Nullable<System.DateTime> IAsegFechaModificacion { get; set; }
  
    }
}
