using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BEL;

namespace REL.COM 
{
    public class REL_Com_Contrato_Oferente : AEL.COM.Com_Contrato_Oferente
    {
        // Atributos adicionales
        string _Pla_Tarea_Nombre;

        public string Pla_Tarea_Nombre
        {
            get { return _Pla_Tarea_Nombre; }
            set { _Pla_Tarea_Nombre = value; }
        }
        string _Pla_Doc_Codigo;

        public string Pla_Doc_Codigo
        {
            get { return _Pla_Doc_Codigo; }
            set { _Pla_Doc_Codigo = value; }
        }

        string _Codigo_Sercop;

        public string Codigo_Sercop
        {
            get { return _Codigo_Sercop; }
            set { _Codigo_Sercop = value; }
        }


        // Constructor
        public REL_Com_Contrato_Oferente(AEL.COM.Com_Contrato_Oferente o)
        {
            this.Id = o.Id;
            this.Nombre = o.Nombre;
            this.Fecha_Recepcion = o.Fecha_Recepcion;
            this.Com_Contrato_Id = o.Com_Contrato_Id;
            this.Per_Personal_Id_Recibe = o.Per_Personal_Id_Recibe;
            this.Comentario = o.Comentario;
            // Consulta la tarea y el código del documento
            CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();
            var listaCon = adpCon.GetById(new Scope(), this.Com_Contrato_Id);
            var filaCon = listaCon[0];
            CEL.PLA.DO_Pla_Doc adpDoc = new CEL.PLA.DO_Pla_Doc();
            var listaDoc = adpDoc.GetById(new Scope(), filaCon.Pla_Doc_Id);
            var filaDoc = listaDoc[0];
            this.Pla_Tarea_Nombre = filaDoc.Pla_Tarea_Nombre;
            this.Pla_Doc_Codigo = filaDoc.Codigo;
            // El código del sercop
            this.Codigo_Sercop = filaCon.Codigo_Sercop;
        }
    }
}
