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
                Adapter.Pla_Poa_Insert_Con_Pla_Mov_SaldoInicialINT
                    (s, n.Codigo, n.Pla_Tarea_Id, n.Pla_Partida_Id, n.Valor_Inicial, n.Estado);
            return res;
        }

        // Update_Con_Pla_Mov_SaldoInicialINT
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Update_Con_Pla_Mov_SaldoInicialINT(Pla_Poa o, Pla_Poa n)
        {
            Scope s = new Scope();
            int res =
                Adapter.Pla_Poa_Update_Con_Pla_Mov_SaldoInicialINT(s, n.Codigo, n.Pla_Tarea_Id, n.Pla_Partida_Id, n.Estado, o.Id, o.Codigo, o.Pla_Tarea_Id, o.Pla_Partida_Id, o.Estado, o.Id, n.Valor_Inicial);
            return res;
        }
        // Delete para borrar Doc y Mov antes del POA
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete_Con_Pla_Mov_y_Pla_DocINT(Pla_Poa o)
        {
            Scope s = new Scope();
            int res =
                Adapter.Pla_Poa_Delete_Con_Pla_Mov_y_Pla_DocINT
                    (s,o.Id, o.Codigo, o.Pla_Tarea_Id, o.Pla_Partida_Id, o.Estado);
            return res;
        }
    }

}
