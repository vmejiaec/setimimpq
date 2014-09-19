
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Multa : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Int_Empresa_Id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
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
        public Fis_Multa()
        {
        }
        public Fis_Multa(String _Id, String _Codigo, String _Nombre, String _Estado, String _Descripcion, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Fis_Multa(Fis_Multa o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
