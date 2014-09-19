using System;
using System.Collections.Generic;
using System.Text;
using zGeneraClases;
using System.IO;
using System.Reflection;

using ADL.PlanificacionTableAdapters;

namespace zPruebas
{
    class Program
    {
        static void Main(string[] args)
        {
            ExtraeMetaDatos datos = new ExtraeMetaDatos(@"C:\IMPQ\Code\KApu_01\WEB\zPruebas\Planificacion.xsd");
            Generador gen = new Generador();
            gen.CrearClasesAEL(datos, "AEL.PLA");
        }
    }
}
