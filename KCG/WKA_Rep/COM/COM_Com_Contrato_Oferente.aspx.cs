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
            // Fecha y hora del cierre de recepción de ofertas
            // para el reporte pr_Fecha_Cierre_Rec_Ofertas
            // v_Com_Contrato_Oferente_Id
            // Obtener el id del registro
            int ConOferenteId = Int32.Parse(Request.QueryString["v_Com_Contrato_Oferente_Id"]);
            CEL.COM.DO_Com_Contrato_Oferente adpConOfer = new CEL.COM.DO_Com_Contrato_Oferente();
            var listaConOfer = adpConOfer.GetById(Scope,ConOferenteId);
            int ConId = listaConOfer[0].Com_Contrato_Id;
            CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();
            var listaCon = adpCon.GetById(Scope, ConId);
            DateTime dtFechaCierre = listaCon[0].Fecha_Cierre_Rec_Ofertas;
            string sFechaHora_Cierre_Rec_Ofertas = string.Format("{0:d' de 'MMMM' de 'yyyy ', hora: 'HH:MM}", dtFechaCierre); //d' de 'MMMM' de 'yyyy
            //
            ReportParameter[] parametros = new ReportParameter[3];
            parametros[0] = new ReportParameter("pr_Usuario_Nombre", Scope.Per_Personal_Nombre);
            parametros[1] = new ReportParameter("pr_Logo_Imagen", ObtenerUrlCompleta(@"~\Imagenes\LogoReporteIMPQ_Small.png"));
            parametros[2] = new ReportParameter("pr_Fecha_Cierre_Rec_Ofertas", sFechaHora_Cierre_Rec_Ofertas);

            ReportViewer1.LocalReport.SetParameters(parametros);            
            ReportViewer1.LocalReport.Refresh();
        }
    }
}