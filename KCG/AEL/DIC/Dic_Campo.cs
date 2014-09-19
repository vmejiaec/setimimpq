
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
    public class Dic_Campo : Entidad
    {
        // Atributos
        private String _Dic_Objeto_Id;
        private String _Tipo_Dato;
        private String _Tipo_Constraint;
        private String _Filtro;
        private String _Estado_Nombre;
        private String _Dic_Objeto_Codigo;
        private String _Dic_Objeto_Nombre;
        private String _Tipo_Dato_nombre;
        private String _Tipo_Constraint_nombre;
        private String _Filtro_Nombre;
        private String _Dic_Modulo_Id;
        private String _Dic_Modulo_Codigo;
        private String _Dic_Modulo_Nombre;
        private String _Tipo_Dato_Nombre;
        private String _Tipo_Constraint_Nombre;
        private String _Sug_Dic_Rotulo_Id;
        private String _Sug_Dic_Rotulo_Nombre;
        private String _Sug_Dic_Rotulo_Codigo;
        private String _SugTool_Dic_Rotulo_Id;
        private String _SugTool_Dic_Rotulo_Nombre;
        private String _SugTool_Dic_Rotulo_Codigo;

        // Propiedades de la clase
        public String Dic_Objeto_Id
        {
            get { return _Dic_Objeto_Id; }
            set { _Dic_Objeto_Id = value; }
        }

        public String Tipo_Dato
        {
            get { return _Tipo_Dato; }
            set { _Tipo_Dato = value; }
        }

        public String Tipo_Constraint
        {
            get { return _Tipo_Constraint; }
            set { _Tipo_Constraint = value; }
        }

        public String Filtro
        {
            get { return _Filtro; }
            set { _Filtro = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
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

        public String Tipo_Dato_nombre
        {
            get { return _Tipo_Dato_nombre; }
            set { _Tipo_Dato_nombre = value; }
        }

        public String Tipo_Constraint_nombre
        {
            get { return _Tipo_Constraint_nombre; }
            set { _Tipo_Constraint_nombre = value; }
        }

        public String Filtro_Nombre
        {
            get { return _Filtro_Nombre; }
            set { _Filtro_Nombre = value; }
        }

        public String Dic_Modulo_Id
        {
            get { return _Dic_Modulo_Id; }
            set { _Dic_Modulo_Id = value; }
        }

        public String Dic_Modulo_Codigo
        {
            get { return _Dic_Modulo_Codigo; }
            set { _Dic_Modulo_Codigo = value; }
        }

        public String Dic_Modulo_Nombre
        {
            get { return _Dic_Modulo_Nombre; }
            set { _Dic_Modulo_Nombre = value; }
        }

        public String Tipo_Dato_Nombre
        {
            get { return _Tipo_Dato_Nombre; }
            set { _Tipo_Dato_Nombre = value; }
        }

        public String Tipo_Constraint_Nombre
        {
            get { return _Tipo_Constraint_Nombre; }
            set { _Tipo_Constraint_Nombre = value; }
        }

        public String Sug_Dic_Rotulo_Id
        {
            get { return _Sug_Dic_Rotulo_Id; }
            set { _Sug_Dic_Rotulo_Id = value; }
        }

        public String Sug_Dic_Rotulo_Nombre
        {
            get { return _Sug_Dic_Rotulo_Nombre; }
            set { _Sug_Dic_Rotulo_Nombre = value; }
        }

        public String Sug_Dic_Rotulo_Codigo
        {
            get { return _Sug_Dic_Rotulo_Codigo; }
            set { _Sug_Dic_Rotulo_Codigo = value; }
        }

        public String SugTool_Dic_Rotulo_Id
        {
            get { return _SugTool_Dic_Rotulo_Id; }
            set { _SugTool_Dic_Rotulo_Id = value; }
        }

        public String SugTool_Dic_Rotulo_Nombre
        {
            get { return _SugTool_Dic_Rotulo_Nombre; }
            set { _SugTool_Dic_Rotulo_Nombre = value; }
        }

        public String SugTool_Dic_Rotulo_Codigo
        {
            get { return _SugTool_Dic_Rotulo_Codigo; }
            set { _SugTool_Dic_Rotulo_Codigo = value; }
        }

        // Constructor
        public Dic_Campo()
        {
        }

        public Dic_Campo(String _Id, String _Codigo, String _Nombre, String _Estado, String _Dic_Objeto_Id, String _Tipo_Dato, String _Tipo_Constraint, String _Filtro, String _Estado_Nombre, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Tipo_Dato_nombre, String _Tipo_Constraint_nombre, String _Filtro_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Tipo_Dato_Nombre, String _Tipo_Constraint_Nombre, String _Sug_Dic_Rotulo_Id, String _Sug_Dic_Rotulo_Nombre, String _Sug_Dic_Rotulo_Codigo, String _SugTool_Dic_Rotulo_Id, String _SugTool_Dic_Rotulo_Nombre, String _SugTool_Dic_Rotulo_Codigo)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Dic_Objeto_Id = _Dic_Objeto_Id;
            this._Tipo_Dato = _Tipo_Dato;
            this._Tipo_Constraint = _Tipo_Constraint;
            this._Filtro = _Filtro;
            this._Estado_Nombre = _Estado_Nombre;
            this._Dic_Objeto_Codigo = _Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = _Dic_Objeto_Nombre;
            this._Tipo_Dato_nombre = _Tipo_Dato_nombre;
            this._Tipo_Constraint_nombre = _Tipo_Constraint_nombre;
            this._Filtro_Nombre = _Filtro_Nombre;
            this._Dic_Modulo_Id = _Dic_Modulo_Id;
            this._Dic_Modulo_Codigo = _Dic_Modulo_Codigo;
            this._Dic_Modulo_Nombre = _Dic_Modulo_Nombre;
            this._Tipo_Dato_Nombre = _Tipo_Dato_Nombre;
            this._Tipo_Constraint_Nombre = _Tipo_Constraint_Nombre;
            this._Sug_Dic_Rotulo_Id = _Sug_Dic_Rotulo_Id;
            this._Sug_Dic_Rotulo_Nombre = _Sug_Dic_Rotulo_Nombre;
            this._Sug_Dic_Rotulo_Codigo = _Sug_Dic_Rotulo_Codigo;
            this._SugTool_Dic_Rotulo_Id = _SugTool_Dic_Rotulo_Id;
            this._SugTool_Dic_Rotulo_Nombre = _SugTool_Dic_Rotulo_Nombre;
            this._SugTool_Dic_Rotulo_Codigo = _SugTool_Dic_Rotulo_Codigo;
        }

        public Dic_Campo(Dic_Campo o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Dic_Objeto_Id = o.Dic_Objeto_Id;
            this._Tipo_Dato = o.Tipo_Dato;
            this._Tipo_Constraint = o.Tipo_Constraint;
            this._Filtro = o.Filtro;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Dic_Objeto_Codigo = o.Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = o.Dic_Objeto_Nombre;
            this._Tipo_Dato_nombre = o.Tipo_Dato_nombre;
            this._Tipo_Constraint_nombre = o.Tipo_Constraint_nombre;
            this._Filtro_Nombre = o.Filtro_Nombre;
            this._Dic_Modulo_Id = o.Dic_Modulo_Id;
            this._Dic_Modulo_Codigo = o.Dic_Modulo_Codigo;
            this._Dic_Modulo_Nombre = o.Dic_Modulo_Nombre;
            this._Tipo_Dato_Nombre = o.Tipo_Dato_Nombre;
            this._Tipo_Constraint_Nombre = o.Tipo_Constraint_Nombre;
            this._Sug_Dic_Rotulo_Id = o.Sug_Dic_Rotulo_Id;
            this._Sug_Dic_Rotulo_Nombre = o.Sug_Dic_Rotulo_Nombre;
            this._Sug_Dic_Rotulo_Codigo = o.Sug_Dic_Rotulo_Codigo;
            this._SugTool_Dic_Rotulo_Id = o.SugTool_Dic_Rotulo_Id;
            this._SugTool_Dic_Rotulo_Nombre = o.SugTool_Dic_Rotulo_Nombre;
            this._SugTool_Dic_Rotulo_Codigo = o.SugTool_Dic_Rotulo_Codigo;
        }
    }
}
