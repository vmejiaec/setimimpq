//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.18444
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------
 
namespace AEL.PLA
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    
    
    public class Pla_Param
    {
        
        // Comentario
        private int _Id;
        
        // Comentario
        private string _Rep_Legal_Pie_Firma_Nombre;
        
        // Comentario
        private string _Rep_Legal_Pie_Firma_Cargo;
        
        public Pla_Param()
        {
        }
        
        public Pla_Param(int id, string rep_Legal_Pie_Firma_Nombre, string rep_Legal_Pie_Firma_Cargo)
        {
            this.Id = id;
            this.Rep_Legal_Pie_Firma_Nombre = rep_Legal_Pie_Firma_Nombre;
            this.Rep_Legal_Pie_Firma_Cargo = rep_Legal_Pie_Firma_Cargo;
        }
        
        public Pla_Param(Pla_Param o)
        {
            this.Id = o.Id;
            this.Rep_Legal_Pie_Firma_Nombre = o.Rep_Legal_Pie_Firma_Nombre;
            this.Rep_Legal_Pie_Firma_Cargo = o.Rep_Legal_Pie_Firma_Cargo;
        }
        
        // Comentario
        public int Id
        {
            get
            {
                return this._Id;
            }
            set
            {
                this._Id = value;
            }
        }
        
        // Comentario
        public string Rep_Legal_Pie_Firma_Nombre
        {
            get
            {
                return this._Rep_Legal_Pie_Firma_Nombre;
            }
            set
            {
                this._Rep_Legal_Pie_Firma_Nombre = value;
            }
        }
        
        // Comentario
        public string Rep_Legal_Pie_Firma_Cargo
        {
            get
            {
                return this._Rep_Legal_Pie_Firma_Cargo;
            }
            set
            {
                this._Rep_Legal_Pie_Firma_Cargo = value;
            }
        }
    }
}