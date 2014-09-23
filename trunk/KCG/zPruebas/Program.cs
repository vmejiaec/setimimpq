using zGeneraClases;

namespace zPruebas
{
    // No olvide correr la plantilla generaCEL.tt para actualizar las capas
    // luego de que haya generado las entidades AEL
    class Program
    {
        static void Main(string[] args)
        {
            //Parámetros 
            string PathXSD = @"C:\IMPQ\Code\KApu_01\WEB\ADL\Planificacion.xsd";
            string NameSpace = "AEL.PLA";
            ExtraeMetaDatos datos = new ExtraeMetaDatos(PathXSD);
            Generador gen = new Generador();
            gen.CrearClasesAEL(datos, NameSpace);
        }
    }
}
