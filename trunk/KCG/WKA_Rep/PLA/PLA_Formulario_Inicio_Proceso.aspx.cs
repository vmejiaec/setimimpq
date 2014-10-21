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
            int v_Pla_Doc_Id = Int32.Parse(Request.QueryString.Get("v_Pla_Doc_Id"));
            
            ReportParameter[] parametros = new ReportParameter[2];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Per_Personal_Nombre);
                parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(Empresa.Imagen));
                ReportViewer1.LocalReport.SetParameters(parametros);
            }
        }
    }
}