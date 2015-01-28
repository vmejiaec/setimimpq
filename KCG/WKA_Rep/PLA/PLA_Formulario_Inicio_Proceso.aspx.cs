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
                // Consulta el documento para obtener la persona que contrata
                int Pla_Doc_Id = Int32.Parse( Request.QueryString["v_Pla_Doc_Id"]);
                CEL.PLA.DO_Pla_Doc adpDoc = new CEL.PLA.DO_Pla_Doc();
                var listaDocs = adpDoc.GetById(Scope, Pla_Doc_Id);
                if (listaDocs.Count > 0)
                {
                    // Consulta las iniciales del usuario para mandarlas como parámetro al reporte
                    CEL.PLA.DO_Pla_PersonalDatos adpPersonalDatos = new CEL.PLA.DO_Pla_PersonalDatos();
                    var listaPerDatUsuario = adpPersonalDatos.GetByPer_Personal_Id(Scope, listaDocs[0].Per_Personal_Id_Contrata);
                    string Persona_Contrata_Pie_Firma_Iniciales;
                    if ( listaPerDatUsuario.Count > 0)
                        Persona_Contrata_Pie_Firma_Iniciales = listaPerDatUsuario[0].Pie_Firma_Iniciales;
                    else
                        Persona_Contrata_Pie_Firma_Iniciales = "---";
                    // Obtiene la dirección del logo
                    string urlLogo = ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png");
                    // Parámetros y llamada del reporte
                    parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
                    parametros[1] = new ReportParameter("pr_Logo_Imagen", urlLogo);
                    parametros[1] = new ReportParameter("pr_Per_Persona_Contrata_Iniciales", Persona_Contrata_Pie_Firma_Iniciales);
                    ReportViewer1.LocalReport.SetParameters(parametros);
                }
            }
        }
    }
}