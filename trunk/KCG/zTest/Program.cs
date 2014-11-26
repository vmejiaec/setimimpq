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
            DocWord doc = new DocWord(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACIÓN.docx", @"..\..\CONTRATONUEVO.docx");
            doc.ReemplazarMarcas();
            doc.SaveDocument();
            doc.CloseDocument();
        }
    }
}
