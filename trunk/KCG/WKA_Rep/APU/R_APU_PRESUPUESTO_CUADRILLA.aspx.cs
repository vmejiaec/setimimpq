using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using REL.APU;
using Microsoft.Reporting.WebForms;
using AEL.APU;
using BEL;
using System.Threading;

namespace WKA_Rep.APU
{
    public partial class R_APU_PRESUPUESTO_CUADRILLA : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Scope s = Scope_Factory.Get(Request.QueryString);

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

            string presupuesto_origen_nombre = null;
            string presupuesto_nombre = null;
            string Cadena_Cuadrilla = null;
            decimal cuadrilla_Sumatoria = 0;
            decimal cuad_coef_sum = 0;

            // Recupera query string            
            string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];
            estado_txt.Text = "DIS";
            List<Apu_Presupuesto> ltsApu_Presupuesto = RO_Apu_Presupuesto.Adapter.GetById(s, ApuPresupuestoId, estado_txt.Text);
            {
                if (ltsApu_Presupuesto.Count > 0)
                {
                    presupuesto_origen_nombre = ltsApu_Presupuesto[0].Origen_Nombre.ToUpper();
                    presupuesto_nombre = ltsApu_Presupuesto[0].Apu_Origen_Nombre;
                    Cadena_Cuadrilla = ltsApu_Presupuesto[0].Cadena_Cuadrilla;
                    cuadrilla_Sumatoria = ltsApu_Presupuesto[0].Cuadrilla_Sumatoria;
                    cuad_coef_sum = ltsApu_Presupuesto[0].Cuadrilla_Coeficiente_Sumatoria;
                }
            }

            if (!IsPostBack)
            {
                // Recupera query string                
                Session["Scope"] = s;
                Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
                //string imagenURL = null;
                // Carga los parametros al reporte
                ReportParameter[] parametros = new ReportParameter[9];
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_presupuesto_oriegen_nombre", presupuesto_origen_nombre);
                //parametros[3] = new ReportParameter("pr_dat_empresa_imagen", imagenURL);
                parametros[3] = new ReportParameter("pr_dat_presupuesto_nombre", presupuesto_nombre);
                parametros[4] = new ReportParameter("pr_dat_Cadena_Cuadrilla", Cadena_Cuadrilla);
                parametros[5] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[6] = new ReportParameter("pr_dat_cuadrila_sumatoria", cuadrilla_Sumatoria.ToString("N2",nfi));
                parametros[7] = new ReportParameter("pr_dat_cuad_coef_sum", cuad_coef_sum.ToString("N3",nfi));
                parametros[8] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

                rpv_Apu_Presupuesto_Cuadrilla.LocalReport.SetParameters(parametros);
            }
        }
    }
}
