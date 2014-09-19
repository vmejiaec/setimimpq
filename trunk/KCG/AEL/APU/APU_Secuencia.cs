using System;
using System.Collections.Generic;
using System.Text;

namespace AEL.APU
{
    public class APU_Secuencia : Entidad
    {
        // Atributos
        private String _Secuencia;

        // Propiedades de la clase
        public String Secuencia
        {
            get { return _Secuencia; }
            set { _Secuencia = value; }
        }
        // Constructor
        public APU_Secuencia()
        {
        }
        public APU_Secuencia(
            //String _Id, String _Codigo, String _Nombre, String _Estado, 
            String _Secuencia)
        {
            this._Secuencia=_Secuencia;
        }
    }
}
