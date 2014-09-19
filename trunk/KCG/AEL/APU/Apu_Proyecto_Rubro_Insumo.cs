
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Proyecto_Rubro_Insumo : Entidad
    {
        // Atributos
        private String _Tipo;
        private String _Tipo_Nombre;
        private String _Apu_Insumo_Id;
        private String _Apu_Proyecto_Id;
        private String _Apu_Proyecto_Codigo;
        private String _Apu_Proyecto_Nombre;
        private String _Apu_Proyecto_Etapa;
        private String _Apu_Rubro_Id;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private String _Apu_Rubro_Unidad;
        private String _Apu_Insumo_Codigo;
        private String _Apu_Insumo_Nombre;
        private Decimal _Costo_Insumo;
        private Decimal _Cantidad_Insumo;
        private Decimal _Costo_x_Cantidad;
        private String _Int_Sucursal_Id;
        private Decimal _Apu_Proyecto_Rubro_Cantidad;
        private Decimal _Apu_Proyecto_Rubro_Costo_Directo;
        private Decimal _Apu_Proyecto_Rubro_Costo_Indirecto;
        private Decimal _Apu_Proyecto_Rubro_Costo;
        private Decimal _Apu_Proyecto_Rubro_Costo_Unitario;
        private String _Apu_Proyecto_Rubro_Id;

        // Propiedades de la clase
        public String Tipo
        {
            get { return _Tipo; }
            set { _Tipo = value; }
        }

        public String Tipo_Nombre
        {
            get { return _Tipo_Nombre; }
            set { _Tipo_Nombre = value; }
        }

        public String Apu_Insumo_Id
        {
            get { return _Apu_Insumo_Id; }
            set { _Apu_Insumo_Id = value; }
        }

        public String Apu_Proyecto_Id
        {
            get { return _Apu_Proyecto_Id; }
            set { _Apu_Proyecto_Id = value; }
        }

        public String Apu_Proyecto_Codigo
        {
            get { return _Apu_Proyecto_Codigo; }
            set { _Apu_Proyecto_Codigo = value; }
        }

        public String Apu_Proyecto_Nombre
        {
            get { return _Apu_Proyecto_Nombre; }
            set { _Apu_Proyecto_Nombre = value; }
        }

        public String Apu_Proyecto_Etapa
        {
            get { return _Apu_Proyecto_Etapa; }
            set { _Apu_Proyecto_Etapa = value; }
        }

        public String Apu_Rubro_Id
        {
            get { return _Apu_Rubro_Id; }
            set { _Apu_Rubro_Id = value; }
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

        public String Apu_Insumo_Codigo
        {
            get { return _Apu_Insumo_Codigo; }
            set { _Apu_Insumo_Codigo = value; }
        }

        public String Apu_Insumo_Nombre
        {
            get { return _Apu_Insumo_Nombre; }
            set { _Apu_Insumo_Nombre = value; }
        }

        public Decimal Costo_Insumo
        {
            get { return _Costo_Insumo; }
            set { _Costo_Insumo = value; }
        }

        public Decimal Cantidad_Insumo
        {
            get { return _Cantidad_Insumo; }
            set { _Cantidad_Insumo = value; }
        }

        public Decimal Costo_x_Cantidad
        {
            get { return _Costo_x_Cantidad; }
            set { _Costo_x_Cantidad = value; }
        }

        public String Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
        }

        public Decimal Apu_Proyecto_Rubro_Cantidad
        {
            get { return _Apu_Proyecto_Rubro_Cantidad; }
            set { _Apu_Proyecto_Rubro_Cantidad = value; }
        }

        public Decimal Apu_Proyecto_Rubro_Costo_Directo
        {
            get { return _Apu_Proyecto_Rubro_Costo_Directo; }
            set { _Apu_Proyecto_Rubro_Costo_Directo = value; }
        }

        public Decimal Apu_Proyecto_Rubro_Costo_Indirecto
        {
            get { return _Apu_Proyecto_Rubro_Costo_Indirecto; }
            set { _Apu_Proyecto_Rubro_Costo_Indirecto = value; }
        }

        public Decimal Apu_Proyecto_Rubro_Costo
        {
            get { return _Apu_Proyecto_Rubro_Costo; }
            set { _Apu_Proyecto_Rubro_Costo = value; }
        }

        public Decimal Apu_Proyecto_Rubro_Costo_Unitario
        {
            get { return _Apu_Proyecto_Rubro_Costo_Unitario; }
            set { _Apu_Proyecto_Rubro_Costo_Unitario = value; }
        }

        public String Apu_Proyecto_Rubro_Id
        {
            get { return _Apu_Proyecto_Rubro_Id; }
            set { _Apu_Proyecto_Rubro_Id = value; }
        }

        // Constructor
        public Apu_Proyecto_Rubro_Insumo()
        {
        }
        public Apu_Proyecto_Rubro_Insumo( String _Tipo, String _Tipo_Nombre, String _Apu_Insumo_Id, String _Apu_Proyecto_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Insumo_Codigo, String _Apu_Insumo_Nombre, Decimal _Costo_Insumo, Decimal _Cantidad_Insumo, Decimal _Costo_x_Cantidad, String _Int_Sucursal_Id, Decimal _Apu_Proyecto_Rubro_Cantidad, Decimal _Apu_Proyecto_Rubro_Costo_Directo, Decimal _Apu_Proyecto_Rubro_Costo_Indirecto, Decimal _Apu_Proyecto_Rubro_Costo, Decimal _Apu_Proyecto_Rubro_Costo_Unitario, String _Apu_Proyecto_Rubro_Id)
        {
            this._Tipo = _Tipo;
            this._Tipo_Nombre = _Tipo_Nombre;
            this._Apu_Insumo_Id = _Apu_Insumo_Id;
            this._Apu_Proyecto_Id = _Apu_Proyecto_Id;
            this._Apu_Proyecto_Codigo = _Apu_Proyecto_Codigo;
            this._Apu_Proyecto_Nombre = _Apu_Proyecto_Nombre;
            this._Apu_Proyecto_Etapa = _Apu_Proyecto_Etapa;
            this._Apu_Rubro_Id = _Apu_Rubro_Id;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Apu_Insumo_Codigo = _Apu_Insumo_Codigo;
            this._Apu_Insumo_Nombre = _Apu_Insumo_Nombre;
            this._Costo_Insumo = _Costo_Insumo;
            this._Cantidad_Insumo = _Cantidad_Insumo;
            this._Costo_x_Cantidad = _Costo_x_Cantidad;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Apu_Proyecto_Rubro_Cantidad = _Apu_Proyecto_Rubro_Cantidad;
            this._Apu_Proyecto_Rubro_Costo_Directo = _Apu_Proyecto_Rubro_Costo_Directo;
            this._Apu_Proyecto_Rubro_Costo_Indirecto = _Apu_Proyecto_Rubro_Costo_Indirecto;
            this._Apu_Proyecto_Rubro_Costo = _Apu_Proyecto_Rubro_Costo;
            this._Apu_Proyecto_Rubro_Costo_Unitario = _Apu_Proyecto_Rubro_Costo_Unitario;
            this._Apu_Proyecto_Rubro_Id = _Apu_Proyecto_Rubro_Id;
        }
        public Apu_Proyecto_Rubro_Insumo(Apu_Proyecto_Rubro_Insumo o)
        {
            this._Tipo = o.Tipo;
            this._Tipo_Nombre = o.Tipo_Nombre;
            this._Apu_Insumo_Id = o.Apu_Insumo_Id;
            this._Apu_Proyecto_Id = o.Apu_Proyecto_Id;
            this._Apu_Proyecto_Codigo = o.Apu_Proyecto_Codigo;
            this._Apu_Proyecto_Nombre = o.Apu_Proyecto_Nombre;
            this._Apu_Proyecto_Etapa = o.Apu_Proyecto_Etapa;
            this._Apu_Rubro_Id = o.Apu_Rubro_Id;
            this._Apu_Rubro_Codigo = o.Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = o.Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = o.Apu_Rubro_Unidad;
            this._Apu_Insumo_Codigo = o.Apu_Insumo_Codigo;
            this._Apu_Insumo_Nombre = o.Apu_Insumo_Nombre;
            this._Costo_Insumo = o.Costo_Insumo;
            this._Cantidad_Insumo = o.Cantidad_Insumo;
            this._Costo_x_Cantidad = o.Costo_x_Cantidad;
            this._Int_Sucursal_Id = o.Int_Sucursal_Id;
            this._Apu_Proyecto_Rubro_Cantidad = o.Apu_Proyecto_Rubro_Cantidad;
            this._Apu_Proyecto_Rubro_Costo_Directo = o.Apu_Proyecto_Rubro_Costo_Directo;
            this._Apu_Proyecto_Rubro_Costo_Indirecto = o.Apu_Proyecto_Rubro_Costo_Indirecto;
            this._Apu_Proyecto_Rubro_Costo = o.Apu_Proyecto_Rubro_Costo;
            this._Apu_Proyecto_Rubro_Costo_Unitario = o.Apu_Proyecto_Rubro_Costo_Unitario;
            this._Apu_Proyecto_Rubro_Id = o.Apu_Proyecto_Rubro_Id;
        }
    }
}
