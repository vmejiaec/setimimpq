using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.PLA
{
    public partial class PLA_Formulario_Inicio_Proceso : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Scope = Scope_Factory.Get(Request.QueryString);
                        
            ReportParameter[] parametros = new ReportParameter[2];
            if (!IsPostBack)
            {
                // Consulta las iniciales del usuario para mandarlas como parámetro al reporte
                CEL.PLA.DO_Pla_PersonalDatos adpPersonalDatos = new CEL.PLA.DO_Pla_PersonalDatos();
                var listaPerDatUsuario = adpPersonalDatos.GetByPer_Personal_Id(Scope, Scope.Per_Personal_Id);
                var oPerDatUsuario = listaPerDatUsuario[0];
                // Parámetros y llamada del reporte
                parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
                parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));
                parametros[1] = new ReportParameter("pr_Usuario_Iniciales", oPerDatUsuario.Pie_Firma_Iniciales);
                ReportViewer1.LocalReport.SetParameters(parametros);
            }
        }
    }
}