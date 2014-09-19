
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
    public class Par_Razon_Social : Entidad
    {
        // Atributos
        private String _Par_Tipo_Identificacion_Id;
        private String _Numero;
        private String _Nombre_Comercial;
        private String _Int_Empresa_Id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Par_Tipo_Identificacion_Codigo;
        private String _Par_Tipo_Identificacion_Nombre;
        private String _Par_Tipo_Identificacion_Cedula;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Par_Tipo_Identificacion_Id
        {
            get { return _Par_Tipo_Identificacion_Id; }
            set { _Par_Tipo_Identificacion_Id = value; }
        }

        public String Numero
        {
            get { return _Numero; }
            set { _Numero = value; }
        }

        public String Nombre_Comercial
        {
            get { return _Nombre_Comercial; }
            set { _Nombre_Comercial = value; }
        }

        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
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

        public String Par_Tipo_Identificacion_Codigo
        {
            get { return _Par_Tipo_Identificacion_Codigo; }
            set { _Par_Tipo_Identificacion_Codigo = value; }
        }

        public String Par_Tipo_Identificacion_Nombre
        {
            get { return _Par_Tipo_Identificacion_Nombre; }
            set { _Par_Tipo_Identificacion_Nombre = value; }
        }

        public String Par_Tipo_Identificacion_Cedula
        {
            get { return _Par_Tipo_Identificacion_Cedula; }
            set { _Par_Tipo_Identificacion_Cedula = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Par_Razon_Social()
        {
        }

        public Par_Razon_Social(String _Id, String _Codigo, String _Nombre, String _Estado, String _Par_Tipo_Identificacion_Id, String _Numero, String _Nombre_Comercial, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Par_Tipo_Identificacion_Codigo, String _Par_Tipo_Identificacion_Nombre, String _Par_Tipo_Identificacion_Cedula, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Par_Tipo_Identificacion_Id = _Par_Tipo_Identificacion_Id;
            this._Numero = _Numero;
            this._Nombre_Comercial = _Nombre_Comercial;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Par_Tipo_Identificacion_Codigo = _Par_Tipo_Identificacion_Codigo;
            this._Par_Tipo_Identificacion_Nombre = _Par_Tipo_Identificacion_Nombre;
            this._Par_Tipo_Identificacion_Cedula = _Par_Tipo_Identificacion_Cedula;
            this._Estado_Nombre = _Estado_Nombre;
        }

        public Par_Razon_Social(Par_Razon_Social o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Par_Tipo_Identificacion_Id = o.Par_Tipo_Identificacion_Id;
            this._Numero = o.Numero;
            this._Nombre_Comercial = o.Nombre_Comercial;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Par_Tipo_Identificacion_Codigo = o.Par_Tipo_Identificacion_Codigo;
            this._Par_Tipo_Identificacion_Nombre = o.Par_Tipo_Identificacion_Nombre;
            this._Par_Tipo_Identificacion_Cedula = o.Par_Tipo_Identificacion_Cedula;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
