using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.COM
{
    public partial class COM_Com_Contrato_Perfil : KPaginaReporte
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
            // Consulta el pie de firma del representante legal
            CEL.PLA.DO_Pla_Param adpPla_Param = new CEL.PLA.DO_Pla_Param();
            var listaParams = adpPla_Param.Get(Scope);
            var filaParams = listaParams[0];
            // Consulta el pie de firmas de los responsables


            ReportParameter[] parametros = new ReportParameter[4];
            parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Int_Usuario_Nombre);
            parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoPerfilProyecto.png"));
            parametros[2] = new ReportParameter("pr_Persona_Autoriza_Nombre", filaParams.Rep_Legal_Pie_Firma_Nombre);
            parametros[3] = new ReportParameter("pr_Persona_Autoriza_Cargo", filaParams.Rep_Legal_Pie_Firma_Cargo);
            
            ReportViewer1.LocalReport.SetParameters(parametros);
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
            ReportViewer1.LocalReport.Refresh();
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            string sCom_Contrato_Id = Request.QueryString["v_Com_Contrato_Id"];
            if ( !string.IsNullOrEmpty(sCom_Contrato_Id) )
            {
                int iCom_Contrato_Id = Int32.Parse(sCom_Contrato_Id);
                CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();
                var listaCon = adpCon.GetById(Scope, iCom_Contrato_Id);
                int iPla_Tarea_Id = listaCon[0].Pla_Tarea_Id;
                switch (e.ReportPath)
                {
                    case "Rep_Com_Contrato_DocsTecs_Perfil":
                        {
                            e.DataSources.Add(
                                new ReportDataSource(
                                    e.DataSourceNames[0],
                                    REL.COM.RO_Com_Contrato_Perfil_DocsTecs.GetByCom_Contrato_Id(Scope, iCom_Contrato_Id)
                            ));
                            break;
                        }
                    case "Rep_Com_Contrato_Pla_Cta_Perfil":
                        {
                            e.DataSources.Add(
                                new ReportDataSource(
                                    e.DataSourceNames[0],
                                    REL.PLA.RO_Pla_Cta.GetByAnioArbolPla_Tarea_Id(Scope, iPla_Tarea_Id)
                            ));
                            break;
                        }
                }
            }
        }
    }
}