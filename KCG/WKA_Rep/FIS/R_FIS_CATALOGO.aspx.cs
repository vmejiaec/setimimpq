using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;
using Microsoft.Reporting.WebForms;
using REL.FIS;
using BEL;

namespace WKA_Rep.FIS
{
    public partial class R_FIS_CATALOGO : KPaginaReporte
    {
        Scope s;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Seteo del Idioma
            DateTimeFormatInfo dfi = new DateTimeFormatInfo();
            CultureInfo ci = new CultureInfo("es-ES");
            //Capturo los valores de dia mes y año

            DateTime dl = DateTime.Now.Date;
            string dia_nombre = dl.ToString("dddd", ci);
            string mes_nombre = dl.ToString("m", ci);
            string anio = dl.Year.ToString();
            string fecha = dia_nombre + ", " + mes_nombre + " del " + anio;

            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
            ReportParameter[] parametros = new ReportParameter[4];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[3] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

                rpv_Fis_Catalogo.LocalReport.SetParameters(parametros);
                rpv_Fis_Catalogo.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
                rpv_Fis_Catalogo.LocalReport.Refresh();
            }
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            switch (e.ReportPath)
            {
                case "SR_Fis_Catalogo_Indice":
                    {         
                        DataTable FisCatalogoId = RO_Fis_Catalogo_Indice.GetByCatalogo(s, e.Parameters["Id"].Values[0]);
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], FisCatalogoId));
                        break;
                    }
                case "SR_Fis_Catalogo_Categoria":
                    {
                        DataTable FisCatalogoCate = RO_Fis_Catalogo_Categoria.GetByCatalogo(s, e.Parameters["Id"].Values[0]);
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], FisCatalogoCate));
                        break;
                    }
                case "SR_Fis_Catalogo_Mano_Obra":
                    {
                        DataTable FisCatalogpManoO = RO_Fis_Catalogo_Mano_Obra.GetByCatalogo(s, e.Parameters["Id"].Values[0]);
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], FisCatalogpManoO));
                        break;
                    }                
            }
        }
    }
}
