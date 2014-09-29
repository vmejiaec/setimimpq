using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace zTest
{
    class Program
    {
        static void Main(string[] args)
        {
            CEL.VER.DO_Ver_Etiqueta adp = new CEL.VER.DO_Ver_Etiqueta();
            AEL.VER.Ver_Etiqueta o = new AEL.VER.Ver_Etiqueta();
            o.Nombre = "";
            o.Dic_Rotulo_Id = "";
            o.Ver_Version_Id ="1";
        }
    }
}
