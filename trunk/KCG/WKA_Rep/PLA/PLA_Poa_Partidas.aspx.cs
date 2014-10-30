using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.PLA
{
    public partial class PLA_Poa_Partidas : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Scope = Scope_Factory.Get(Request.QueryString);

            ReportParameter[] parametros = new ReportParameter[3];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
                parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));
                parametros[2] = new ReportParameter("pr_Anio", Request.QueryString.Get("v_Anio"));
                ReportViewer1.LocalReport.SetParameters(parametros);
            }
        }
    }
}