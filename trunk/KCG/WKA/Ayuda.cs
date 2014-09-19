/*
KOALA SOLUTION 
 
DirectorioAyuda     - directorio para encontrar la Ayuda de un página
                      por medio de un javascript. 
ver 1.0
Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: DirectorioAyuda Asp.Net              
							
NOTAS DE DISEÑO
 * Version 1.0
   - Todo se trata con paths relativos.
   - Los nombres de pagina se corresponden con su página de ayuda.
   - Cuando no haya correspondecia de nombres se puede utilizar 
     el directorio local (_directorio o Directorio).
   
HISTORIA     					 
 * Version 1.0
   - Control de existencia archivo de archivo de ayuda.
   - Se puede configurar path conde esta la ayuda (_directorioRelativoAyuda).
   - Se puede configurar extensión de archivos de ayuada (_extensionFicheroAyuda).

TRABAJO POR REALIZAR
 * Version 1.0
   - El directorio local deberia ser obtenido desde un XML
     para evitar recompilar cuando se tenga una nueva entrada
     en el directorio local y hacer mejor uso de RAM cuando
     el directorio se agrande.

ÚLTIMA FECHA DE MODIFICACIÓN
19-06-2008 10H46
*/


using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;

namespace HER
{
    public class DirectorioAyuda
    {
        private const string _directorioRelativoAyuda = "~/Manuales/";
        private const string _extensionFicheroAyuda = ".htm";

        private const string _formatoJavaScriptExisteAyuda =
            @"javascript:window.open('{0}','_blank','with=800,height=600,toolbar=yes,menubar=yes,resizable=yes,scrollbars=yes,status=yes');return false;";

        private const string _formatoJavaScriptNoExisteAyuda =
            @"return false;";

        //Directorio Local
        private static readonly Dictionary<string, string> _directorio = Inicializar();

        public static Dictionary<string, string> Directorio
        {
            get { return _directorio; }
        }

        private static Dictionary<string, string> Inicializar()
        {
            Dictionary<string, string> directorio = new Dictionary<string, string>();
            directorio.Add("~/Default.aspx", "~/Manuales/GENERAL.htm");
            return directorio;
        }

        public static string ObtenerAyudaScript()
        {
            string pathRelativo = HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath;
            string pathAyuda = ObtenerPathAyuda(pathRelativo);
            string script = _formatoJavaScriptNoExisteAyuda;
            if (pathAyuda != string.Empty)
                script = string.Format(_formatoJavaScriptExisteAyuda, pathAyuda);
            return script;
        }


        public static string ObtenerPathAyuda(string pathRelativoPagina)
        {
            string pathAyuda = ObtenerPathAyudaDeNombre(pathRelativoPagina);
            if (pathAyuda == string.Empty)
                pathAyuda = ObtenerPathAyudaDeDirectorioLocal(pathRelativoPagina);
            return pathAyuda;
        }

        private static string ObtenerPathAyudaDeNombre(string pathRelativoPagina)
        {
            string pathRelativoAyuda =
                _directorioRelativoAyuda + ObtenerNombrePagina(pathRelativoPagina) + _extensionFicheroAyuda;
            return (ExisteFichero(pathRelativoAyuda))
                       ? ((Page) HttpContext.Current.Handler).ResolveClientUrl(pathRelativoAyuda)
                       : string.Empty;
        }

        private static string ObtenerPathAyudaDeDirectorioLocal(string pathRelativoPagina)
        {
            string pathRelativoAyuda;
            _directorio.TryGetValue(pathRelativoPagina, out pathRelativoAyuda);
            return (ExisteFichero(pathRelativoAyuda))
                       ? ((Page) HttpContext.Current.Handler).ResolveClientUrl(pathRelativoAyuda)
                       : string.Empty;
        }

        public static bool ExisteFichero(string pathRelativoFichero)
        {
            if (string.IsNullOrEmpty(pathRelativoFichero)) return false;
            string pathFisicoArchivoAyuda = HttpContext.Current.Server.MapPath(pathRelativoFichero);
            return File.Exists(pathFisicoArchivoAyuda);
        }

        public static string ObtenerNombrePagina(string pathRelativoPagina)
        {
            int indicePunto = pathRelativoPagina.LastIndexOf('.');
            int indiceBackSlash = pathRelativoPagina.LastIndexOf('/');
            return pathRelativoPagina.Substring(indiceBackSlash + 1, indicePunto - indiceBackSlash - 1);
        }
    }
}