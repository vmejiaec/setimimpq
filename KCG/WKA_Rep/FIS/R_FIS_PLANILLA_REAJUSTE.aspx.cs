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
using REL.FIS;
using BEL;
using System.Collections.Generic;
using Microsoft.Reporting.WebForms;
using AEL.FIS;
using Convertir;
using System.Threading;

namespace WKA_Rep.FIS
{
    public partial class R_FIS_PLANILLA_REAJUSTE : KPaginaReporte
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
            string fiscalizador = null, obra = null, contratita = null, totalLetras = null, per_personal_nombre = null;
            decimal valorProvisional = 0, valorDefinitivo = 0, sumatotal = 0;

            //Formato para cantidades
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            Scope s = Scope_Factory.Get(Request.QueryString);
            REL.FIS.RO_Fis_Fiscalizacion FisFiscalizacion = new RO_Fis_Fiscalizacion();
            List<Fis_Fiscalizacion> lstFiscalizacion = FisFiscalizacion.GetById("", s, Request.QueryString["Apu_Presupuesto_Id"]);
            if (lstFiscalizacion.Count > 0)
            {
                fiscalizador = lstFiscalizacion[0].Fiscalizador_Per_Personal_Nombre;
                obra = lstFiscalizacion[0].Apu_Origen_Nombre;
                contratita = lstFiscalizacion[0].Contratista_Per_Personal_Nombre;
            }

            REL.FIS.RO_Fis_Planilla_Resumen FisPlanillaResumen = new RO_Fis_Planilla_Resumen();
            List<Fis_Planilla_Resumen> lstPlanillaResumen= FisPlanillaResumen.GetByPresupuesto_(s, Request.QueryString["Apu_Presupuesto_Id"]);
            for (int i = 0; i < lstPlanillaResumen.Count; i++)
            {
                valorProvisional = valorProvisional + lstPlanillaResumen[i].Valor_A_Pagar_Provisional;
                valorDefinitivo = valorDefinitivo + lstPlanillaResumen[i].Valor_A_Pagar_Definitivo;                
            }
            sumatotal = valorProvisional + valorDefinitivo;
            totalLetras = Convertir.Cantidad.ToTexto(sumatotal);
            ReportParameter[] parametros = new ReportParameter[6];            
            if (!IsPostBack)
            {                
                parametros[0] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[1] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                parametros[2] = new ReportParameter("pr_dat_fiscalizador", fiscalizador);
                parametros[3] = new ReportParameter("pr_dat_obra", obra);
                parametros[4] = new ReportParameter("pr_dat_contratista", contratita);
                parametros[5] = new ReportParameter("pr_dat_total_letras", totalLetras);
                
                rpv_Fis_Planilla_Reajuste.LocalReport.SetParameters(parametros);                
                rpv_Fis_Planilla_Reajuste.LocalReport.Refresh();
            }
        }
    }
}
