using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace REL.PLA
{
    public class REL_Pla_Mov: AEL.PLA.Pla_Mov
    {
        // Constructor para transformar la clase padre en la hija
        public REL_Pla_Mov(AEL.PLA.Pla_Mov o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Pla_Poa_Id = o.Pla_Poa_Id;
            this.Pla_Doc_Id = o.Pla_Doc_Id;
            this.Orden = o.Orden;
            this.Valor = o.Valor;
            this.Estado = o.Estado;
            this.Tipo = o.Tipo;
            this.Pla_Tarea_Id = o.Pla_Tarea_Id;
            this.Pla_Tarea_Nombre = o.Pla_Tarea_Nombre;
            this.Pla_Partida_Id = o.Pla_Partida_Id;
            this.Pla_Partida_Codigo = o.Pla_Partida_Codigo;
            this.Pla_Partida_Nombre = o.Pla_Partida_Nombre;
            this.Pla_Doc_Tipo = o.Pla_Doc_Tipo;
            this.Pla_Doc_Fecha = o.Pla_Doc_Fecha;
            this.Pla_Doc_Codigo = o.Pla_Doc_Codigo;
        }
    }
}
