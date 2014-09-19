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
using BEL;
using Microsoft.Reporting.WebForms;
using System.Globalization;

namespace WKA_Rep.PER
{
    public partial class R_PER_PERSONAL : KPaginaReporte
    {
        Scope s;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///Seteo del Idioma
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
                rpv_Per_Personal.LocalReport.SetParameters(parametros);
            }
        }
    }
}
