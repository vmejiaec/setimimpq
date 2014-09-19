
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APR
{
    public class Apr_Doc_Estado : Entidad
    {
        // Atributos
        private String _Apr_Estado_Id;
        private String _Apr_Documento_Id;
        private String _Descripcion;
        private Int32 _Orden;
        private String _Apr_Estado_Codigo;
        private String _Apr_Estado_Nombre;
        private String _Apr_Estado_Dominio;
        private String _Apr_Documento_codigo;
        private String _Apr_Documento_nombre;
        private String _Dic_Campo_Id;
        private String _Dic_Campo_Codigo;
        private String _Dic_Campo_Nombre;
        private String _Dic_Campo_Tipo_Dato;
        private String _Dic_Campo_Constraint;
        private String _Dic_Objeto_Id;
        private String _Dic_Objeto_Codigo;
        private String _Dic_Objeto_Nombre;
        private String _Estado_Nombre;
        private String _Ver_Doc_Estado_Nombre;
        private String _Ver_Doc_Estado_Descripcion;

        // Propiedades de la clase
        public String Apr_Estado_Id
        {
            get { return _Apr_Estado_Id; }
            set { _Apr_Estado_Id = value; }
        }

        public String Apr_Documento_Id
        {
            get { return _Apr_Documento_Id; }
            set { _Apr_Documento_Id = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public Int32 Orden
        {
            get { return _Orden; }
            set { _Orden = value; }
        }

        public String Apr_Estado_Codigo
        {
            get { return _Apr_Estado_Codigo; }
            set { _Apr_Estado_Codigo = value; }
        }

        public String Apr_Estado_Nombre
        {
            get { return _Apr_Estado_Nombre; }
            set { _Apr_Estado_Nombre = value; }
        }

        public String Apr_Estado_Dominio
        {
            get { return _Apr_Estado_Dominio; }
            set { _Apr_Estado_Dominio = value; }
        }

        public String Apr_Documento_codigo
        {
            get { return _Apr_Documento_codigo; }
            set { _Apr_Documento_codigo = value; }
        }

        public String Apr_Documento_nombre
        {
            get { return _Apr_Documento_nombre; }
            set { _Apr_Documento_nombre = value; }
        }

        public String Dic_Campo_Id
        {
            get { return _Dic_Campo_Id; }
            set { _Dic_Campo_Id = value; }
        }

        public String Dic_Campo_Codigo
        {
            get { return _Dic_Campo_Codigo; }
            set { _Dic_Campo_Codigo = value; }
        }

        public String Dic_Campo_Nombre
        {
            get { return _Dic_Campo_Nombre; }
            set { _Dic_Campo_Nombre = value; }
        }

        public String Dic_Campo_Tipo_Dato
        {
            get { return _Dic_Campo_Tipo_Dato; }
            set { _Dic_Campo_Tipo_Dato = value; }
        }

        public String Dic_Campo_Constraint
        {
            get { return _Dic_Campo_Constraint; }
            set { _Dic_Campo_Constraint = value; }
        }

        public String Dic_Objeto_Id
        {
            get { return _Dic_Objeto_Id; }
            set { _Dic_Objeto_Id = value; }
        }

        public String Dic_Objeto_Codigo
        {
            get { return _Dic_Objeto_Codigo; }
            set { _Dic_Objeto_Codigo = value; }
        }

        public String Dic_Objeto_Nombre
        {
            get { return _Dic_Objeto_Nombre; }
            set { _Dic_Objeto_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        public String Ver_Doc_Estado_Nombre
        {
            get { return _Ver_Doc_Estado_Nombre; }
            set { _Ver_Doc_Estado_Nombre = value; }
        }

        public String Ver_Doc_Estado_Descripcion
        {
            get { return _Ver_Doc_Estado_Descripcion; }
            set { _Ver_Doc_Estado_Descripcion = value; }
        }

        // Constructor
        public Apr_Doc_Estado()
        {
        }
        public Apr_Doc_Estado(String _Id, String _Codigo,  String _Estado, String _Apr_Estado_Id, String _Apr_Documento_Id, String _Descripcion, Int32 _Orden, String _Apr_Estado_Codigo, String _Apr_Estado_Nombre, String _Apr_Estado_Dominio, String _Apr_Documento_codigo, String _Apr_Documento_nombre, String _Dic_Campo_Id, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Dic_Campo_Tipo_Dato, String _Dic_Campo_Constraint, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Estado_Nombre, String _Ver_Doc_Estado_Nombre, String _Ver_Doc_Estado_Descripcion)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apr_Estado_Id = _Apr_Estado_Id;
            this._Apr_Documento_Id = _Apr_Documento_Id;
            this._Descripcion = _Descripcion;
            this._Orden = _Orden;
            this._Apr_Estado_Codigo = _Apr_Estado_Codigo;
            this._Apr_Estado_Nombre = _Apr_Estado_Nombre;
            this._Apr_Estado_Dominio = _Apr_Estado_Dominio;
            this._Apr_Documento_codigo = _Apr_Documento_codigo;
            this._Apr_Documento_nombre = _Apr_Documento_nombre;
            this._Dic_Campo_Id = _Dic_Campo_Id;
            this._Dic_Campo_Codigo = _Dic_Campo_Codigo;
            this._Dic_Campo_Nombre = _Dic_Campo_Nombre;
            this._Dic_Campo_Tipo_Dato = _Dic_Campo_Tipo_Dato;
            this._Dic_Campo_Constraint = _Dic_Campo_Constraint;
            this._Dic_Objeto_Id = _Dic_Objeto_Id;
            this._Dic_Objeto_Codigo = _Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = _Dic_Objeto_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Ver_Doc_Estado_Nombre = _Ver_Doc_Estado_Nombre;
            this._Ver_Doc_Estado_Descripcion = _Ver_Doc_Estado_Descripcion;
        }
        public Apr_Doc_Estado(Apr_Doc_Estado o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apr_Estado_Id = o.Apr_Estado_Id;
            this._Apr_Documento_Id = o.Apr_Documento_Id;
            this._Descripcion = o.Descripcion;
            this._Orden = o.Orden;
            this._Apr_Estado_Codigo = o.Apr_Estado_Codigo;
            this._Apr_Estado_Nombre = o.Apr_Estado_Nombre;
            this._Apr_Estado_Dominio = o.Apr_Estado_Dominio;
            this._Apr_Documento_codigo = o.Apr_Documento_codigo;
            this._Apr_Documento_nombre = o.Apr_Documento_nombre;
            this._Dic_Campo_Id = o.Dic_Campo_Id;
            this._Dic_Campo_Codigo = o.Dic_Campo_Codigo;
            this._Dic_Campo_Nombre = o.Dic_Campo_Nombre;
            this._Dic_Campo_Tipo_Dato = o.Dic_Campo_Tipo_Dato;
            this._Dic_Campo_Constraint = o.Dic_Campo_Constraint;
            this._Dic_Objeto_Id = o.Dic_Objeto_Id;
            this._Dic_Objeto_Codigo = o.Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = o.Dic_Objeto_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Ver_Doc_Estado_Nombre = o.Ver_Doc_Estado_Nombre;
            this._Ver_Doc_Estado_Descripcion = o.Ver_Doc_Estado_Descripcion;
        }
    }
}
