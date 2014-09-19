
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
    public class Dic_Con_Objeto : Entidad
    {
        // Atributos
        private String _Dic_Contenedor_Id;
        private String _Dic_Objeto_Id;
        private Int32 _Orden;
        private String _INS;
        private String _UPD;
        private String _DEL;
        private Int32 _Maximo;
        private String _Dic_Contenedor_Codigo;
        private String _Dic_Contenedor_Nombre;
        private String _Dic_Objeto_Codigo;
        private String _Dic_Objeto_Nombre;
        private String _Contenedor_Dic_Modulo_Id;
        private String _Contenedor_Dic_Modulo_Codigo;
        private String _Contenedor_Dic_Modulo_Nombre;
        private String _Objeto_Dic_Modulo_Id;
        private String _Objeto_Dic_Modulo_Codigo;
        private String _Objeto_Dic_Modulo_Nombre;
        private String _Ins_Nombre;
        private String _Upd_Nombre;
        private String _Del_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Dic_Contenedor_Id
        {
            get { return _Dic_Contenedor_Id; }
            set { _Dic_Contenedor_Id = value; }
        }

        public String Dic_Objeto_Id
        {
            get { return _Dic_Objeto_Id; }
            set { _Dic_Objeto_Id = value; }
        }

        public Int32 Orden
        {
            get { return _Orden; }
            set { _Orden = value; }
        }

        public String INS
        {
            get { return _INS; }
            set { _INS = value; }
        }

        public String UPD
        {
            get { return _UPD; }
            set { _UPD = value; }
        }

        public String DEL
        {
            get { return _DEL; }
            set { _DEL = value; }
        }

        public Int32 Maximo
        {
            get { return _Maximo; }
            set { _Maximo = value; }
        }

        public String Dic_Contenedor_Codigo
        {
            get { return _Dic_Contenedor_Codigo; }
            set { _Dic_Contenedor_Codigo = value; }
        }

        public String Dic_Contenedor_Nombre
        {
            get { return _Dic_Contenedor_Nombre; }
            set { _Dic_Contenedor_Nombre = value; }
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

        public String Contenedor_Dic_Modulo_Id
        {
            get { return _Contenedor_Dic_Modulo_Id; }
            set { _Contenedor_Dic_Modulo_Id = value; }
        }

        public String Contenedor_Dic_Modulo_Codigo
        {
            get { return _Contenedor_Dic_Modulo_Codigo; }
            set { _Contenedor_Dic_Modulo_Codigo = value; }
        }

        public String Contenedor_Dic_Modulo_Nombre
        {
            get { return _Contenedor_Dic_Modulo_Nombre; }
            set { _Contenedor_Dic_Modulo_Nombre = value; }
        }

        public String Objeto_Dic_Modulo_Id
        {
            get { return _Objeto_Dic_Modulo_Id; }
            set { _Objeto_Dic_Modulo_Id = value; }
        }

        public String Objeto_Dic_Modulo_Codigo
        {
            get { return _Objeto_Dic_Modulo_Codigo; }
            set { _Objeto_Dic_Modulo_Codigo = value; }
        }

        public String Objeto_Dic_Modulo_Nombre
        {
            get { return _Objeto_Dic_Modulo_Nombre; }
            set { _Objeto_Dic_Modulo_Nombre = value; }
        }

        public String Ins_Nombre
        {
            get { return _Ins_Nombre; }
            set { _Ins_Nombre = value; }
        }

        public String Upd_Nombre
        {
            get { return _Upd_Nombre; }
            set { _Upd_Nombre = value; }
        }

        public String Del_Nombre
        {
            get { return _Del_Nombre; }
            set { _Del_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Dic_Con_Objeto()
        {
        }

        public Dic_Con_Objeto(String _Id, String _Codigo, String _Nombre, String _Estado, String _Dic_Contenedor_Id, String _Dic_Objeto_Id, Int32 _Orden, String _INS, String _UPD, String _DEL, Int32 _Maximo, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Contenedor_Dic_Modulo_Id, String _Contenedor_Dic_Modulo_Codigo, String _Contenedor_Dic_Modulo_Nombre, String _Objeto_Dic_Modulo_Id, String _Objeto_Dic_Modulo_Codigo, String _Objeto_Dic_Modulo_Nombre, String _Ins_Nombre, String _Upd_Nombre, String _Del_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Dic_Contenedor_Id = _Dic_Contenedor_Id;
            this._Dic_Objeto_Id = _Dic_Objeto_Id;
            this._Orden = _Orden;
            this._INS = _INS;
            this._UPD = _UPD;
            this._DEL = _DEL;
            this._Maximo = _Maximo;
            this._Dic_Contenedor_Codigo = _Dic_Contenedor_Codigo;
            this._Dic_Contenedor_Nombre = _Dic_Contenedor_Nombre;
            this._Dic_Objeto_Codigo = _Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = _Dic_Objeto_Nombre;
            this._Contenedor_Dic_Modulo_Id = _Contenedor_Dic_Modulo_Id;
            this._Contenedor_Dic_Modulo_Codigo = _Contenedor_Dic_Modulo_Codigo;
            this._Contenedor_Dic_Modulo_Nombre = _Contenedor_Dic_Modulo_Nombre;
            this._Objeto_Dic_Modulo_Id = _Objeto_Dic_Modulo_Id;
            this._Objeto_Dic_Modulo_Codigo = _Objeto_Dic_Modulo_Codigo;
            this._Objeto_Dic_Modulo_Nombre = _Objeto_Dic_Modulo_Nombre;
            this._Ins_Nombre = _Ins_Nombre;
            this._Upd_Nombre = _Upd_Nombre;
            this._Del_Nombre = _Del_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }
        
        public Dic_Con_Objeto(Dic_Con_Objeto o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Dic_Contenedor_Id = o.Dic_Contenedor_Id;
            this._Dic_Objeto_Id = o.Dic_Objeto_Id;
            this._Orden = o.Orden;
            this._INS = o.INS;
            this._UPD = o.UPD;
            this._DEL = o.DEL;
            this._Maximo = o.Maximo;
            this._Dic_Contenedor_Codigo = o.Dic_Contenedor_Codigo;
            this._Dic_Contenedor_Nombre = o.Dic_Contenedor_Nombre;
            this._Dic_Objeto_Codigo = o.Dic_Objeto_Codigo;
            this._Dic_Objeto_Nombre = o.Dic_Objeto_Nombre;
            this._Contenedor_Dic_Modulo_Id = o.Contenedor_Dic_Modulo_Id;
            this._Contenedor_Dic_Modulo_Codigo = o.Contenedor_Dic_Modulo_Codigo;
            this._Contenedor_Dic_Modulo_Nombre = o.Contenedor_Dic_Modulo_Nombre;
            this._Objeto_Dic_Modulo_Id = o.Objeto_Dic_Modulo_Id;
            this._Objeto_Dic_Modulo_Codigo = o.Objeto_Dic_Modulo_Codigo;
            this._Objeto_Dic_Modulo_Nombre = o.Objeto_Dic_Modulo_Nombre;
            this._Ins_Nombre = o.Ins_Nombre;
            this._Upd_Nombre = o.Upd_Nombre;
            this._Del_Nombre = o.Del_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
