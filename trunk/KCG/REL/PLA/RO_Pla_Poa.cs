using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;
using CEL.PLA;

namespace REL.PLA
{
    public class RO_Pla_Poa
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Pla_Poa> GetByAnio(Scope s, string p_Anio)
        {
            DO_Pla_Poa adp = new DO_Pla_Poa();
            List<REL_Pla_Poa> res = new List<REL_Pla_Poa>();
            var lista = adp.GetByAnio(s,p_Anio);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Poa(fila));
            }
            return res;
        }
    }
}
