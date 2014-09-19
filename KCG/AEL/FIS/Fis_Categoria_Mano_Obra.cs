
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Catalogo_Mano_Obra : Entidad
    {
        // Atributos
        private String _Fis_Catalogo_Id;
        private String _Apu_Categoria_Id;
        private String _Apu_Mano_Obra_Id;
        private Decimal _Valor;
        private String _Descripcion;
        private String _Fis_Catalogo_Codigo;
        private String _Fis_Catalogo_Nombre;
        private DateTime _Fis_Catalogo_Fecha_Publicacion;
        private DateTime _Fis_Catalogo_Fecha_Creacion;
        private String _Apu_Categoria_Codigo;
        private String _Apu_Categoria_Nombre;
        private String _Apu_Mano_Obra_Codigo;
        private String _Apu_Mano_Obra_Nombre;
        private Decimal _Fis_Catalogo_Categoria_Valor;
        private Decimal _Fis_Catalogo_CMO_Valor;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Fis_Catalogo_Id
        {
            get { return _Fis_Catalogo_Id; }
            set { _Fis_Catalogo_Id = value; }
        }

        public String Apu_Categoria_Id
        {
            get { return _Apu_Categoria_Id; }
            set { _Apu_Categoria_Id = value; }
        }

        public String Apu_Mano_Obra_Id
        {
            get { return _Apu_Mano_Obra_Id; }
            set { _Apu_Mano_Obra_Id = value; }
        }

        public Decimal Valor
        {
            get { return _Valor; }
            set { _Valor = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Fis_Catalogo_Codigo
        {
            get { return _Fis_Catalogo_Codigo; }
            set { _Fis_Catalogo_Codigo = value; }
        }

        public String Fis_Catalogo_Nombre
        {
            get { return _Fis_Catalogo_Nombre; }
            set { _Fis_Catalogo_Nombre = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Publicacion
        {
            get { return _Fis_Catalogo_Fecha_Publicacion; }
            set { _Fis_Catalogo_Fecha_Publicacion = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Creacion
        {
            get { return _Fis_Catalogo_Fecha_Creacion; }
            set { _Fis_Catalogo_Fecha_Creacion = value; }
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

        public String Apu_Mano_Obra_Codigo
        {
            get { return _Apu_Mano_Obra_Codigo; }
            set { _Apu_Mano_Obra_Codigo = value; }
        }

        public String Apu_Mano_Obra_Nombre
        {
            get { return _Apu_Mano_Obra_Nombre; }
            set { _Apu_Mano_Obra_Nombre = value; }
        }

        public Decimal Fis_Catalogo_Categoria_Valor
        {
            get { return _Fis_Catalogo_Categoria_Valor; }
            set { _Fis_Catalogo_Categoria_Valor = value; }
        }

        public Decimal Fis_Catalogo_CMO_Valor
        {
            get { return _Fis_Catalogo_CMO_Valor; }
            set { _Fis_Catalogo_CMO_Valor = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Catalogo_Mano_Obra()
        {
        }

        public Fis_Catalogo_Mano_Obra(String _Id, String _Codigo, String _Estado, String _Fis_Catalogo_Id, String _Apu_Categoria_Id, String _Apu_Mano_Obra_Id, Decimal _Valor, String _Descripcion, String _Fis_Catalogo_Codigo, String _Fis_Catalogo_Nombre, DateTime _Fis_Catalogo_Fecha_Publicacion, DateTime _Fis_Catalogo_Fecha_Creacion, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Apu_Mano_Obra_Codigo, String _Apu_Mano_Obra_Nombre, Decimal _Fis_Catalogo_Categoria_Valor, Decimal _Fis_Catalogo_CMO_Valor, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Fis_Catalogo_Id = _Fis_Catalogo_Id;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Apu_Mano_Obra_Id = _Apu_Mano_Obra_Id;
            this._Valor = _Valor;
            this._Descripcion = _Descripcion;
            this._Fis_Catalogo_Codigo = _Fis_Catalogo_Codigo;
            this._Fis_Catalogo_Nombre = _Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Fecha_Publicacion = _Fis_Catalogo_Fecha_Publicacion;
            this._Fis_Catalogo_Fecha_Creacion = _Fis_Catalogo_Fecha_Creacion;
            this._Apu_Categoria_Codigo = _Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = _Apu_Categoria_Nombre;
            this._Apu_Mano_Obra_Codigo = _Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = _Apu_Mano_Obra_Nombre;
            this._Fis_Catalogo_Categoria_Valor = _Fis_Catalogo_Categoria_Valor;
            this._Fis_Catalogo_CMO_Valor = _Fis_Catalogo_CMO_Valor;
            this._Estado_Nombre = _Estado_Nombre;
        }

        public Fis_Catalogo_Mano_Obra(Fis_Catalogo_Mano_Obra o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Fis_Catalogo_Id = o.Fis_Catalogo_Id;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Apu_Mano_Obra_Id = o.Apu_Mano_Obra_Id;
            this._Valor = o.Valor;
            this._Descripcion = o.Descripcion;
            this._Fis_Catalogo_Codigo = o.Fis_Catalogo_Codigo;
            this._Fis_Catalogo_Nombre = o.Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Fecha_Publicacion = o.Fis_Catalogo_Fecha_Publicacion;
            this._Fis_Catalogo_Fecha_Creacion = o.Fis_Catalogo_Fecha_Creacion;
            this._Apu_Categoria_Codigo = o.Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = o.Apu_Categoria_Nombre;
            this._Apu_Mano_Obra_Codigo = o.Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = o.Apu_Mano_Obra_Nombre;
            this._Fis_Catalogo_Categoria_Valor = o.Fis_Catalogo_Categoria_Valor;
            this._Fis_Catalogo_CMO_Valor = o.Fis_Catalogo_CMO_Valor;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
