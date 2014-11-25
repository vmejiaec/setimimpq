using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;

namespace REL.COM
{
    public class RO_Com_Contrato_Oferente
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Oferente> GetById(Scope s, int p_Id)
        {
            List<REL_Com_Contrato_Oferente> res = new List<REL_Com_Contrato_Oferente>();
            CEL.COM.DO_Com_Contrato_Oferente adpConOfe = new CEL.COM.DO_Com_Contrato_Oferente();
            var lista = adpConOfe.GetById(s, p_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Oferente(fila));
            }
            return res;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Oferente> GetByCom_Contrato_Id(Scope s, int p_Com_Contrato_Id)
        {
            List<REL_Com_Contrato_Oferente> res = new List<REL_Com_Contrato_Oferente>();
            CEL.COM.DO_Com_Contrato_Oferente adpConOfe = new CEL.COM.DO_Com_Contrato_Oferente();
            var lista = adpConOfe.GetByCom_Contrato_Id(s, p_Com_Contrato_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Oferente(fila));
            }
            return res;
        }
    }
}
