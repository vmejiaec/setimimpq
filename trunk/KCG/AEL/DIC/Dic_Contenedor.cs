
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
    public class Dic_Contenedor : Entidad
    {
        // Atributos
        private String _Tipo;
        private String _Dic_Modulo_id;
        private String _Filtro;
        private String _Estado_nombre;
        private String _Tipo_Nombre;
        private String _Dic_Modulo_Codigo;
        private String _Dic_Modulo_Nombre;
        private String _Filtro_Nombre;
        private String _archivo_recursos;
        private String _Menu_Dic_Con_Elemento_Id;
        private String _Menu_Dic_Con_Elemento_Nombre;
        private String _Menu_Dic_Rotulo_Id;
        private String _Menu_Dic_Rotulo_Nombre;
        private String _Menu_Ver_Etiqueta_Nombre;

        // Propiedades de la clase
        public String Tipo
        {
            get { return _Tipo; }
            set { _Tipo = value; }
        }

        public String Dic_Modulo_id
        {
            get { return _Dic_Modulo_id; }
            set { _Dic_Modulo_id = value; }
        }

        public String Filtro
        {
            get { return _Filtro; }
            set { _Filtro = value; }
        }

        public String Estado_nombre
        {
            get { return _Estado_nombre; }
            set { _Estado_nombre = value; }
        }

        public String Tipo_Nombre
        {
            get { return _Tipo_Nombre; }
            set { _Tipo_Nombre = value; }
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

        public String Filtro_Nombre
        {
            get { return _Filtro_Nombre; }
            set { _Filtro_Nombre = value; }
        }

        public String archivo_recursos
        {
            get { return _archivo_recursos; }
            set { _archivo_recursos = value; }
        }

        public String Menu_Dic_Con_Elemento_Id
        {
            get { return _Menu_Dic_Con_Elemento_Id; }
            set { _Menu_Dic_Con_Elemento_Id = value; }
        }

        public String Menu_Dic_Con_Elemento_Nombre
        {
            get { return _Menu_Dic_Con_Elemento_Nombre; }
            set { _Menu_Dic_Con_Elemento_Nombre = value; }
        }

        public String Menu_Dic_Rotulo_Id
        {
            get { return _Menu_Dic_Rotulo_Id; }
            set { _Menu_Dic_Rotulo_Id = value; }
        }

        public String Menu_Dic_Rotulo_Nombre
        {
            get { return _Menu_Dic_Rotulo_Nombre; }
            set { _Menu_Dic_Rotulo_Nombre = value; }
        }

        public String Menu_Ver_Etiqueta_Nombre
        {
            get { return _Menu_Ver_Etiqueta_Nombre; }
            set { _Menu_Ver_Etiqueta_Nombre = value; }
        }

        // Constructor
        public Dic_Contenedor()
        {
        }
        public Dic_Contenedor(String _Id, String _Codigo, String _Nombre, String _Estado, String _Tipo, String _Dic_Modulo_id, String _Filtro, String _Estado_nombre, String _Tipo_Nombre, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Filtro_Nombre, String _archivo_recursos, String _Menu_Dic_Con_Elemento_Id, String _Menu_Dic_Con_Elemento_Nombre, String _Menu_Dic_Rotulo_Id, String _Menu_Dic_Rotulo_Nombre, String _Menu_Ver_Etiqueta_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Tipo = _Tipo;
            this._Dic_Modulo_id = _Dic_Modulo_id;
            this._Filtro = _Filtro;
            this._Estado_nombre = _Estado_nombre;
            this._Tipo_Nombre = _Tipo_Nombre;
            this._Dic_Modulo_Codigo = _Dic_Modulo_Codigo;
            this._Dic_Modulo_Nombre = _Dic_Modulo_Nombre;
            this._Filtro_Nombre = _Filtro_Nombre;
            this._archivo_recursos = _archivo_recursos;
            this._Menu_Dic_Con_Elemento_Id = _Menu_Dic_Con_Elemento_Id;
            this._Menu_Dic_Con_Elemento_Nombre = _Menu_Dic_Con_Elemento_Nombre;
            this._Menu_Dic_Rotulo_Id = _Menu_Dic_Rotulo_Id;
            this._Menu_Dic_Rotulo_Nombre = _Menu_Dic_Rotulo_Nombre;
            this._Menu_Ver_Etiqueta_Nombre = _Menu_Ver_Etiqueta_Nombre;
        }
    }
}
