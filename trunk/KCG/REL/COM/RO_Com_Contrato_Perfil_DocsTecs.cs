using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;

namespace REL.COM
{
    public class RO_Com_Contrato_Perfil_DocsTecs
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Perfil_DocsTecs> GetById(Scope s, int p_Id)
        {
            List<REL_Com_Contrato_Perfil_DocsTecs> res = new List<REL_Com_Contrato_Perfil_DocsTecs>();
            CEL.COM.DO_Com_Contrato_DocTec adpCon = new CEL.COM.DO_Com_Contrato_DocTec();
            var lista = adpCon.GetById(s, p_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Perfil_DocsTecs(fila));
            }
            return res;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Perfil_DocsTecs> GetByCom_Contrato_Id(Scope s, int p_Com_Contrato_Id)
        {
            List<REL_Com_Contrato_Perfil_DocsTecs> res = new List<REL_Com_Contrato_Perfil_DocsTecs>();
            CEL.COM.DO_Com_Contrato_DocTec adpCon = new CEL.COM.DO_Com_Contrato_DocTec();
            var lista = adpCon.GetByCom_Contrato_Id(s, p_Com_Contrato_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Perfil_DocsTecs(fila));
            }
            return res;
        }
    }
}
