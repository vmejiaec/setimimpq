
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
    public class Par_Retencion : Entidad
    {
        // Atributos
        private String _Int_Empresa_Id;
        private String _Valor;
        private String _Descripcion;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
        }

        public String Valor
        {
            get { return _Valor; }
            set { _Valor = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
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

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Par_Retencion()
        {
        }

        public Par_Retencion(String _Id, String _Codigo, String _Nombre, String _Estado, String _Int_Empresa_Id, String _Valor, String _Descripcion, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Valor = _Valor;
            this._Descripcion = _Descripcion;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }

        public Par_Retencion(Par_Retencion o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Valor = o.Valor;
            this._Descripcion = o.Descripcion;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
