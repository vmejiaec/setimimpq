using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace FEL.VAR
{
    [DataObject]
    public class BO_Pla_Cta_Codigo_Next
    {
        // Select by Id
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Pla_Cta_Codigo_Next> GetByAnio_Cta_Id(Scope s, string p_Anio, int p_Pla_Cta_Id )
        {
            WS_VAR adp = new WS_VAR();
            List<Pla_Cta_Codigo_Next> lista = new List<Pla_Cta_Codigo_Next>(adp.Pla_Cta_Codigo_Next_GetByAnio_Cta_Id(s,p_Anio,p_Pla_Cta_Id));
            return lista;
        }
    }
}
