using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BEL;

namespace CEL.VAR
{
    public class DO_Pla_Cta_Rep_Niveles
    {
        ADL.VariosTableAdapters.Pla_Cta_Rep_NivelesTableAdapter ta = new ADL.VariosTableAdapters.Pla_Cta_Rep_NivelesTableAdapter();

        public List<AEL.VAR.Pla_Cta_Rep_Niveles> GetByAnio(Scope s, string p_Anio)
        {
            List<AEL.VAR.Pla_Cta_Rep_Niveles> res = new List<AEL.VAR.Pla_Cta_Rep_Niveles>();            
            var lista = ta.Get(p_Anio);
            foreach (var fila in lista)
            {
                res.Add( new AEL.VAR.Pla_Cta_Rep_Niveles(
                    fila.Id,
                    fila.Codigo,
                    fila.Nivel01,
                    fila.Nivel02,
                    fila.Nivel03,
                    fila.Nivel04,
                    fila.Nombre,
                    fila.Fecha_Ini,
                    fila.Fecha_Fin,
                    fila.Estado,
                    fila.Valor_Inicial,
                    fila.Valor_Suma,
                    fila.Valor_Suma_Movs_Reasignacion,
                    fila.Valor_Suma_Movs_Certificados
                    )
                );
            }
            return res;
        }
    }
}
