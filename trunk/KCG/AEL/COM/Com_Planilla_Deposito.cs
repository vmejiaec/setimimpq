//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.18444
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------
 
namespace AEL.COM
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    
    
    public class Com_Planilla_Deposito
    {
        
        // Comentario
        private int _Id;
        
        // Comentario
        private string _Fis_Planilla_Id;
        
        // Comentario
        private string _Codigo_Deposito;
        
        // Comentario
        private System.DateTime _Fecha_Deposito;
        
        // Comentario
        private string _Comprobante_Ctbl;
        
        // Comentario
        private decimal _Valor;
        
        // Comentario
        private decimal _Valor_Interes;
        
        // Comentario
        private string _Descripcion;
        
        public Com_Planilla_Deposito()
        {
        }
        
        public Com_Planilla_Deposito(int id, string fis_Planilla_Id, string codigo_Deposito, System.DateTime fecha_Deposito, string comprobante_Ctbl, decimal valor, decimal valor_Interes, string descripcion)
        {
            this.Id = id;
            this.Fis_Planilla_Id = fis_Planilla_Id;
            this.Codigo_Deposito = codigo_Deposito;
            this.Fecha_Deposito = fecha_Deposito;
            this.Comprobante_Ctbl = comprobante_Ctbl;
            this.Valor = valor;
            this.Valor_Interes = valor_Interes;
            this.Descripcion = descripcion;
        }
        
        public Com_Planilla_Deposito(Com_Planilla_Deposito o)
        {
            this.Id = o.Id;
            this.Fis_Planilla_Id = o.Fis_Planilla_Id;
            this.Codigo_Deposito = o.Codigo_Deposito;
            this.Fecha_Deposito = o.Fecha_Deposito;
            this.Comprobante_Ctbl = o.Comprobante_Ctbl;
            this.Valor = o.Valor;
            this.Valor_Interes = o.Valor_Interes;
            this.Descripcion = o.Descripcion;
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
        public string Fis_Planilla_Id
        {
            get
            {
                return this._Fis_Planilla_Id;
            }
            set
            {
                this._Fis_Planilla_Id = value;
            }
        }
        
        // Comentario
        public string Codigo_Deposito
        {
            get
            {
                return this._Codigo_Deposito;
            }
            set
            {
                this._Codigo_Deposito = value;
            }
        }
        
        // Comentario
        public System.DateTime Fecha_Deposito
        {
            get
            {
                return this._Fecha_Deposito;
            }
            set
            {
                this._Fecha_Deposito = value;
            }
        }
        
        // Comentario
        public string Comprobante_Ctbl
        {
            get
            {
                return this._Comprobante_Ctbl;
            }
            set
            {
                this._Comprobante_Ctbl = value;
            }
        }
        
        // Comentario
        public decimal Valor
        {
            get
            {
                return this._Valor;
            }
            set
            {
                this._Valor = value;
            }
        }
        
        // Comentario
        public decimal Valor_Interes
        {
            get
            {
                return this._Valor_Interes;
            }
            set
            {
                this._Valor_Interes = value;
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
    }
}
