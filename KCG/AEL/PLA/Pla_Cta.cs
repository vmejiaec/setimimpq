//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.18408
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
    
    
    public class Pla_Cta
    {
        
        // Comentario
        private int _Id;
        
        // Comentario
        private string _Anio;
        
        // Comentario
        private string _Codigo;
        
        // Comentario
        private string _Nivel;
        
        // Comentario
        private string _Nombre;
        
        // Comentario
        private string _Descripcion;
        
        // Comentario
        private string _Estado;
        
        public Pla_Cta()
        {
        }
        
        public Pla_Cta(int id, string anio, string codigo, string nivel, string nombre, string descripcion, string estado)
        {
            this.Id = id;
            this.Anio = anio;
            this.Codigo = codigo;
            this.Nivel = nivel;
            this.Nombre = nombre;
            this.Descripcion = descripcion;
            this.Estado = estado;
        }
        
        public Pla_Cta(Pla_Cta o)
        {
            this.Id = o.Id;
            this.Anio = o.Anio;
            this.Codigo = o.Codigo;
            this.Nivel = o.Nivel;
            this.Nombre = o.Nombre;
            this.Descripcion = o.Descripcion;
            this.Estado = o.Estado;
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
        public string Anio
        {
            get
            {
                return this._Anio;
            }
            set
            {
                this._Anio = value;
            }
        }
        
        // Comentario
        public string Codigo
        {
            get
            {
                return this._Codigo;
            }
            set
            {
                this._Codigo = value;
            }
        }
        
        // Comentario
        public string Nivel
        {
            get
            {
                return this._Nivel;
            }
            set
            {
                this._Nivel = value;
            }
        }
        
        // Comentario
        public string Nombre
        {
            get
            {
                return this._Nombre;
            }
            set
            {
                this._Nombre = value;
            }
        }
        
        // Comentario
        public string Descripcion
        {
            get
            {
                return this._Descripcion;
            }
            set
            {
                this._Descripcion = value;
            }
        }
        
        // Comentario
        public string Estado
        {
            get
            {
                return this._Estado;
            }
            set
            {
                this._Estado = value;
            }
        }
    }
}
