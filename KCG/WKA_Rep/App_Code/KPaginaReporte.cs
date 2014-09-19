using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BEL;
using AEL.INT;
using System.Collections.Generic;

namespace WKA_Rep
{
    public class KPaginaReporte : Page
    {
        
       //Índice en Session de Scope
       private const string _SCOPE_SESSION_INDICE = "Scope";

       //Índice en Session de Empresa
       private const string _EMPRESA_SESSION_INDICE = "Empresa";

       //Índice en ViewState de ReporteTitulo
       private const string _REPORTE_TITULO_VIEWSTATE_INDICE = "ReporteTitulo";


       /// <summary>
       /// Ámbito de la aplicación, guarda las variables
       /// necesarias para la ejecución de la aplicación
       /// </summary>
       protected Scope Scope
       {
           get
           {
               object o = Session[_SCOPE_SESSION_INDICE];
               return (o == null) ? null : (Scope)o;
           }
           set
           {
               Session[_SCOPE_SESSION_INDICE] = value;
           }
       }

       /// <summary>
       /// Empresa consultada desde la base con el Id
       /// de empresa del Scope
       /// </summary>
       protected Int_Empresa Empresa
       {
           get
           {
               object o = Session[_EMPRESA_SESSION_INDICE];
               if (o == null)
               {
                   if (Scope == null)
                       return null;
                   if (string.IsNullOrEmpty(Scope.Int_Empresa_Id))
                       return null;
                   o = ObtenerEmpresa(Scope.Int_Empresa_Id);
                   Session[_EMPRESA_SESSION_INDICE] = o;
               }
               return (Int_Empresa)o;
           }
       }


       /// <summary>
       /// Obtiene el path absoluto desde un path relativo, para ser usado
       /// en un reporte. Ej: imagen para un reporte.
       /// </summary>
       /// <param name="pathRelativo">Path relativo</param>
       /// <returns>Path absoluto</returns>
       protected string ObtenerUrlCompleta(string pathRelativo)
       {
           return Request.Url.GetLeftPart(UriPartial.Authority) + ResolveUrl(pathRelativo);
       }


       /// <summary>
       /// Obtiene la empresa
       /// </summary>
       /// <param name="Id">Id de la empresa a obtenerse</param>
       /// <returns>Empresa o null en caso de error en la conexion
       /// o que no exista el Id
       /// </returns>
       
       
       protected Int_Empresa ObtenerEmpresa(string Id)
       {
           REL.INT.RO_Int_Empresa roIntEmpresa = new REL.INT.RO_Int_Empresa();
           List<AEL.INT.Int_Empresa> lstIntEmpresa;
           try
           {
               lstIntEmpresa = roIntEmpresa.GetById_(Scope, Id);
           }
           catch
           {
               return null;
           }
           return (lstIntEmpresa.Count == 0) ? null : lstIntEmpresa[0];
       }

       protected string ReporteTitulo
       {
           get
           {
               object o = ViewState[_REPORTE_TITULO_VIEWSTATE_INDICE];
               return (o == null) ? string.Empty : (string)o;
           }
           set
           {
               ViewState[_REPORTE_TITULO_VIEWSTATE_INDICE] = value;
           }
       }

       protected override void OnInit(EventArgs e)
       {
           if (!IsPostBack)
           {
               Scope s = BEL.Scope_Factory.Get(Request.QueryString);
               Scope = s;
           }
           base.OnInit(e);
       }
       

    }
}
