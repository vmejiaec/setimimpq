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
using REL.APU;
using System.Collections.Generic;
using AEL.APU;

namespace WKA_Rep.APU
{
    public partial class R_APU_PRESUPUESTO_RUBRO : KPaginaReporte
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
            string Apu_Proyecto_Nombre = "";
            string Apu_Proyecto = "";
            estado_txt.Text = "DIS";

            string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
            Scope s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            List<Apu_Presupuesto> lstApu_Presupuesto = RO_Apu_Presupuesto.Adapter.GetById(s, Presupuesto_Id, estado_txt.Text);
            if (lstApu_Presupuesto.Count > 0)
            {
                Apu_Proyecto_Nombre = lstApu_Presupuesto[0].Apu_Origen_Nombre;
                Apu_Proyecto = lstApu_Presupuesto[0].Origen_Nombre.ToUpper();
            }

            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
            ReportParameter[] parametros = new ReportParameter[6];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[3] = new ReportParameter("pr_dat_proyecto_nombre", Apu_Proyecto_Nombre);
                parametros[4] = new ReportParameter("pr_dat_proyecto", Apu_Proyecto);
                parametros[5] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                rpv_Apu_Presupuesto_Rubro.LocalReport.SetParameters(parametros);
            }
        }
    }
}
