using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.COM
{
    public partial class COM_Com_Contrato_Oferente : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaParametrosAlReporte();
            }
        }

        void CargaParametrosAlReporte()
        {
            ReportParameter[] parametros = new ReportParameter[2];
            parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
            parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));
            
            ReportViewer1.LocalReport.SetParameters(parametros);            
            ReportViewer1.LocalReport.Refresh();
        }
    }
}