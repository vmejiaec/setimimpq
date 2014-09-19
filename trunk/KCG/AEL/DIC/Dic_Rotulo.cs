
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
    public class Dic_Rotulo : Entidad
    {
        // Atributos
        private String _Estado_nombre;

        // Propiedades de la clase
        public String Estado_nombre
        {
            get { return _Estado_nombre; }
            set { _Estado_nombre = value; }
        }

        // Constructor
        public Dic_Rotulo()
        {
        }
        public Dic_Rotulo(String _Id, String _Codigo, String _Nombre, String _Estado, String _Estado_nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Estado_nombre = _Estado_nombre;
        }
    }
}