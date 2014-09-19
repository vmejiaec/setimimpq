
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Oferta_Rubro : Entidad
    {
        // Atributos
        private String _Apu_Oferta_Id;
        private String _Apu_Rubro_Id;
        private Decimal _Cantidad;
        private String _Apu_Oferta_Codigo;
        private String _Apu_Oferta_Nombre;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private String _Apu_Rubro_Unidad;
        private String _Estado_Nombre;
        private Decimal _Material_costo_total;
        private Decimal _Transporte_costo_total;
        private Decimal _Mano_obra_costo_total;
        private Decimal _Equipo_costo_total;
        private Decimal _Costo_Unitario;
        private Decimal _Costo_Total;
        private String _Apu_Oferta_Etapa;
        private Decimal _Apu_rubro_Costo_Total;
        private DateTime _Material_ultima_fecha_update;
        private DateTime _Transporte_ultima_fecha_update;
        private DateTime _Mano_obra_ultima_fecha_update;
        private DateTime _Equipo_ultima_fecha_update;
        private String _int_moneda_simbolo;
        private String _Int_Sucursal_Id;
        private Decimal _Costo_Indirecto;
        private Decimal _Costo_Directo_Indirecto;
        private Decimal _Apu_Oferta_Costo_Total;

        // Propiedades de la clase
        public String Apu_Oferta_Id
        {
            get { return _Apu_Oferta_Id; }
            set { _Apu_Oferta_Id = value; }
        }

        public String Apu_Rubro_Id
        {
            get { return _Apu_Rubro_Id; }
            set { _Apu_Rubro_Id = value; }
        }

        public Decimal Cantidad
        {
            get { return _Cantidad; }
            set { _Cantidad = value; }
        }

        public String Apu_Oferta_Codigo
        {
            get { return _Apu_Oferta_Codigo; }
            set { _Apu_Oferta_Codigo = value; }
        }

        public String Apu_Oferta_Nombre
        {
            get { return _Apu_Oferta_Nombre; }
            set { _Apu_Oferta_Nombre = value; }
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

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        public Decimal Material_costo_total
        {
            get { return _Material_costo_total; }
            set { _Material_costo_total = value; }
        }

        public Decimal Transporte_costo_total
        {
            get { return _Transporte_costo_total; }
            set { _Transporte_costo_total = value; }
        }

        public Decimal Mano_obra_costo_total
        {
            get { return _Mano_obra_costo_total; }
            set { _Mano_obra_costo_total = value; }
        }

        public Decimal Equipo_costo_total
        {
            get { return _Equipo_costo_total; }
            set { _Equipo_costo_total = value; }
        }

        public Decimal Costo_Unitario
        {
            get { return _Costo_Unitario; }
            set { _Costo_Unitario = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public String Apu_Oferta_Etapa
        {
            get { return _Apu_Oferta_Etapa; }
            set { _Apu_Oferta_Etapa = value; }
        }

        public Decimal Apu_rubro_Costo_Total
        {
            get { return _Apu_rubro_Costo_Total; }
            set { _Apu_rubro_Costo_Total = value; }
        }

        public DateTime Material_ultima_fecha_update
        {
            get { return _Material_ultima_fecha_update; }
            set { _Material_ultima_fecha_update = value; }
        }

        public DateTime Transporte_ultima_fecha_update
        {
            get { return _Transporte_ultima_fecha_update; }
            set { _Transporte_ultima_fecha_update = value; }
        }

        public DateTime Mano_obra_ultima_fecha_update
        {
            get { return _Mano_obra_ultima_fecha_update; }
            set { _Mano_obra_ultima_fecha_update = value; }
        }

        public DateTime Equipo_ultima_fecha_update
        {
            get { return _Equipo_ultima_fecha_update; }
            set { _Equipo_ultima_fecha_update = value; }
        }

        public String int_moneda_simbolo
        {
            get { return _int_moneda_simbolo; }
            set { _int_moneda_simbolo = value; }
        }

        public String Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
        }

        public Decimal Costo_Indirecto
        {
            get { return _Costo_Indirecto; }
            set { _Costo_Indirecto = value; }
        }

        public Decimal Costo_Directo_Indirecto
        {
            get { return _Costo_Directo_Indirecto; }
            set { _Costo_Directo_Indirecto = value; }
        }

        public Decimal Apu_Oferta_Costo_Total
        {
            get { return _Apu_Oferta_Costo_Total; }
            set { _Apu_Oferta_Costo_Total = value; }
        }

        // Constructor
        public Apu_Oferta_Rubro()
        {
        }
        public Apu_Oferta_Rubro(String _Id, String _Codigo, String _Estado, String _Apu_Oferta_Id, String _Apu_Rubro_Id, Decimal _Cantidad, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Estado_Nombre, Decimal _Material_costo_total, Decimal _Transporte_costo_total, Decimal _Mano_obra_costo_total, Decimal _Equipo_costo_total, Decimal _Costo_Unitario, Decimal _Costo_Total, String _Apu_Oferta_Etapa, Decimal _Apu_rubro_Costo_Total, DateTime _Material_ultima_fecha_update, DateTime _Transporte_ultima_fecha_update, DateTime _Mano_obra_ultima_fecha_update, DateTime _Equipo_ultima_fecha_update, String _int_moneda_simbolo, String _Int_Sucursal_Id, Decimal _Costo_Indirecto, Decimal _Costo_Directo_Indirecto, Decimal _Apu_Oferta_Costo_Total)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Oferta_Id = _Apu_Oferta_Id;
            this._Apu_Rubro_Id = _Apu_Rubro_Id;
            this._Cantidad = _Cantidad;
            this._Apu_Oferta_Codigo = _Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = _Apu_Oferta_Nombre;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Estado_Nombre = _Estado_Nombre;
            this._Material_costo_total = _Material_costo_total;
            this._Transporte_costo_total = _Transporte_costo_total;
            this._Mano_obra_costo_total = _Mano_obra_costo_total;
            this._Equipo_costo_total = _Equipo_costo_total;
            this._Costo_Unitario = _Costo_Unitario;
            this._Costo_Total = _Costo_Total;
            this._Apu_Oferta_Etapa = _Apu_Oferta_Etapa;
            this._Apu_rubro_Costo_Total = _Apu_rubro_Costo_Total;
            this._Material_ultima_fecha_update = _Material_ultima_fecha_update;
            this._Transporte_ultima_fecha_update = _Transporte_ultima_fecha_update;
            this._Mano_obra_ultima_fecha_update = _Mano_obra_ultima_fecha_update;
            this._Equipo_ultima_fecha_update = _Equipo_ultima_fecha_update;
            this._int_moneda_simbolo = _int_moneda_simbolo;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Costo_Indirecto = _Costo_Indirecto;
            this._Costo_Directo_Indirecto = _Costo_Directo_Indirecto;
            this._Apu_Oferta_Costo_Total = _Apu_Oferta_Costo_Total;
        }
    }
}
