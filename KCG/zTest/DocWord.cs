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

        public void ReemplazarMarcas()
        {
            object m_Codigo_Sercop = "m_Codigo_Sercop";
            wordDoc.Bookmarks[m_Codigo_Sercop].Range.Text = "000-00-00";
        }
    }
}
