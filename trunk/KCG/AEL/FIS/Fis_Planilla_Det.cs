
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Planilla_Det : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Apu_Prespuesto_Rubro_Id;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private String _Apu_Rubro_Unidad;
        private Decimal _Costo;
        private Decimal _Cantidad;
        private String _Apu_Prespuesto_Rubro_Codigo;
        private Decimal _Apu_Prespuesto_Rubro_Cantidad;
        private Decimal _Acumulado;
        private Decimal _Diferencia;
        private Decimal _SubTotal;
        private String _Estado_Nombre;
        private String _Fis_Planilla_Id;
        private String _Fis_Planilla_Codigo;

        // Propiedades de la clase
        public String Fis_Planilla_Id
        {
            get { return _Fis_Planilla_Id; }
            set { _Fis_Planilla_Id = value; }
        }

        public String Fis_Planilla_Codigo
        {
            get { return _Fis_Planilla_Codigo; }
            set { _Fis_Planilla_Codigo = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Apu_Prespuesto_Rubro_Id
        {
            get { return _Apu_Prespuesto_Rubro_Id; }
            set { _Apu_Prespuesto_Rubro_Id = value; }
        }

        public String Apu_Rubro_Codigo
        {
            get { return _Apu_Rubro_Codigo; }
            set { _Apu_Rubro_Codigo = value; }
        }

        public String Apu_Rubro_Nombre
        {
            get { return _Apu_Rubro_Nombre; }
            set { _Apu_Rubro_Nombre = value; }
        }

        public String Apu_Rubro_Unidad
        {
            get { return _Apu_Rubro_Unidad; }
            set { _Apu_Rubro_Unidad = value; }
        }

        public Decimal Costo
        {
            get { return _Costo; }
            set { _Costo = value; }
        }

        public Decimal Cantidad
        {
            get { return _Cantidad; }
            set { _Cantidad = value; }
        }

        public String Apu_Prespuesto_Rubro_Codigo
        {
            get { return _Apu_Prespuesto_Rubro_Codigo; }
            set { _Apu_Prespuesto_Rubro_Codigo = value; }
        }

        public Decimal Apu_Prespuesto_Rubro_Cantidad
        {
            get { return _Apu_Prespuesto_Rubro_Cantidad; }
            set { _Apu_Prespuesto_Rubro_Cantidad = value; }
        }

        public Decimal Acumulado
        {
            get { return _Acumulado; }
            set { _Acumulado = value; }
        }

        public Decimal Diferencia
        {
            get { return _Diferencia; }
            set { _Diferencia = value; }
        }

        public Decimal SubTotal
        {
            get { return _SubTotal; }
            set { _SubTotal = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Planilla_Det()
        {
        }
        public Fis_Planilla_Det(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Apu_Prespuesto_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, Decimal _Costo, Decimal _Cantidad, String _Apu_Prespuesto_Rubro_Codigo, Decimal _Apu_Prespuesto_Rubro_Cantidad, Decimal _Acumulado, Decimal _Diferencia, Decimal _SubTotal, String _Estado_Nombre, String _Fis_Planilla_Id, String _Fis_Planilla_Codigo)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Apu_Prespuesto_Rubro_Id = _Apu_Prespuesto_Rubro_Id;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Costo = _Costo;
            this._Cantidad = _Cantidad;
            this._Fis_Planilla_Id = _Fis_Planilla_Id;
            this._Apu_Prespuesto_Rubro_Codigo = _Apu_Prespuesto_Rubro_Codigo;
            this._Apu_Prespuesto_Rubro_Cantidad = _Apu_Prespuesto_Rubro_Cantidad;
            this._Acumulado = _Acumulado;
            this._Diferencia = _Diferencia;
            this._SubTotal = _SubTotal;
            this._Estado_Nombre = _Estado_Nombre;
            this._Fis_Planilla_Codigo = _Fis_Planilla_Codigo;
        }
        public Fis_Planilla_Det(Fis_Planilla_Det o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Apu_Prespuesto_Rubro_Id = o.Apu_Prespuesto_Rubro_Id;
            this._Apu_Rubro_Codigo = o.Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = o.Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = o.Apu_Rubro_Unidad;
            this._Costo = o.Costo;
            this._Cantidad = o.Cantidad;
            this._Fis_Planilla_Id = o.Fis_Planilla_Id;
            this._Apu_Prespuesto_Rubro_Codigo = o.Apu_Prespuesto_Rubro_Codigo;
            this._Apu_Prespuesto_Rubro_Cantidad = o.Apu_Prespuesto_Rubro_Cantidad;
            this._Acumulado = o.Acumulado;
            this._Diferencia = o.Diferencia;
            this._SubTotal = o.SubTotal;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Fis_Planilla_Codigo = o.Fis_Planilla_Codigo;
        }
    }
}
