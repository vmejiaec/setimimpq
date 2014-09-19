
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Catalogo : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Int_Empresa_Id;
        private DateTime _Fecha_Creacion;
        private String _Creacion_Per_Personal_Id;
        private DateTime _Fecha_Publicacion;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
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

        public DateTime Fecha_Publicacion
        {
            get { return _Fecha_Publicacion; }
            set { _Fecha_Publicacion = value; }
        }

        public String Int_Empresa_Codigo
        {
            get { return _Int_Empresa_Codigo; }
            set { _Int_Empresa_Codigo = value; }
        }

        public String Int_Empresa_Nombre
        {
            get { return _Int_Empresa_Nombre; }
            set { _Int_Empresa_Nombre = value; }
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

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Catalogo()
        {
        }
        public Fis_Catalogo(String _Id, String _Codigo, String _Nombre, String _Estado, String _Descripcion, String _Int_Empresa_Id, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Publicacion, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Fecha_Publicacion = _Fecha_Publicacion;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Fis_Catalogo(Fis_Catalogo o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Fecha_Creacion = o.Fecha_Creacion;
            this._Creacion_Per_Personal_Id = o.Creacion_Per_Personal_Id;
            this._Fecha_Publicacion = o.Fecha_Publicacion;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Creacion_Per_Personal_Codigo = o.Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = o.Creacion_Per_Personal_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
