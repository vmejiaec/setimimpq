using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BEL;

namespace REL.VAR
{
    public class RO_Pla_Cta_Niveles
    {
        public List<REL_Pla_Cta_Niveles> Get(Scope s, string p_Anio)
        { 
            List<REL_Pla_Cta_Niveles> res = new List<REL_Pla_Cta_Niveles>();
            CEL.VAR.DO_Pla_Cta_Rep_Niveles adp = new CEL.VAR.DO_Pla_Cta_Rep_Niveles();
            var lista = adp.GetByAnio(s, p_Anio);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Cta_Niveles(fila));
            }
            return res;
        }
    }
}
