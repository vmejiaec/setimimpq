using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Rubro_Insumo : Entidad
    {
        // Atributos
        private String _Apu_Rubro_Id;
        private String _Apu_Insumo_Id;
        private Decimal _Cantidad;
        private DateTime _Fecha_Update;
        private String _Update_Per_Personal_Id;
        private DateTime _Fecha_Creacion;
        private String _Creacion_Per_Personal_Id;
        private String _Tipo;
        private String _Tipo_Nombre;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private String _Apu_Rubro_Unidad;
        private String _Int_Sucursal_Id;
        private String _Apu_Insumo_Codigo;
        private String _Apu_Insumo_Nombre;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Update_Per_Personal_Codigo;
        private String _Update_Per_Personal_Nombre;
        private Decimal _costo;
        private String _Apu_Subtitulo_id;
        private String _Apu_Subtitulo_Codigo;
        private String _Apu_Subtitulo_Nombre;
        private String _Apu_Titulo_Id;
        private String _Apu_Titulo_Codigo;
        private String _Apu_Titulo_Nombre;
        private Decimal _Costo_Indirecto;
        private Decimal _Costo_Directo;
        private Decimal _Costo_Total;

        // Propiedades de la clase
        public String Apu_Rubro_Id
        {
            get { return _Apu_Rubro_Id; }
            set { _Apu_Rubro_Id = value; }
        }

        public String Apu_Insumo_Id
        {
            get { return _Apu_Insumo_Id; }
            set { _Apu_Insumo_Id = value; }
        }

        public Decimal Cantidad
        {
            get { return _Cantidad; }
            set { _Cantidad = value; }
        }

        public DateTime Fecha_Update
        {
            get { return _Fecha_Update; }
            set { _Fecha_Update = value; }
        }

        public String Update_Per_Personal_Id
        {
            get { return _Update_Per_Personal_Id; }
            set { _Update_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Creacion
        {
            get { return _Fecha_Creacion; }
            set { _Fecha_Creacion = value; }
        }

        public String Creacion_Per_Personal_Id
        {
            get { return _Creacion_Per_Personal_Id; }
            set { _Creacion_Per_Personal_Id = value; }
        }

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

        public String Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
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

        public String Creacion_Per_Personal_Codigo
        {
            get { return _Creacion_Per_Personal_Codigo; }
            set { _Creacion_Per_Personal_Codigo = value; }
        }

        public String Creacion_Per_Personal_Nombre
        {
            get { return _Creacion_Per_Personal_Nombre; }
            set { _Creacion_Per_Personal_Nombre = value; }
        }

        public String Update_Per_Personal_Codigo
        {
            get { return _Update_Per_Personal_Codigo; }
            set { _Update_Per_Personal_Codigo = value; }
        }

        public String Update_Per_Personal_Nombre
        {
            get { return _Update_Per_Personal_Nombre; }
            set { _Update_Per_Personal_Nombre = value; }
        }

        public Decimal costo
        {
            get { return _costo; }
            set { _costo = value; }
        }

        public String Apu_Subtitulo_id
        {
            get { return _Apu_Subtitulo_id; }
            set { _Apu_Subtitulo_id = value; }
        }

        public String Apu_Subtitulo_Codigo
        {
            get { return _Apu_Subtitulo_Codigo; }
            set { _Apu_Subtitulo_Codigo = value; }
        }

        public String Apu_Subtitulo_Nombre
        {
            get { return _Apu_Subtitulo_Nombre; }
            set { _Apu_Subtitulo_Nombre = value; }
        }

        public String Apu_Titulo_Id
        {
            get { return _Apu_Titulo_Id; }
            set { _Apu_Titulo_Id = value; }
        }

        public String Apu_Titulo_Codigo
        {
            get { return _Apu_Titulo_Codigo; }
            set { _Apu_Titulo_Codigo = value; }
        }

        public String Apu_Titulo_Nombre
        {
            get { return _Apu_Titulo_Nombre; }
            set { _Apu_Titulo_Nombre = value; }
        }

        public Decimal Costo_Indirecto
        {
            get { return _Costo_Indirecto; }
            set { _Costo_Indirecto = value; }
        }

        public Decimal Costo_Directo
        {
            get { return _Costo_Directo; }
            set { _Costo_Directo = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        // Constructor
        public Apu_Rubro_Insumo()
        {
        }
        public Apu_Rubro_Insumo(String _Id, String _Codigo, String _Estado, String _Apu_Rubro_Id, String _Apu_Insumo_Id, Decimal _Cantidad, DateTime _Fecha_Update, String _Update_Per_Personal_Id, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, String _Tipo, String _Tipo_Nombre, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Int_Sucursal_Id, String _Apu_Insumo_Codigo, String _Apu_Insumo_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _costo, String _Apu_Subtitulo_id, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_Id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, Decimal _Costo_Indirecto, Decimal _Costo_Directo, Decimal _Costo_Total)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Rubro_Id = _Apu_Rubro_Id;
            this._Apu_Insumo_Id = _Apu_Insumo_Id;
            this._Cantidad = _Cantidad;
            this._Fecha_Update = _Fecha_Update;
            this._Update_Per_Personal_Id = _Update_Per_Personal_Id;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Tipo = _Tipo;
            this._Tipo_Nombre = _Tipo_Nombre;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Apu_Insumo_Codigo = _Apu_Insumo_Codigo;
            this._Apu_Insumo_Nombre = _Apu_Insumo_Nombre;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = _Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = _Update_Per_Personal_Nombre;
            this._costo = _costo;
            this._Apu_Subtitulo_id = _Apu_Subtitulo_id;
            this._Apu_Subtitulo_Codigo = _Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = _Apu_Subtitulo_Nombre;
            this._Apu_Titulo_Id = _Apu_Titulo_Id;
            this._Apu_Titulo_Codigo = _Apu_Titulo_Codigo;
            this._Apu_Titulo_Nombre = _Apu_Titulo_Nombre;
            this._Costo_Indirecto = _Costo_Indirecto;
            this._Costo_Directo = _Costo_Directo;
            this._Costo_Total = _Costo_Total;
        }
    }
}
