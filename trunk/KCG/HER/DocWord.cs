using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Core;
using Word = Microsoft.Office.Interop.Word;
using System.Reflection;
using System.IO;

namespace HER
{
    public class DocWord
    {
        //DocWord doc = new DocWord();
        //Dictionary<string, string> datos = new Dictionary<string, string>();            
        //datos.Add("m_Contratista_Nombre", "Víctor Mejía");
        //datos.Add("m_Contrato_Plazo", "60");
        //datos.Add("m_Contrato_Plazo_Letras", "SESENTA");
        //datos.Add("m_Proyecto_Nombre", "MANTENIMIENTO PERFECTIVO.");
        //doc.GeneraYGuardaNuevoDoc(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACION.docx", @"..\..\CONTRATONUEVO01.docx",datos);
        //
        //var z = doc.RecuperarMarcasPlantilla(@"..\..\WordTemplates\CONTRATODEEJECUCIONDEOBRACOTIZACION.docx");

        // Atributos
        private Word.Application wordApp;
        private Word.Document wordDoc;
        private object missing = Missing.Value;

        public DocWord()
        { }
        
        /// <summary>
        /// Para crear un nuevo documento:
        ///     Plantilla en word con marcas del tipo m_xxx_nn
        ///     Nombre del nuevo documento
        ///     diccionario con los datos a reemplazar las marcas
        /// </summary>
        /// <param name="docPlantilla"></param>
        /// <param name="docNuevo"></param>
        /// <param name="datos"></param>
        public void GeneraYGuardaNuevoDoc(string docPlantilla, string docNuevo, Dictionary<string, string> datos)
        { 
            GeneraNuevoDoc(docPlantilla, docNuevo);
            ReemplazarMarcas(datos);
            SaveDocument();
            CloseDocument();
        }

        /// <summary>
        /// Saca las marcas de una plantilla de Word que 
        /// coincidan con el formato m_xxxx_nn
        /// </summary>
        /// <param name="docPlantilla"></param>
        /// <returns></returns>
        public List<string> RecuperarMarcasPlantilla(string docPlantilla)
        {
            AbrirDoc(docPlantilla);
            var marcas = RecuperarMarcas();
            CloseDocument();
            return marcas;
        }

        void AbrirDoc(string docPlantilla)
        {
            object oDocWord = docPlantilla;
            try
            {
                wordApp = new Word.Application();

                if (File.Exists((string)oDocWord))
                {
                    oDocWord = Path.GetFullPath((string)oDocWord);
                    object readOnly = false;
                    object isVisible = false;
                    wordApp.Visible = false;
                    wordDoc = wordApp.Documents.Open
                        (ref oDocWord, ref missing,
                         ref readOnly, ref missing, ref missing, ref missing,
                         ref missing, ref missing, ref missing, ref missing, ref missing,
                         ref isVisible, ref missing, ref missing, ref missing, ref missing);
                    wordDoc.Activate();
                }
                else
                {
                    throw (new Exception("El archivo no existe."));
                }
            }
            catch (Exception ex)
            {
                throw (new Exception("Error durante el inicio: " + ex.Message));
            }
        }

        void GeneraNuevoDoc(string docPlantilla, string docNuevo)
        {
            object oDocNuevo = docNuevo;
            try
            {
                wordApp = new Word.Application();
                File.Copy(docPlantilla, (string)docNuevo, true);
                if (File.Exists((string)oDocNuevo))
                {
                    oDocNuevo = Path.GetFullPath((string)oDocNuevo);
                    object readOnly = false;
                    object isVisible = false;
                    wordApp.Visible = false;
                    wordDoc = wordApp.Documents.Open
                        (ref oDocNuevo, ref missing,
                         ref readOnly , ref missing, ref missing, ref missing,
                         ref missing  , ref missing, ref missing, ref missing, ref missing, 
                         ref isVisible, ref missing, ref missing, ref missing, ref missing);
                    wordDoc.Activate();
                }
                else
                {
                    throw (new Exception("El archivo no existe."));
                }
            }
            catch (Exception ex)
            {
                throw (new Exception("Error durante el inicio: " + ex.Message));
            }
        }

        void SaveDocument()
        {
            try
            {
                wordDoc.Save();
            }
            catch (Exception ex)
            {
                Console.Out.WriteLine("Error durante el guardado: " + ex.Message);
                
            }
        }

        void CloseDocument()
        {
            object saveChanges = Word.WdSaveOptions.wdSaveChanges;
            wordApp.Quit(ref saveChanges);
        }

        /// <summary>
        /// El formato de las marcas en el Word es m_Abcde_01, m_Abcde_02, etc. 
        /// En la función se quitan los tres últimos dígitos y reemplaza con el texto del diccionario.
        /// </summary>
        /// <param name="datos"></param>
        void ReemplazarMarcas(Dictionary<string, string> datos)
        {
            
            //object mMarcador = "m_Codigo_Sercop_01";
            //wordDoc.Bookmarks[mMarcador].Range.Text = "000-00-00";

            foreach (dynamic m in wordDoc.Bookmarks)
            {
                string marca = m.Name;
                // El formato de una marca en el doc word es m_xxx_01, m_xxx_02, ...
                string marca_sin_numeral = marca.Remove(marca.Length - 3);
                if (datos.ContainsKey(marca_sin_numeral))
                {
                    m.Range.Text = datos[marca_sin_numeral];
                }
            }
        }

        /// <summary>
        /// Las marcas en el doc word deben empezar con "m_"
        /// </summary>
        /// <returns></returns>
        List<string> RecuperarMarcas()
        {
            List<string> marcas = new List<string>();

            foreach (dynamic m in wordDoc.Bookmarks)
            {
                string marca = m.Name;
                // El formato de una marca en el doc word es m_xxx_01, m_xxx_02, ...
                string marca_sin_numeral = marca.Remove(marca.Length - 3);
                if (marca_sin_numeral.StartsWith("m_"))
                {
                    if (!marcas.Exists(x => x.Equals(marca_sin_numeral)))
                        marcas.Add(marca_sin_numeral);
                }
            }

            return marcas;
        }
    }
}
