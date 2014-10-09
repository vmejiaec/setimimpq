using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace FEL.PLA
{
    public partial class BO_Pla_Poa
    {
        // Insert_Con_Pla_Mov_SaldoInicialINT
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert_Con_Pla_Mov_SaldoInicialINT(Pla_Poa n)
        {
            Scope s = new Scope();
            int res =
                Adapter.Pla_Poa_Insert_Con_Pla_Mov_SaldoInicialINT(s, n.Codigo, n.Pla_Tarea_Id, n.Pla_Partida_Id, n.Valor_Inicial, n.Estado);
            return res;
        }
    }
}
