using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AEL.VAR
{
    public class V_INT_Area
    {
        public string Codigo { get; set; }
        public string Nombre { get; set; }

        public V_INT_Area()
        { }

        public V_INT_Area(string Codigo, string Nombre)
        {
            this.Codigo = Codigo;
            this.Nombre = Nombre;
        }

    }
}
