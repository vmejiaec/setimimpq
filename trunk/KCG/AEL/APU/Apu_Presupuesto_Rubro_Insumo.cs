
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto_Rubro_Insumo : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Origen;
        private String _Apu_Origen_Id;
        private String _Apu_Rubro_Id;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private Decimal _Apu_Rubro_Cantidad;
        private String _Apu_Rubro_Unidad;
        private String _Insumo;
        private String _Apu_Insumo_Id;
        private String _Apu_Insumo_Codigo;
        private String _Apu_Insumo_Nombre;
        private String _Apu_Categoria_Id;
        private String _Apu_Categoria_Codigo;
        private String _Apu_Categoria_Nombre;
        private Decimal _Costo_Diario;
        private Decimal _Rendimiento;
        private Decimal _Cantidad;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Origen
        {
            get { return _Origen; }
            set { _Origen = value; }
        }

        public String Apu_Origen_Id
        {
            get { return _Apu_Origen_Id; }
            set { _Apu_Origen_Id = value; }
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

        public Decimal Apu_Rubro_Cantidad
        {
            get { return _Apu_Rubro_Cantidad; }
            set { _Apu_Rubro_Cantidad = value; }
        }

        public String Apu_Rubro_Unidad
        {
            get { return _Apu_Rubro_Unidad; }
            set { _Apu_Rubro_Unidad = value; }
        }

        public String Insumo
        {
            get { return _Insumo; }
            set { _Insumo = value; }
        }

        public String Apu_Insumo_Id
        {
            get { return _Apu_Insumo_Id; }
            set { _Apu_Insumo_Id = value; }
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

        public String Apu_Categoria_Id
        {
            get { return _Apu_Categoria_Id; }
            set { _Apu_Categoria_Id = value; }
        }

        public String Apu_Categoria_Codigo
        {
            get { return _Apu_Categoria_Codigo; }
            set { _Apu_Categoria_Codigo = value; }
        }

        public String Apu_Categoria_Nombre
        {
            get { return _Apu_Categoria_Nombre; }
            set { _Apu_Categoria_Nombre = value; }
        }

        public Decimal Costo_Diario
        {
            get { return _Costo_Diario; }
            set { _Costo_Diario = value; }
        }

        public Decimal Rendimiento
        {
            get { return _Rendimiento; }
            set { _Rendimiento = value; }
        }

        public Decimal Cantidad
        {
            get { return _Cantidad; }
            set { _Cantidad = value; }
        }

        // Constructor
        public Apu_Presupuesto_Rubro_Insumo()
        {
        }
        public Apu_Presupuesto_Rubro_Insumo(String _Id, String _Codigo,  String _Estado, String _Descripcion, String _Origen, String _Apu_Origen_Id, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, Decimal _Apu_Rubro_Cantidad, String _Apu_Rubro_Unidad, String _Insumo, String _Apu_Insumo_Id, String _Apu_Insumo_Codigo, String _Apu_Insumo_Nombre, String _Apu_Categoria_Id, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, Decimal _Costo_Diario, Decimal _Rendimiento, Decimal _Cantidad)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Origen = _Origen;
            this._Apu_Origen_Id = _Apu_Origen_Id;
            this._Apu_Rubro_Id = _Apu_Rubro_Id;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Cantidad = _Apu_Rubro_Cantidad;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Insumo = _Insumo;
            this._Apu_Insumo_Id = _Apu_Insumo_Id;
            this._Apu_Insumo_Codigo = _Apu_Insumo_Codigo;
            this._Apu_Insumo_Nombre = _Apu_Insumo_Nombre;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Apu_Categoria_Codigo = _Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = _Apu_Categoria_Nombre;
            this._Costo_Diario = _Costo_Diario;
            this._Rendimiento = _Rendimiento;
            this._Cantidad = _Cantidad;
        }
        public Apu_Presupuesto_Rubro_Insumo(Apu_Presupuesto_Rubro_Insumo o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Origen = o.Origen;
            this._Apu_Origen_Id = o.Apu_Origen_Id;
            this._Apu_Rubro_Id = o.Apu_Rubro_Id;
            this._Apu_Rubro_Codigo = o.Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = o.Apu_Rubro_Nombre;
            this._Apu_Rubro_Cantidad = o.Apu_Rubro_Cantidad;
            this._Apu_Rubro_Unidad = o.Apu_Rubro_Unidad;
            this._Insumo = o.Insumo;
            this._Apu_Insumo_Id = o.Apu_Insumo_Id;
            this._Apu_Insumo_Codigo = o.Apu_Insumo_Codigo;
            this._Apu_Insumo_Nombre = o.Apu_Insumo_Nombre;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Apu_Categoria_Codigo = o.Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = o.Apu_Categoria_Nombre;
            this._Costo_Diario = o.Costo_Diario;
            this._Rendimiento = o.Rendimiento;
            this._Cantidad = o.Cantidad;
        }
    }
}
