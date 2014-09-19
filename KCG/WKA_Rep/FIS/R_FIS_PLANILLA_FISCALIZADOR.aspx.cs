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
using System.Threading;
using BEL;
using System.Collections.Generic;
using REL.FIS;
using AEL.FIS;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep.FIS
{   
    public partial class R_FIS_PLANILLA_FISCALIZADOR : KPaginaReporte
    {
        Scope s;        
        protected void Page_Load(object sender, EventArgs e)
        {            
            //Seteo del Idioma
            DateTimeFormatInfo dfi = new DateTimeFormatInfo();
            string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
            string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];            
            CultureInfo ci = new CultureInfo("es-ES");
           
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;
                                  
            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
            //Capturo los valores de dia mes y año
            DateTime fechaSystema = DateTime.Now.Date;            
            string dia_nombre = fechaSystema.ToString("dddd", ci);
            string mes_nombre = fechaSystema.ToString("m", ci);
            string anio = fechaSystema.Year.ToString();
            string fecha = dia_nombre + ", " + mes_nombre + " del " + anio;
            string Codigo = null, Numero_planilla = null, Fecha_Ini = null, Fecha_Fin = null, Numro_dias_Periodo = null,
                numero_dias_acumulado = null, sum_importe_total = null,  fecha_ini_contr = null,
                sum_impor_ante = null, sum_impor_act = null, sum_impor_total = null, sum_impor_ante_anti = null,
                sum_impor_act_anti = null, sum_impor_total_anti = null, antic_X_devegar = null;
            string monto_total_ejec = null, incremento_real_obra = null;
            REL.FIS.RO_Fis_Planilla_Resumen FisPlanillaR = new RO_Fis_Planilla_Resumen();
            List<Fis_Planilla_Resumen> lstFisPlanillaR = FisPlanillaR.GetById("", s, Planilla_Id);
            if (lstFisPlanillaR.Count > 0)
            {
                Codigo = lstFisPlanillaR[0].Codigo;
                Numero_planilla = lstFisPlanillaR[0].Numero_Planilla;
                Fecha_Ini = lstFisPlanillaR[0].Fecha_Inicial.ToString("dd/MM/yyyy");
                Fecha_Fin = lstFisPlanillaR[0].Fecha_Final.ToString("dd/MM/yyyy");
                Numro_dias_Periodo = lstFisPlanillaR[0].Numero_Dias_Periodo.ToString();
                numero_dias_acumulado = lstFisPlanillaR[0].Numero_Dias_Acumulado.ToString();
                sum_importe_total = lstFisPlanillaR[0].Sum_Importe_Total.ToString("N2", nfi);
                monto_total_ejec = lstFisPlanillaR[0].Monto_Total_Ejecutarse.ToString("N2",nfi);                 
                fecha_ini_contr = lstFisPlanillaR[0].Fecha_Ini_Contrato.ToString("dd/MM/yyyy");
                sum_impor_ante = lstFisPlanillaR[0].Sum_Importe_Anterior.ToString("N2", nfi);
                sum_impor_act = lstFisPlanillaR[0].Sum_Importe_Actual.ToString("N2", nfi);
                sum_impor_ante_anti = lstFisPlanillaR[0].Sum_Importe_Anterior_Anticipo.ToString("N2", nfi);
                sum_impor_act_anti = lstFisPlanillaR[0].Sum_Importe_Actual_Anticipo.ToString("N2", nfi);
                sum_impor_total_anti = lstFisPlanillaR[0].Sum_Importe_Total_Anticipo.ToString("N2", nfi);
                antic_X_devegar = lstFisPlanillaR[0].Anticipo_por_Devengar.ToString("N2", nfi);
                incremento_real_obra = lstFisPlanillaR[0].Incremento_Real_Obra.ToString("N2", nfi);
                if (lstFisPlanillaR[0].Incremento_Real_Obra <= 1)
                    incremento_real_obra = "";
            }
            //string plazo_dias = null, _nombre = null, fechaAutorizacion = null;
            //REL.FIS.RO_Fis_Ampliacion FisAmpliacion = new RO_Fis_Ampliacion();
            //List<Fis_Ampliacion> lstFisAmpliacion = FisAmpliacion.GetByPresuesto("", s, Fiscalizacion_Id);
            //if (lstFisAmpliacion.Count > 0)
            //{
            //    plazo_dias = lstFisAmpliacion[0].Plazo_Dias.ToString();
            //    _nombre = lstFisAmpliacion[0].Nombre;
            //    fechaAutorizacion = lstFisAmpliacion[0].Fecha_Autorizacion.ToString("dd/MM/yyyy");
            //}
            ReportParameter[] parametros = new ReportParameter[21];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                parametros[3] = new ReportParameter("pr_dat_fecha_sistema", fecha);                
                parametros[4] = new ReportParameter("pr_dat_Codigo", Codigo);
                parametros[5] = new ReportParameter("pr_dat_numero_planilla", Numero_planilla);
                parametros[6] = new ReportParameter("pr_dat_fecha_ini", Fecha_Ini);
                parametros[7] = new ReportParameter("pr_dat_fecha_fin", Fecha_Fin);
                parametros[8] = new ReportParameter("pr_dat_num_dias_periodo", Numro_dias_Periodo);
                parametros[9] = new ReportParameter("pr_dat_num_dias_acum", numero_dias_acumulado);
                parametros[10] = new ReportParameter("pr_dat_sum_importe_total", sum_importe_total);
                parametros[11] = new ReportParameter("pr_dat_monto_total_ejecutarse", monto_total_ejec);
                parametros[12] = new ReportParameter("pr_dat_fecha_ini_contrato", fecha_ini_contr);
                parametros[13] = new ReportParameter("pr_dat_sum_importe_anterior", sum_impor_ante);
                parametros[14] = new ReportParameter("pr_dat_sum_importe_actual", sum_impor_act);
                parametros[15] = new ReportParameter("pr_dat_sum_importe_anterior_anticipo", sum_impor_ante_anti);
                parametros[16] = new ReportParameter("pr_dat_sum_importe_actual_anticipo", sum_impor_act_anti);
                parametros[17] = new ReportParameter("pr_dat_sum_importe_total_anticipo", sum_impor_total_anti);
                parametros[18] = new ReportParameter("pr_dat_anticipo_por_devengar", antic_X_devegar);
                //parametros[19] = new ReportParameter("pr_dat_plazo_dias", plazo_dias);
                parametros[19] = new ReportParameter("pr_dat_nombre", Request.QueryString["Fis_Fiscalizacion_Id"]);          
                //parametros[21] = new ReportParameter("pr_dat_fecha_auto", fechaAutorizacion);
                parametros[20] = new ReportParameter("pr_dat_incremento_real_obra", incremento_real_obra);

                rpvFis_Planilla_Fisc.LocalReport.SetParameters(parametros);
                rpvFis_Planilla_Fisc.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
            }
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            switch (e.ReportPath)
            {
                case "SR_FIS_PLANILLA_MULTA":
                    {
                        REL.FIS.RO_Fis_Planilla_Multa FisPlanillaMulta = new RO_Fis_Planilla_Multa();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                        FisPlanillaMulta.GetByPlanilla(s, Request.QueryString["Fis_Planilla_Id"])));
                        break;
                    }
                case "SR_FIS_PLANILLA_AMPLIACION":
                    {
                        REL.FIS.RO_Fis_Ampliacion FisAmpliacion = new RO_Fis_Ampliacion();
                        e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0],
                        FisAmpliacion.GetByPresuesto("", s, Request.QueryString["Fis_Fiscalizacion_Id"])));
                        break;
                    }
            }
        }
    }
}
