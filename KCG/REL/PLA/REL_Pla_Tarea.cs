using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace REL.PLA
{
    public class REL_Pla_Tarea: AEL.PLA.Pla_Tarea
    {
        public REL_Pla_Tarea(AEL.PLA.Pla_Tarea o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Pla_Cta_Id = o.Pla_Cta_Id;
            this.Pla_Cta_Codigo = o.Pla_Cta_Codigo;
            this.Pla_Cta_Nombre = o.Pla_Cta_Nombre;
            this.Pla_Cta_Nivel = o.Pla_Cta_Nivel;
            this.Nombre = o.Nombre;
            this.Fecha_Ini = o.Fecha_Ini;
            this.Fecha_Fin = o.Fecha_Fin;
            this.Estado = o.Estado;
            this.Valor_Inicial = o.Valor_Inicial;
            this.Valor_Suma = o.Valor_Suma;
        }
    }
}
