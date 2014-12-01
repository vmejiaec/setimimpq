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
            //DocWord doc = new DocWord(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACIÓN.docx", @"..\..\CONTRATONUEVO.docx");
            //doc.ReemplazarMarcas();
            //doc.SaveDocument();
            //doc.CloseDocument();
            decimal numero = 900909009.09m;
            EscribirEnteroALetras ALetras = new EscribirEnteroALetras();
            string[] sNumero = ALetras.Convertir_Decimal(numero);
        }
    }
}
