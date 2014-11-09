using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;
using CEL.PLA;

namespace REL.PLA
{
    public class REL_Pla_Poa: AEL.PLA.Pla_Poa
    {
        // Constructor para transformar el padre en un nuevo hijo
        public REL_Pla_Poa(AEL.PLA.Pla_Poa o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Pla_Tarea_Id = o.Pla_Tarea_Id;
            this.Pla_Partida_Id = o.Pla_Partida_Id;
            this.Estado = o.Estado;
            this.Pla_Tarea_Codigo = o.Pla_Tarea_Codigo;
            this.Pla_Tarea_Nombre = o.Pla_Tarea_Nombre;
            this.Pla_Cta_Id = o.Pla_Cta_Id;
            this.Pla_Cta_Codigo = o.Pla_Cta_Codigo;
            this.Pla_Cta_Nombre = o.Pla_Cta_Nombre;
            this.Pla_Partida_Codigo = o.Pla_Partida_Codigo;
            this.Pla_Partida_Nombre = o.Pla_Partida_Nombre;
            this.Valor_Inicial = o.Valor_Inicial;
            this.Valor_Suma = o.Valor_Suma;
            this.Valor_Suma_Movs_Reasignacion = o.Valor_Suma_Movs_Reasignacion;
            this.Valor_Suma_Certificados = o.Valor_Suma_Certificados;
        }
    }
}
