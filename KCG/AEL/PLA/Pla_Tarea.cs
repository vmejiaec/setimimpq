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
    
    
    public class Pla_Tarea
    {
        
        // Comentario
        private int _Id;
        
        // Comentario
        private string _Codigo;
        
        // Comentario
        private int _Pla_Cta_Id;
        
        // Comentario
        private string _Pla_Cta_Codigo;
        
        // Comentario
        private string _Pla_Cta_Nombre;
        
        // Comentario
        private string _Pla_Cta_Nivel;
        
        // Comentario
        private string _Nombre;
        
        // Comentario
        private System.DateTime _Fecha_Ini;
        
        // Comentario
        private System.DateTime _Fecha_Fin;
        
        // Comentario
        private string _Estado;
        
        public Pla_Tarea()
        {
        }
        
        public Pla_Tarea(int id, string codigo, int pla_Cta_Id, string pla_Cta_Codigo, string pla_Cta_Nombre, string pla_Cta_Nivel, string nombre, System.DateTime fecha_Ini, System.DateTime fecha_Fin, string estado)
        {
            this.Id = id;
            this.Codigo = codigo;
            this.Pla_Cta_Id = pla_Cta_Id;
            this.Pla_Cta_Codigo = pla_Cta_Codigo;
            this.Pla_Cta_Nombre = pla_Cta_Nombre;
            this.Pla_Cta_Nivel = pla_Cta_Nivel;
            this.Nombre = nombre;
            this.Fecha_Ini = fecha_Ini;
            this.Fecha_Fin = fecha_Fin;
            this.Estado = estado;
        }
        
        public Pla_Tarea(Pla_Tarea o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Pla_Cta_Id = o.Pla_Cta_Id;
            this.Pla_Cta_Codigo = o.Pla_Cta_Codigo;
            this.Pla_Cta_Nombre = o.Pla_Cta_Nombre;
            this.Pla_Cta_Nivel = o.Pla_Cta_Nivel;
            this.Nombre = o.Nombre;
            this.Fecha_Ini = o.Fecha_Ini;
            this.Fecha_Fin = o.Fecha_Fin;
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
        public int Pla_Cta_Id
        {
            get
            {
                return this._Pla_Cta_Id;
            }
            set
            {
                this._Pla_Cta_Id = value;
            }
        }
        
        // Comentario
        public string Pla_Cta_Codigo
        {
            get
            {
                return this._Pla_Cta_Codigo;
            }
            set
            {
                this._Pla_Cta_Codigo = value;
            }
        }
        
        // Comentario
        public string Pla_Cta_Nombre
        {
            get
            {
                return this._Pla_Cta_Nombre;
            }
            set
            {
                this._Pla_Cta_Nombre = value;
            }
        }
        
        // Comentario
        public string Pla_Cta_Nivel
        {
            get
            {
                return this._Pla_Cta_Nivel;
            }
            set
            {
                this._Pla_Cta_Nivel = value;
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
        public System.DateTime Fecha_Ini
        {
            get
            {
                return this._Fecha_Ini;
            }
            set
            {
                this._Fecha_Ini = value;
            }
        }
        
        // Comentario
        public System.DateTime Fecha_Fin
        {
            get
            {
                return this._Fecha_Fin;
            }
            set
            {
                this._Fecha_Fin = value;
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
