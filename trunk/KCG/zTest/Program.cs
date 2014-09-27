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
            Clase1 o = new Clase1(1,"nn","oo");
            Clase1 p = new Clase1(1, "mm", "pp");
            List<Clase1> lista1 = new List<Clase1>();
            lista1.Add(o);
            lista1.Add(p);
            List<cEnt> lista = new List<cEnt>();
            lista.Add(o);
            lista.Add(p);
        }
    }
}
