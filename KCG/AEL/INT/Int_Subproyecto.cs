
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.INT
{
    public class Int_Subproyecto : Entidad
    {
        // Atributos
        private String _Codigo_Institucional;
        private String _SPROY_NOMBRE;

        // Propiedades de la clase
        public String Codigo_Institucional
        {
            get { return _Codigo_Institucional; }
            set { _Codigo_Institucional = value; }
        }

        public String SPROY_NOMBRE
        {
            get { return _SPROY_NOMBRE; }
            set { _SPROY_NOMBRE = value; }
        }

        // Constructor
        public Int_Subproyecto()
        {
        }
        public Int_Subproyecto( String _Codigo_Institucional, String _SPROY_NOMBRE)
        {
            this._Codigo_Institucional = _Codigo_Institucional;
            this._SPROY_NOMBRE = _SPROY_NOMBRE;
        }
        public Int_Subproyecto(Int_Subproyecto o)
        {
            this._Codigo_Institucional = o.Codigo_Institucional;
            this._SPROY_NOMBRE = o.SPROY_NOMBRE;
        }
    }
}
