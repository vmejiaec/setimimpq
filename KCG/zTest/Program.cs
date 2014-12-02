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
            DocWord doc = new DocWord(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACIÓN.docx", @"..\..\CONTRATONUEVO01.docx");
            Dictionary<string, string> datos = new Dictionary<string, string>();
            
            datos.Add("m_Codigo_Sercop", "0000-000-00-01");
            datos.Add("m_Contratista_Nombre", "Víctor Mejía");
            datos.Add("m_Contratista_RUC", "1234565464-0001");
            datos.Add("m_Contrato_Plazo", "60");
            datos.Add("m_Contrato_Plazo_Letras", "SESENTA");
            datos.Add("m_Proyecto_Nombre", "MANTENIMIENTO PERFECTIVO.");

            doc.ReemplazarMarcas(datos);
            doc.SaveDocument();
            doc.CloseDocument();
            //decimal numero = 900909009.09m;
            //EscribirEnteroALetras ALetras = new EscribirEnteroALetras();
            //string sNumero = ALetras.FormatoParaContrato(numero);
        }
    }
}
