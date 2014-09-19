using System.Web.UI;
using System.Web.UI.WebControls;

namespace HER
{
    public class Etiquetas
    {
        public static string NombreFisicoContenedor;

        public static string Titulo(string posicion)
        {
            switch(NombreFisicoContenedor)
            {
                case "Dic_Modulo_BL":
                    switch(posicion)
                    {
                        case "01":
                            return "Detalles del módulo.";
                        case "02":
                            return "Listado de módulos.";    
                    }
                    break;
                case "Dic_Objeto":
                    switch (posicion)
                    {
                        case "01":
                            return "Elige un módulo:";
                        case "02":
                            return "Detalles del objeto.";
                        case "03":
                            return "Lista de objetos.";
                    }
                    break;
                case "Dic_Modulo":
                    switch (posicion)
                    {
                        case "01":
                            return "Detalle del modulo seleccionado.";
                        case "02":
                            return "Lista de modulos disponibles.";
                    }
                    break;
            }
            return null;
        }

        public static void NombreFisico(Page contenedor)
        {
            TemplateControl tc = (TemplateControl)contenedor;
            string pathPagina = tc.AppRelativeVirtualPath;
            int inicio = pathPagina.LastIndexOf('/');
            int fin = pathPagina.LastIndexOf('.');
            NombreFisicoContenedor =pathPagina.Substring(inicio + 1, fin - inicio - 1);
        }

        public static void Rotular(Page contenedor)
        {
            NombreFisico(contenedor);
            Control cMasterPage = contenedor.Controls[0];
            Control cForm = cMasterPage.FindControl("form1");
            Control cContenido = cForm.FindControl("MainContent");
            
            foreach (Control control in cContenido.Controls)
            {
                if(control is Label)
                {
                    Label lblControl = (Label) control;
                    Rotular(lblControl);
                } 
            }
        }

        private static void Rotular(Label control)
        {
            string Id = control.ID;
            if(Id.StartsWith("lblT"))
            {
                string posicion = Id.Substring(4, 2);
                control.Text = Titulo(posicion);
            }
        }
    }
}