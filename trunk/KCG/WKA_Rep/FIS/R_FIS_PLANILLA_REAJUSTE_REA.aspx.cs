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
using System.Globalization;
using AEL.FIS;
using System.Collections.Generic;
using REL.FIS;
using Microsoft.Reporting.WebForms;
using REL.APU;

namespace WKA_Rep.FIS
{
    public partial class R_FIS_PLANILLA_REAJUSTE_REA : KPaginaReporte
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

            string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
            string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
            string Proyecto = null;
            string Fiscalizador = null;
            string fechaReajusteDefinitivo = null;
            string reajusteDesde = null;

            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;

            REL.FIS.RO_Fis_Fiscalizacion FisFiscalizacion = new RO_Fis_Fiscalizacion();
            List<Fis_Fiscalizacion> lstFiscalizacion = FisFiscalizacion.GetById("", s, Fiscalizacion_Id);
            if (lstFiscalizacion.Count > 0)
            {
                Proyecto = lstFiscalizacion[0].Apu_Origen_Nombre;
                Fiscalizador = lstFiscalizacion[0].Fiscalizador_Per_Personal_Nombre;
                reajusteDesde = lstFiscalizacion[0].Fecha_Indice_Base.ToString("dd/MM/yyyy");
            }

            REL.FIS.RO_Fis_Planilla FisPlanilla = new RO_Fis_Planilla();
            List<Fis_Planilla> lstPlanilla = FisPlanilla.GetById("", s, Planilla_Id);
            if (lstPlanilla.Count > 0)
            {
                fechaReajusteDefinitivo = lstPlanilla[0].Fecha_Reajuste_Definitivo.ToString("dd/MM/yyyy");
            }

            ReportParameter[] parametros = new ReportParameter[10];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_fecha", fecha);                
                parametros[3] = new ReportParameter("Fis_Fiscalizacion_Id", Fiscalizacion_Id);
                parametros[4] = new ReportParameter("Fis_Planilla_Id", Planilla_Id);
                parametros[5] = new ReportParameter("pr_dat_Proyecto", Proyecto);
                parametros[6] = new ReportParameter("pr_dat_Fiscalizador", Fiscalizador);
                parametros[7] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                parametros[8] = new ReportParameter("pr_dat_Fecha_ReajusteD", fechaReajusteDefinitivo);
                parametros[9] = new ReportParameter("pr_dat_Fecha_Indice_Base", reajusteDesde);

                rpv_Fis_Planilla_Reajuste.LocalReport.SetParameters(parametros);
                rpv_Fis_Planilla_Reajuste.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
                //rpv_Fis_Planilla_Resumen.LocalReport.Refresh();
            }
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            switch (e.ReportPath)
            {
                case "SR_FIS_PLANILLA_REAJ_REA_CUADRILLA":
                    {
                        REL.APU.RO_Apu_Presupuesto_Cuadrilla ApuPresupuestoCuadrilla = new RO_Apu_Presupuesto_Cuadrilla();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                        ApuPresupuestoCuadrilla.GetByPlanilla(s, Request.QueryString["Fis_Fiscalizacion_Id"], Request.QueryString["Fis_Planilla_Id"], "REA")));
                        break;
                    }
                case "SR_FIS_PLANILLA_REAJ_REA_CUAD":
                    {
                        REL.FIS.RO_Fis_Planilla_Resumen PlanillaResumen = new RO_Fis_Planilla_Resumen();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                            PlanillaResumen.GetById(s, Request.QueryString["Fis_Planilla_Id"])));
                        break;
                    }
                case "SR_FIS_PLANILLA_REA":
                    {
                        REL.FIS.RO_Fis_Planilla_Resumen PlanillaResumenR = new RO_Fis_Planilla_Resumen();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                            PlanillaResumenR.GetById(s, Request.QueryString["Fis_Planilla_Id"])));
                        break;
                    }
                case "SR_FIS_PLANILLA_REAJ_REA_FORMULA":
                    {
                        REL.APU.RO_Apu_Presupuesto_Formula ApuPresupuestoFormula = new RO_Apu_Presupuesto_Formula();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                            ApuPresupuestoFormula.GetByPlanilla(s, Request.QueryString["Fis_Fiscalizacion_Id"], Request.QueryString["Fis_Planilla_Id"], "REA")));
                        break;
                    }
                case "SR_FIS_PLANILLA_REAJ_REA_FOR":
                    {
                        REL.FIS.RO_Fis_Planilla_Resumen PlanillaResumenF = new RO_Fis_Planilla_Resumen();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                            PlanillaResumenF.GetById(s, Request.QueryString["Fis_Planilla_Id"])));
                        break;
                    }
            }
        }
    }
}
