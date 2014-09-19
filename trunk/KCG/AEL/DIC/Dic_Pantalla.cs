
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
    public class Dic_Pantalla : Entidad
    {
        // Atributos
        private String _Dic_Rotulo_Id;
        private String _Tool_Dic_Rotulo_Id;
        private String _Dic_Rotulo_Codigo;
        private String _Dic_Rotulo_nombre;
        private String _Tool_Dic_Rotulo_Codigo;
        private String _Tool_Dic_Rotulo_nombre;
        private String _estado_nombre;
        private String _Ver_Etiqueta_nombre;
        private String _Tool_Ver_Etiqueta_nombre;

        // Propiedades de la clase
        public String Dic_Rotulo_Id
        {
            get { return _Dic_Rotulo_Id; }
            set { _Dic_Rotulo_Id = value; }
        }

        public String Tool_Dic_Rotulo_Id
        {
            get { return _Tool_Dic_Rotulo_Id; }
            set { _Tool_Dic_Rotulo_Id = value; }
        }

        public String Dic_Rotulo_Codigo
        {
            get { return _Dic_Rotulo_Codigo; }
            set { _Dic_Rotulo_Codigo = value; }
        }

        public String Dic_Rotulo_nombre
        {
            get { return _Dic_Rotulo_nombre; }
            set { _Dic_Rotulo_nombre = value; }
        }

        public String Tool_Dic_Rotulo_Codigo
        {
            get { return _Tool_Dic_Rotulo_Codigo; }
            set { _Tool_Dic_Rotulo_Codigo = value; }
        }

        public String Tool_Dic_Rotulo_nombre
        {
            get { return _Tool_Dic_Rotulo_nombre; }
            set { _Tool_Dic_Rotulo_nombre = value; }
        }

        public String estado_nombre
        {
            get { return _estado_nombre; }
            set { _estado_nombre = value; }
        }

        public String Ver_Etiqueta_nombre
        {
            get { return _Ver_Etiqueta_nombre; }
            set { _Ver_Etiqueta_nombre = value; }
        }

        public String Tool_Ver_Etiqueta_nombre
        {
            get { return _Tool_Ver_Etiqueta_nombre; }
            set { _Tool_Ver_Etiqueta_nombre = value; }
        }

        // Constructor
        public Dic_Pantalla()
        {
        }
        public Dic_Pantalla(String _Id, String _Codigo, String _Nombre, String _Estado, String _Dic_Rotulo_Id, String _Tool_Dic_Rotulo_Id, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_nombre, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_nombre, String _estado_nombre, String _Ver_Etiqueta_nombre, String _Tool_Ver_Etiqueta_nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Dic_Rotulo_Id = _Dic_Rotulo_Id;
            this._Tool_Dic_Rotulo_Id = _Tool_Dic_Rotulo_Id;
            this._Dic_Rotulo_Codigo = _Dic_Rotulo_Codigo;
            this._Dic_Rotulo_nombre = _Dic_Rotulo_nombre;
            this._Tool_Dic_Rotulo_Codigo = _Tool_Dic_Rotulo_Codigo;
            this._Tool_Dic_Rotulo_nombre = _Tool_Dic_Rotulo_nombre;
            this._estado_nombre = _estado_nombre;
            this._Ver_Etiqueta_nombre = _Ver_Etiqueta_nombre;
            this._Tool_Ver_Etiqueta_nombre = _Tool_Ver_Etiqueta_nombre;
        }
    }
}
