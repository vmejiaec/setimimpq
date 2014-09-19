
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto_Indice : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Apu_Origen_Id;
        private String _Apu_Insumo_Id;
        private String _Apu_Indice_Id;
        private String _Apu_Indice_Codigo;
        private String _Apu_Indice_Nombre;
        private Decimal _Porcentaje;
        private Decimal _Costo_Total;
        private Decimal _Costo_Indice;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Apu_Origen_Id
        {
            get { return _Apu_Origen_Id; }
            set { _Apu_Origen_Id = value; }
        }

        public String Apu_Insumo_Id
        {
            get { return _Apu_Insumo_Id; }
            set { _Apu_Insumo_Id = value; }
        }

        public String Apu_Indice_Id
        {
            get { return _Apu_Indice_Id; }
            set { _Apu_Indice_Id = value; }
        }

        public String Apu_Indice_Codigo
        {
            get { return _Apu_Indice_Codigo; }
            set { _Apu_Indice_Codigo = value; }
        }

        public String Apu_Indice_Nombre
        {
            get { return _Apu_Indice_Nombre; }
            set { _Apu_Indice_Nombre = value; }
        }

        public Decimal Porcentaje
        {
            get { return _Porcentaje; }
            set { _Porcentaje = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public Decimal Costo_Indice
        {
            get { return _Costo_Indice; }
            set { _Costo_Indice = value; }
        }

        // Constructor
        public Apu_Presupuesto_Indice()
        {
        }
        public Apu_Presupuesto_Indice(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Apu_Origen_Id, String _Apu_Insumo_Id, String _Apu_Indice_Id, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Porcentaje, Decimal _Costo_Total, Decimal _Costo_Indice)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Apu_Origen_Id = _Apu_Origen_Id;
            this._Apu_Insumo_Id = _Apu_Insumo_Id;
            this._Apu_Indice_Id = _Apu_Indice_Id;
            this._Apu_Indice_Codigo = _Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = _Apu_Indice_Nombre;
            this._Porcentaje = _Porcentaje;
            this._Costo_Total = _Costo_Total;
            this._Costo_Indice = _Costo_Indice;
        }
        public Apu_Presupuesto_Indice(Apu_Presupuesto_Indice o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Apu_Origen_Id = o.Apu_Origen_Id;
            this._Apu_Insumo_Id = o.Apu_Insumo_Id;
            this._Apu_Indice_Id = o.Apu_Indice_Id;
            this._Apu_Indice_Codigo = o.Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = o.Apu_Indice_Nombre;
            this._Porcentaje = o.Porcentaje;
            this._Costo_Total = o.Costo_Total;
            this._Costo_Indice = o.Costo_Indice;
        }
    }
}
