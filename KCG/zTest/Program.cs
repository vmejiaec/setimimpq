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
            DocWord doc = new DocWord();
            Dictionary<string, string> datos = new Dictionary<string, string>();            
            datos.Add("m_Contratista_Nombre", "Víctor Mejía");
            datos.Add("m_Contrato_Plazo", "60");
            datos.Add("m_Contrato_Plazo_Letras", "SESENTA");
            datos.Add("m_Proyecto_Nombre", "MANTENIMIENTO PERFECTIVO.");
            doc.GeneraYGuardaNuevoDoc(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACION.docx", @"..\..\CONTRATONUEVO01.docx",datos);

            var z = doc.RecuperarMarcasPlantilla(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACION.docx");

            //decimal numero = 900909009.09m;
            //EscribirEnteroALetras ALetras = new EscribirEnteroALetras();
            //string sNumero = ALetras.FormatoParaContrato(numero);
        }
    }
}
