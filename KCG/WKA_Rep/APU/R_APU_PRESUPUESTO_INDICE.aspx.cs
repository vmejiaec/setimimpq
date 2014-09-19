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
using AEL.APU;
using System.Collections.Generic;
using Microsoft.Reporting.WebForms;
using REL.APU;
using BEL;
using System.Globalization;
using System.Threading;

namespace WKA_Rep.APU
{
    public partial class R_APU_PRESUPUESTO_INDICE : KPaginaReporte
    {
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

            //Formato para cantidades
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            string Apu_Proyecto_Nombre = "";
            string Apu_Proyecto = "";   
            decimal Apu_Proyecto_Indice_Sumatoria = 0;
            decimal Apu_Proyecto_Coeficiente_Sumatoria = 0;
            string Apu_Proyecto_Cadena_Indice = "";
            //decimal Coeficiente = 0;
            //decimal Costo_Total = 0;

            string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
            Scope s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            estado_txt.Text = "DIS";

            List<Apu_Presupuesto> lstApu_Presupuesto = RO_Apu_Presupuesto.Adapter.GetById(s, Presupuesto_Id, estado_txt.Text);
            if (lstApu_Presupuesto.Count > 0)
            {
                Apu_Proyecto_Nombre = lstApu_Presupuesto[0].Apu_Origen_Nombre;
                Apu_Proyecto = lstApu_Presupuesto[0].Origen_Nombre.ToUpper();
                Apu_Proyecto_Indice_Sumatoria = Convert.ToDecimal(lstApu_Presupuesto[0].Indice_Sumatoria);
                Apu_Proyecto_Coeficiente_Sumatoria = Convert.ToDecimal(lstApu_Presupuesto[0].Coeficiente_Sumatoria);
                Apu_Proyecto_Cadena_Indice = lstApu_Presupuesto[0].Cadena_Indice;
            }

            //s = Scope_Factory.Get(Request.QueryString);
            //Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
            if (!IsPostBack)
            {

                // Carga los parametros al reporte
                ReportParameter[] parametros = new ReportParameter[9];
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_proyecto_nombre", Apu_Proyecto_Nombre);
                parametros[3] = new ReportParameter("pr_dat_indice_sumatoria", Apu_Proyecto_Indice_Sumatoria.ToString("N2", nfi));
                parametros[4] = new ReportParameter("pr_dat_coeficiente_sumatoria", Apu_Proyecto_Coeficiente_Sumatoria.ToString("N3", nfi));
                parametros[5] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[6] = new ReportParameter("pr_dat_cadena_indice", Apu_Proyecto_Cadena_Indice.ToString());                
                //parametros[9] = new ReportParameter("pr_dat_coeficiente", Coeficiente.ToString());
                parametros[7] = new ReportParameter("pr_dat_proyecto", Apu_Proyecto);
                parametros[8] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

                prvApu_Presupuesto_Indice.LocalReport.SetParameters(parametros);
            }
        }
    }
}
