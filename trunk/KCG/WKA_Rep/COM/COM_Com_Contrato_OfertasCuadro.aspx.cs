using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.COM
{
    public partial class COM_Com_Contrato_OfertasCuadro : KPaginaReporte
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
            // Consultamos el pie de firma del usuario
            CEL.PLA.DO_Pla_PersonalDatos adpPerDat = new CEL.PLA.DO_Pla_PersonalDatos();
            var listaPerDat = adpPerDat.GetByPer_Personal_Id(Scope, Scope.Per_Personal_Id);
            var filaPerDat = listaPerDat[0];

            ReportParameter[] parametros = new ReportParameter[2];
            parametros[0] = new ReportParameter("pr_Usuario_Nombre", filaPerDat.Pie_Firma_Nombre);
            parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));

            ReportViewer1.LocalReport.SetParameters(parametros);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}