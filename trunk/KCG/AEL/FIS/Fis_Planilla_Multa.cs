
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Planilla_Multa : Entidad
    {
        // Atributos
        private String _Fis_Planilla_Id;
        private String _Fis_Multa_Id;
        private Decimal _Valor;
        private DateTime _Fecha;
        private String _Descripcion;
        private String _Fis_Planilla_Numero_Planilla;
        private DateTime _Fis_Planilla_Fecha_Ultimo_Ingreso;
        private Decimal _Fis_Planilla_Total;
        private String _Fis_Planilla_Tipo_Nombre;
        private String _Fis_Multa_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Fis_Planilla_Id
        {
            get { return _Fis_Planilla_Id; }
            set { _Fis_Planilla_Id = value; }
        }

        public String Fis_Multa_Id
        {
            get { return _Fis_Multa_Id; }
            set { _Fis_Multa_Id = value; }
        }

        public Decimal Valor
        {
            get { return _Valor; }
            set { _Valor = value; }
        }

        public DateTime Fecha
        {
            get { return _Fecha; }
            set { _Fecha = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Fis_Planilla_Numero_Planilla
        {
            get { return _Fis_Planilla_Numero_Planilla; }
            set { _Fis_Planilla_Numero_Planilla = value; }
        }

        public DateTime Fis_Planilla_Fecha_Ultimo_Ingreso
        {
            get { return _Fis_Planilla_Fecha_Ultimo_Ingreso; }
            set { _Fis_Planilla_Fecha_Ultimo_Ingreso = value; }
        }

        public Decimal Fis_Planilla_Total
        {
            get { return _Fis_Planilla_Total; }
            set { _Fis_Planilla_Total = value; }
        }

        public String Fis_Planilla_Tipo_Nombre
        {
            get { return _Fis_Planilla_Tipo_Nombre; }
            set { _Fis_Planilla_Tipo_Nombre = value; }
        }

        public String Fis_Multa_Nombre
        {
            get { return _Fis_Multa_Nombre; }
            set { _Fis_Multa_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Planilla_Multa()
        {
        }

        public Fis_Planilla_Multa(String _Id, String _Codigo, String _Estado, String _Fis_Planilla_Id, String _Fis_Multa_Id, Decimal _Valor, DateTime _Fecha, String _Descripcion, String _Fis_Planilla_Numero_Planilla, DateTime _Fis_Planilla_Fecha_Ultimo_Ingreso, Decimal _Fis_Planilla_Total, String _Fis_Planilla_Tipo_Nombre, String _Fis_Multa_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Fis_Planilla_Id = _Fis_Planilla_Id;
            this._Fis_Multa_Id = _Fis_Multa_Id;
            this._Valor = _Valor;
            this._Fecha = _Fecha;
            this._Descripcion = _Descripcion;
            this._Fis_Planilla_Numero_Planilla = _Fis_Planilla_Numero_Planilla;
            this._Fis_Planilla_Fecha_Ultimo_Ingreso = _Fis_Planilla_Fecha_Ultimo_Ingreso;
            this._Fis_Planilla_Total = _Fis_Planilla_Total;
            this._Fis_Planilla_Tipo_Nombre = _Fis_Planilla_Tipo_Nombre;
            this._Fis_Multa_Nombre = _Fis_Multa_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }

        public Fis_Planilla_Multa(Fis_Planilla_Multa o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Fis_Planilla_Id = o.Fis_Planilla_Id;
            this._Fis_Multa_Id = o.Fis_Multa_Id;
            this._Valor = o.Valor;
            this._Fecha = o.Fecha;
            this._Descripcion = o.Descripcion;
            this._Fis_Planilla_Numero_Planilla = o.Fis_Planilla_Numero_Planilla;
            this._Fis_Planilla_Fecha_Ultimo_Ingreso = o.Fis_Planilla_Fecha_Ultimo_Ingreso;
            this._Fis_Planilla_Total = o.Fis_Planilla_Total;
            this._Fis_Planilla_Tipo_Nombre = o.Fis_Planilla_Tipo_Nombre;
            this._Fis_Multa_Nombre = o.Fis_Multa_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
