using zGeneraClases;

namespace zPruebas
{
    class Program
    {
        static void Main(string[] args)
        {
            //Parámetros 
            string PathXSD = @"C:\IMPQ\Code\KApu_01\WEB\ADL\Planificacion.xsd";
            string NameSpace = "AEL.PLA";
            bool CrearClasesAEL = false;
            bool CopiarClasesAEL = false;
            // // No olvide correr la plantilla generaCEL.tt para actualizar las capas
            bool CopiarClasesDoEwsFel = true;
            // Proceso CrearClasesAEL
            if (CrearClasesAEL)
            {
                ExtraeMetaDatos datos = new ExtraeMetaDatos(PathXSD);
                Generador gen = new Generador();
                gen.CrearClasesAEL(datos, NameSpace);
            }
            // Proceso CopiarClasesAEL
            if (CopiarClasesAEL)
            { 

            }
            // Proceso CopiarClasesDoEwsFel
            if (CopiarClasesDoEwsFel)
            {

            }
           
        }
    }
}
