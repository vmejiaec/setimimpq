
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.INT
{
    public class Int_Empresa : Entidad
    {
        // Atributos
        private String _Abreviatura;
        private String _Imagen;
        private String _Descripcion;
        private String _Plan_Cuenta;
        private String _Direccion;
        private String _Estado_Nombre;


        // Propiedades de la clase
        public String Abreviatura
        {
            get { return _Abreviatura; }
            set { _Abreviatura = value; }
        }

        public String Imagen
        {
            get { return _Imagen; }
            set { _Imagen = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Plan_Cuenta
        {
            get { return _Plan_Cuenta; }
            set { _Plan_Cuenta = value; }
        }

        public String Direccion
        {
            get { return _Direccion; }
            set { _Direccion = value; }
        }


        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Int_Empresa()
        {
        }
        public Int_Empresa(String _Id, String _Codigo, String _Nombre, String _Estado, String _Abreviatura, String _Imagen, String _Descripcion, String _Plan_Cuenta, String _Direccion, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Abreviatura = _Abreviatura;
            this._Imagen = _Imagen;
            this._Descripcion = _Descripcion;
            this._Plan_Cuenta = _Plan_Cuenta;
            this._Direccion = _Direccion;
            this._Estado_Nombre = _Estado_Nombre;
        }

        public Int_Empresa(Int_Empresa o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Abreviatura = o.Abreviatura;
            this._Imagen = o.Imagen;
            this._Descripcion = o.Descripcion;
            this._Plan_Cuenta = o.Plan_Cuenta;
            this._Direccion = o.Direccion;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
