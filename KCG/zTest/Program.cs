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
            ADL.PlanificacionTableAdapters.Pla_PartidaTableAdapter adp = new ADL.PlanificacionTableAdapters.Pla_PartidaTableAdapter();

            var res = Convert.ToInt32( adp.InsertINT("333vvv",
                "partida 01",
                "PEN"));

            var res2 = adp.Insert("333vvv",
                "partida 01",
                "PEN");
        }
    }
}
