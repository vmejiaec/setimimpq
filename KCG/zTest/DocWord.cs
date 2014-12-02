using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Core;
using Word = Microsoft.Office.Interop.Word;
using System.Reflection;
using System.IO;

namespace zTest
{
    public class DocWord
    {
        // Atributos
        private Word.Application wordApp;
        private Word.Document wordDoc;
        private object missing = Missing.Value;

        public DocWord(string docPlantilla, string docNuevo)
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

        public void SaveDocument()
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

        public void CloseDocument()
        {
            object saveChanges = Word.WdSaveOptions.wdSaveChanges;
            wordApp.Quit(ref saveChanges);
        }

        /// <summary>
        /// El formato de las marcas en el Word es m_Abcde_01, m_Abcde_02, etc. 
        /// En la función se quitan los tres últimos dígitos y reemplaza con el texto del diccionario.
        /// </summary>
        /// <param name="datos"></param>
        public void ReemplazarMarcas(Dictionary<string, string> datos)
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
    }
}
