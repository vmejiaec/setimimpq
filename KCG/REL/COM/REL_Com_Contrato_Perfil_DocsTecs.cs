using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AEL.COM;

namespace REL.COM
{
    public class REL_Com_Contrato_Perfil_DocsTecs : AEL.COM.Com_Contrato_DocTec
    {
        // Atributos adicionales
        // Constructor
        public REL_Com_Contrato_Perfil_DocsTecs(Com_Contrato_DocTec o)
        {
            this.Id = o.Id;
            this.Com_Contrato_Id = o.Com_Contrato_Id;
            this.Nombre = o.Nombre;
            this.Tiene = o.Tiene;
        }
    }
}
