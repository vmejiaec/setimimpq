using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
    public class Par_Filtro : Entidad
    {
        // Atributos
        private String _Int_Usuario_Id;
        private String _Dic_con_Campo_Id;
        private String _Int_Usuario_Codigo;
        private String _Int_Usuario_Nombre;
        private String _Dic_con_campo_Codigo;
        private String _Dic_con_campo_Nombre;
        private String _estado_Nombre;
        private String _Dic_con_Objeto_Id;
        private String _Dic_con_objeto_codigo;
        private String _Dic_con_objeto_nombre;
        private String _Dic_Campo_Id;
        private String _Dic_Campo_Codigo;
        private String _Dic_Campo_Nombre;
        private String _Dic_rotulo_id;
        private String _Dic_Rotulo_Codigo;
        private String _Dic_Rotulo_Nombre;
        private String _Tool_dic_rotulo_id;
        private String _Tool_Dic_Rotulo_Codigo;
        private String _Tool_Dic_Rotulo_Nombre;
        private String _Dic_Campo_Tipo_dato;
        private String _Dic_Campo_Tipo_constraint;
        private String _Visible;
        private String _Dic_Campo_Filtro;
        private String _Ver_etiqueta_Nombre;

        // Propiedades de la clase
        public String Int_Usuario_Id
        {
            get { return _Int_Usuario_Id; }
            set { _Int_Usuario_Id = value; }
        }

        public String Dic_con_Campo_Id
        {
            get { return _Dic_con_Campo_Id; }
            set { _Dic_con_Campo_Id = value; }
        }

        public String Int_Usuario_Codigo
        {
            get { return _Int_Usuario_Codigo; }
            set { _Int_Usuario_Codigo = value; }
        }

        public String Int_Usuario_Nombre
        {
            get { return _Int_Usuario_Nombre; }
            set { _Int_Usuario_Nombre = value; }
        }

        public String Dic_con_campo_Codigo
        {
            get { return _Dic_con_campo_Codigo; }
            set { _Dic_con_campo_Codigo = value; }
        }

        public String Dic_con_campo_Nombre
        {
            get { return _Dic_con_campo_Nombre; }
            set { _Dic_con_campo_Nombre = value; }
        }

        public String estado_Nombre
        {
            get { return _estado_Nombre; }
            set { _estado_Nombre = value; }
        }

        public String Dic_con_Objeto_Id
        {
            get { return _Dic_con_Objeto_Id; }
            set { _Dic_con_Objeto_Id = value; }
        }

        public String Dic_con_objeto_codigo
        {
            get { return _Dic_con_objeto_codigo; }
            set { _Dic_con_objeto_codigo = value; }
        }

        public String Dic_con_objeto_nombre
        {
            get { return _Dic_con_objeto_nombre; }
            set { _Dic_con_objeto_nombre = value; }
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

        public String Dic_rotulo_id
        {
            get { return _Dic_rotulo_id; }
            set { _Dic_rotulo_id = value; }
        }

        public String Dic_Rotulo_Codigo
        {
            get { return _Dic_Rotulo_Codigo; }
            set { _Dic_Rotulo_Codigo = value; }
        }

        public String Dic_Rotulo_Nombre
        {
            get { return _Dic_Rotulo_Nombre; }
            set { _Dic_Rotulo_Nombre = value; }
        }

        public String Tool_dic_rotulo_id
        {
            get { return _Tool_dic_rotulo_id; }
            set { _Tool_dic_rotulo_id = value; }
        }

        public String Tool_Dic_Rotulo_Codigo
        {
            get { return _Tool_Dic_Rotulo_Codigo; }
            set { _Tool_Dic_Rotulo_Codigo = value; }
        }

        public String Tool_Dic_Rotulo_Nombre
        {
            get { return _Tool_Dic_Rotulo_Nombre; }
            set { _Tool_Dic_Rotulo_Nombre = value; }
        }

        public String Dic_Campo_Tipo_dato
        {
            get { return _Dic_Campo_Tipo_dato; }
            set { _Dic_Campo_Tipo_dato = value; }
        }

        public String Dic_Campo_Tipo_constraint
        {
            get { return _Dic_Campo_Tipo_constraint; }
            set { _Dic_Campo_Tipo_constraint = value; }
        }

        public String Visible
        {
            get { return _Visible; }
            set { _Visible = value; }
        }

        public String Dic_Campo_Filtro
        {
            get { return _Dic_Campo_Filtro; }
            set { _Dic_Campo_Filtro = value; }
        }

        public String Ver_etiqueta_Nombre
        {
            get { return _Ver_etiqueta_Nombre; }
            set { _Ver_etiqueta_Nombre = value; }
        }

        // Constructor
        public Par_Filtro()
        {
        }
        public Par_Filtro(String _Id, String _Codigo, String _Estado, String _Int_Usuario_Id, String _Dic_con_Campo_Id, String _Int_Usuario_Codigo, String _Int_Usuario_Nombre, String _Dic_con_campo_Codigo, String _Dic_con_campo_Nombre, String _estado_Nombre, String _Dic_con_Objeto_Id, String _Dic_con_objeto_codigo, String _Dic_con_objeto_nombre, String _Dic_Campo_Id, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Dic_rotulo_id, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_Nombre, String _Tool_dic_rotulo_id, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_Nombre, String _Dic_Campo_Tipo_dato, String _Dic_Campo_Tipo_constraint, String _Visible, String _Dic_Campo_Filtro, String _Ver_etiqueta_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Int_Usuario_Id = _Int_Usuario_Id;
            this._Dic_con_Campo_Id = _Dic_con_Campo_Id;
            this._Int_Usuario_Codigo = _Int_Usuario_Codigo;
            this._Int_Usuario_Nombre = _Int_Usuario_Nombre;
            this._Dic_con_campo_Codigo = _Dic_con_campo_Codigo;
            this._Dic_con_campo_Nombre = _Dic_con_campo_Nombre;
            this._estado_Nombre = _estado_Nombre;
            this._Dic_con_Objeto_Id = _Dic_con_Objeto_Id;
            this._Dic_con_objeto_codigo = _Dic_con_objeto_codigo;
            this._Dic_con_objeto_nombre = _Dic_con_objeto_nombre;
            this._Dic_Campo_Id = _Dic_Campo_Id;
            this._Dic_Campo_Codigo = _Dic_Campo_Codigo;
            this._Dic_Campo_Nombre = _Dic_Campo_Nombre;
            this._Dic_rotulo_id = _Dic_rotulo_id;
            this._Dic_Rotulo_Codigo = _Dic_Rotulo_Codigo;
            this._Dic_Rotulo_Nombre = _Dic_Rotulo_Nombre;
            this._Tool_dic_rotulo_id = _Tool_dic_rotulo_id;
            this._Tool_Dic_Rotulo_Codigo = _Tool_Dic_Rotulo_Codigo;
            this._Tool_Dic_Rotulo_Nombre = _Tool_Dic_Rotulo_Nombre;
            this._Dic_Campo_Tipo_dato = _Dic_Campo_Tipo_dato;
            this._Dic_Campo_Tipo_constraint = _Dic_Campo_Tipo_constraint;
            this._Visible = _Visible;
            this._Dic_Campo_Filtro = _Dic_Campo_Filtro;
            this._Ver_etiqueta_Nombre = _Ver_etiqueta_Nombre;
        }
    }
}
