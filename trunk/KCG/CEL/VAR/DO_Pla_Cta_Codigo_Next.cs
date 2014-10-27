using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CEL.VAR
{
    public class DO_Pla_Cta_Codigo_Next
    {
        ADL.VariosTableAdapters.Pla_Cta_Codigo_NextTableAdapter adp = new ADL.VariosTableAdapters.Pla_Cta_Codigo_NextTableAdapter();

        public List<AEL.VAR.Pla_Cta_Codigo_Next> GetByAnioCodigo(string p_Anio, string p_Codigo)
        {
            List<AEL.VAR.Pla_Cta_Codigo_Next> res = new List<AEL.VAR.Pla_Cta_Codigo_Next>();
            var lista = adp.GetaByAnioCodigo(p_Anio, p_Codigo);
            foreach (var fila in lista)
            {
                res.Add( new AEL.VAR.Pla_Cta_Codigo_Next(
                    fila.Codigo,
                    fila.Cta_Bro_Next,
                    fila.Nivel_Bro,
                    fila.Cta_Son_Next,
                    fila.Nivel_Son
                    )
                );
            }
            return res;
        }

        public List<AEL.VAR.Pla_Cta_Codigo_Next> GetByAnio_Cta_Id(string p_Anio, int p_Pla_Cta_Id)
        {
            List<AEL.VAR.Pla_Cta_Codigo_Next> res = new List<AEL.VAR.Pla_Cta_Codigo_Next>();
            var lista = adp.GetByAnio_Cta_Id(p_Anio,p_Pla_Cta_Id);
            foreach (var fila in lista)
            {
                res.Add(new AEL.VAR.Pla_Cta_Codigo_Next(
                    fila.Codigo,
                    fila.Cta_Bro_Next,
                    fila.Nivel_Bro,
                    fila.Cta_Son_Next,
                    fila.Nivel_Son
                    )
                );
            }
            return res;
        }
    }
}
