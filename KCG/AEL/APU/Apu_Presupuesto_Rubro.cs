
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto_Rubro : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Apu_Presupuesto_Id;
        private String _Apu_Rubro_id;
        private String _Apu_Rubro_Codigo;
        private String _Apu_Rubro_Nombre;
        private String _Apu_Rubro_Unidad;
        private Decimal _Apu_Rubro_Cantidad;
        private Decimal _Costo_Unitario;
        private Decimal _Costo_Total;
        private String _Apu_Subtitulo_Id;
        private String _Apu_Subtitulo_Codigo;
        private String _Apu_Subtitulo_Nombre;
        private String _Apu_Titulo_id;
        private String _Apu_Titulo_Codigo;
        private String _Apu_Titulo_Nombre;
        private String _Apu_Origen_Id;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Apu_Presupuesto_Id
        {
            get { return _Apu_Presupuesto_Id; }
            set { _Apu_Presupuesto_Id = value; }
        }

        public String Apu_Rubro_id
        {
            get { return _Apu_Rubro_id; }
            set { _Apu_Rubro_id = value; }
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

        public Decimal Apu_Rubro_Cantidad
        {
            get { return _Apu_Rubro_Cantidad; }
            set { _Apu_Rubro_Cantidad = value; }
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

        public String Apu_Subtitulo_Id
        {
            get { return _Apu_Subtitulo_Id; }
            set { _Apu_Subtitulo_Id = value; }
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

        public String Apu_Titulo_id
        {
            get { return _Apu_Titulo_id; }
            set { _Apu_Titulo_id = value; }
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

        public String Apu_Origen_Id
        {
            get { return _Apu_Origen_Id; }
            set { _Apu_Origen_Id = value; }
        }

        // Constructor
        public Apu_Presupuesto_Rubro()
        {
        }
        public Apu_Presupuesto_Rubro(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Apu_Presupuesto_Id, String _Apu_Rubro_id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, Decimal _Apu_Rubro_Cantidad, Decimal _Costo_Unitario, Decimal _Costo_Total, String _Apu_Subtitulo_Id, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, String _Apu_Origen_Id)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Apu_Presupuesto_Id = _Apu_Presupuesto_Id;
            this._Apu_Rubro_id = _Apu_Rubro_id;
            this._Apu_Rubro_Codigo = _Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = _Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = _Apu_Rubro_Unidad;
            this._Apu_Rubro_Cantidad = _Apu_Rubro_Cantidad;
            this._Costo_Unitario = _Costo_Unitario;
            this._Costo_Total = _Costo_Total;
            this._Apu_Subtitulo_Id = _Apu_Subtitulo_Id;
            this._Apu_Subtitulo_Codigo = _Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = _Apu_Subtitulo_Nombre;
            this._Apu_Titulo_id = _Apu_Titulo_id;
            this._Apu_Titulo_Codigo = _Apu_Titulo_Codigo;
            this._Apu_Titulo_Nombre = _Apu_Titulo_Nombre;
            this._Apu_Origen_Id = _Apu_Origen_Id;
        }
        public Apu_Presupuesto_Rubro(Apu_Presupuesto_Rubro o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Apu_Presupuesto_Id = o.Apu_Presupuesto_Id;
            this._Apu_Rubro_id = o.Apu_Rubro_id;
            this._Apu_Rubro_Codigo = o.Apu_Rubro_Codigo;
            this._Apu_Rubro_Nombre = o.Apu_Rubro_Nombre;
            this._Apu_Rubro_Unidad = o.Apu_Rubro_Unidad;
            this._Apu_Rubro_Cantidad = o.Apu_Rubro_Cantidad;
            this._Costo_Unitario = o.Costo_Unitario;
            this._Costo_Total = o.Costo_Total;
            this._Apu_Subtitulo_Id = o.Apu_Subtitulo_Id;
            this._Apu_Subtitulo_Codigo = o.Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = o.Apu_Subtitulo_Nombre;
            this._Apu_Titulo_id = o.Apu_Titulo_id;
            this._Apu_Titulo_Codigo = o.Apu_Titulo_Codigo;
            this._Apu_Titulo_Nombre = o.Apu_Titulo_Nombre;
            this._Apu_Origen_Id = o.Apu_Origen_Id;
        }
    }
}
