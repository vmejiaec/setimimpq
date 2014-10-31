using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.PLA
{
    public partial class PLA_FormatoMemoAutorizacion : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaParametrosAlReporte();
            }
        }

        protected void btActualizarReporte_Click(object sender, EventArgs e)
        {
            CargaParametrosAlReporte();
        }

        void CargaParametrosAlReporte()
        {
            Scope = Scope_Factory.Get(Request.QueryString);
            // Consulta el pie de firma del representante legal
            CEL.PLA.DO_Pla_Param adpPla_Param = new CEL.PLA.DO_Pla_Param();
            var listaParams = adpPla_Param.Get(Scope);
            var filaParams = listaParams[0];

            ReportParameter[] parametros = new ReportParameter[6];
            parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
            parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));
            parametros[2] = new ReportParameter("pr_ProcedimientoNombre", tbProcedimiento.Text);
            parametros[3] = new ReportParameter("pr_Persona_Autoriza_Nombre", filaParams.Rep_Legal_Pie_Firma_Nombre);
            parametros[4] = new ReportParameter("pr_Persona_Autoriza_Cargo", filaParams.Rep_Legal_Pie_Firma_Cargo);
            parametros[5] = new ReportParameter("pr_Memorando_No", tbMemorandoNo.Text);

            ReportViewer1.LocalReport.SetParameters(parametros);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}