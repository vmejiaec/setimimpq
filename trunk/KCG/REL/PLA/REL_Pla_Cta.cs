using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;
using CEL.PLA;

namespace REL.PLA
{
    public class REL_Pla_Cta : AEL.PLA.Pla_Cta
    {
        // Constructor para transformar el padre en el hijo
        public REL_Pla_Cta(AEL.PLA.Pla_Cta o)
        {
            this.Id = o.Id;
            this.Anio = o.Anio;
            this.Codigo = o.Codigo;
            this.Nivel = o.Nivel;
            this.Nombre = o.Nombre;
            this.Descripcion = o.Descripcion;
            this.Estado = o.Estado;
        }
    }
}
