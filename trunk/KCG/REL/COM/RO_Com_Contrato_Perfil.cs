using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using REL.COM;
using BEL;

namespace REL.COM
{
    public class RO_Com_Contrato_Perfil
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Perfil> GetById(Scope s, int p_Id)
        {
            List<REL_Com_Contrato_Perfil> res = new List<REL_Com_Contrato_Perfil>();
            CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();            
            var lista = adpCon.GetById(s, p_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Perfil(fila));
            }
            return res;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Com_Contrato_Perfil> GetByAnio(Scope s, string p_Anio)
        {
            int iAnio = Int32.Parse(p_Anio);
            DateTime dtFechaIni = new DateTime(iAnio, 1, 1);
            DateTime dtFechaFin = new DateTime(iAnio, 12, 31);
            List<REL_Com_Contrato_Perfil> res = new List<REL_Com_Contrato_Perfil>();
            CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();
            var lista = adpCon.GetByRangoFecha_Crea(s, dtFechaIni, dtFechaFin);
            foreach (var fila in lista)
            {
                res.Add(new REL_Com_Contrato_Perfil(fila));
            }
            return res;
        } 
    }
}
