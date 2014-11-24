using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BEL;
using System.ComponentModel;

namespace REL.PLA
{
    public class RO_Pla_Cta
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Pla_Cta> GetByAnioArbolPla_Tarea_Id(Scope s, int p_Pla_Tarea_Id)
        {
            List<REL_Pla_Cta> res = new List<REL_Pla_Cta>();
            CEL.PLA.DO_Pla_Cta adpCta = new CEL.PLA.DO_Pla_Cta();
            var lista = adpCta.GetByAnioArbolPla_Tarea_Id(s, p_Pla_Tarea_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Cta(fila));
            }
            return res;
        }
    }
}
