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
using Microsoft.Reporting.WebForms;
using REL.FIS;
using AEL.FIS;
using System.Collections.Generic;
using System.Threading;

namespace WKA_Rep.FIS
{
    public partial class R_FIS_PLANILLA_DET : KPaginaReporte
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

            //Formato para cantidades
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
            string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
            string Numero_Planilla = null, Contratista_Per_Personal_Nombre = null, Numero_Dias_Periodo = null, Porcentaje_Iva = null; ;
            string Fis_Planilla_Anio = null, Fecha_Inicial = null, Fecha_Final = null, Fecha_Contrato_Final = null;
            string Apu_Presupuesto_Nombre = null, Apu_Presupuesto_Costo_Total = null, Fecha_Contrato_Inicial = null;
            string Coordinador_1 = null, Coordinador_2 = null, Fiscalizador_personal_nom = null, Contratista_personal_nom = null;
            string Porcentaje_anticipo = null, Valor_anticipo = null, Costo_total = null, Sum_importe_anterior = null;
            string Sum_importe_actual = null, Sum_importe_total = null, Sum_importe_anterior_anticipo = null, Sum_importe_actual_anticipo = null;
            string Sum_importe_total_anticipo = null, Sum_importe_anterior_iva = null, Sum_importe_actual_iva = null, Sum_importe_total_iva = null;
            string Sum_importe_anterior_deducciones = null, Sum_importe_actual_deducciones = null, Sum_importe_total_deducciones = null, Sum_importe_anterior_pagar = null;
            string Sum_importe_actual_pagar = null, Sum_importe_total_pagar = null, Sum_incremento_monto_1 = null, Sum_incremento_monto_2 = null, lblCoordinador = null;
            string Monto_total = null, Fis_planilla_total = null, Plazo_ampliacion = null, Fecha_final_ampliacion = null;
            decimal Anticipo_devengar = 0, valorAnticipo = 0, importeTotalAnticipado = 0;

            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;

            REL.FIS.RO_Fis_Planilla FisPlanilla = new RO_Fis_Planilla();
            List<Fis_Planilla> lstPlanilla = FisPlanilla.GetById("", s, Planilla_Id);
            if (lstPlanilla.Count > 0)
            {
                Numero_Planilla = lstPlanilla[0].Numero_Planilla;
                Fis_Planilla_Anio = lstPlanilla[0].Fis_Planilla_Anio.ToString();
                Apu_Presupuesto_Nombre = lstPlanilla[0].Apu_Presupuesto_Nombre;
                Apu_Presupuesto_Costo_Total = lstPlanilla[0].Apu_Presupuesto_Costo_Total.ToString("N2", nfi);
                Fecha_Contrato_Inicial = lstPlanilla[0].Fecha_Contrato_Inicial.ToString("dd/MM/yyyy");
                Contratista_Per_Personal_Nombre = lstPlanilla[0].Contratista_Per_Personal_Nombre;
                Numero_Dias_Periodo = lstPlanilla[0].Apu_Presupuesto_Plazo.ToString("N0", nfi);
                Fecha_Inicial = lstPlanilla[0].Fecha_Inicial.ToString("dd/MM/yyyy");
                Fecha_Final = lstPlanilla[0].Fecha_Final.ToString("dd/MM/yyyy");
                Fecha_Contrato_Final = lstPlanilla[0].Fecha_Contrato_Final.ToString("dd/MM/yyyy");
                Porcentaje_Iva = lstPlanilla[0].Porcentaje_Iva.ToString("N0");                
            }

            RO_Fis_Planilla_Resumen PlanillaResumen = new RO_Fis_Planilla_Resumen();
            List<Fis_Planilla_Resumen> lstPlanillaResumen = PlanillaResumen.GetById("", s, Planilla_Id);
            if (lstPlanillaResumen.Count > 0)
            {
                Sum_importe_anterior = lstPlanillaResumen[0].Sum_Importe_Anterior.ToString("N2", nfi);
                Sum_importe_actual = lstPlanillaResumen[0].Sum_Importe_Actual.ToString("N2", nfi);
                Sum_importe_total = lstPlanillaResumen[0].Sum_Importe_Total.ToString("N2", nfi);
                Sum_importe_anterior_anticipo = lstPlanillaResumen[0].Sum_Importe_Anterior_Anticipo.ToString("N2", nfi);
                Sum_importe_total_anticipo = lstPlanillaResumen[0].Sum_Importe_Total_Anticipo.ToString("N2", nfi);
                Sum_importe_anterior_iva = lstPlanillaResumen[0].Sum_Importe_Anterior_Iva.ToString("N2", nfi);
                Sum_importe_actual_iva = lstPlanillaResumen[0].Sum_Importe_Actual_Iva.ToString("N2", nfi);
                Sum_importe_total_iva = lstPlanillaResumen[0].Sum_Importe_Total_Iva.ToString("N2", nfi);
                Sum_importe_anterior_deducciones = lstPlanillaResumen[0].Sum_Importe_Anterior_Deducciones.ToString("N2", nfi);
                Sum_importe_actual_deducciones = lstPlanillaResumen[0].Sum_Importe_Actual_Deducciones.ToString("N2", nfi);
                Sum_importe_total_deducciones = lstPlanillaResumen[0].Sum_Importe_Total_Deducciones.ToString("N2", nfi);
                Sum_importe_actual_anticipo = lstPlanillaResumen[0].Sum_Importe_Actual_Anticipo.ToString("N2", nfi);
                Sum_importe_anterior_pagar = lstPlanillaResumen[0].Sum_Importe_Anterior_Pagar.ToString("N2", nfi);
                Sum_importe_actual_pagar = lstPlanillaResumen[0].Sum_Importe_Actual_Pagar.ToString("N2", nfi);
                Sum_importe_total_pagar = lstPlanillaResumen[0].Sum_Importe_Total_Pagar.ToString("N2", nfi);
                Sum_incremento_monto_1 = lstPlanillaResumen[0].Sum_Incremento_Monto_1.ToString("N2", nfi);
                Sum_incremento_monto_2 = lstPlanillaResumen[0].Sum_Incremento_Monto_2.ToString("N2", nfi);
                Monto_total = lstPlanillaResumen[0].Monto_Total.ToString("N2", nfi);
                Fis_planilla_total = lstPlanillaResumen[0].Fis_Planilla_Total.ToString("N2", nfi);
                importeTotalAnticipado = Convert.ToDecimal(lstPlanillaResumen[0].Sum_Importe_Total_Anticipo);
            }
            
            RO_Fis_Fiscalizacion FisFiscalizacion = new RO_Fis_Fiscalizacion();
            List<Fis_Fiscalizacion> lstFiscalizacion = FisFiscalizacion.GetById("", s, Fiscalizacion_Id);
            if (lstFiscalizacion.Count > 0)
            {
                Costo_total = lstFiscalizacion[0].Costo_Total.ToString("N2", nfi);
                Valor_anticipo = lstFiscalizacion[0].Valor_Anticipo.ToString("N2", nfi);
                Porcentaje_anticipo = lstFiscalizacion[0].Porcentaje_Anticipo.ToString("N0");
                Contratista_personal_nom = lstFiscalizacion[0].Contratista_Per_Personal_Nombre;
                Fiscalizador_personal_nom = lstFiscalizacion[0].Fiscalizador_Per_Personal_Nombre;
                Coordinador_1 = lstFiscalizacion[0].Coordinador_1;
                Coordinador_2 = lstFiscalizacion[0].Coordinador_2;
                Plazo_ampliacion = lstFiscalizacion[0].Plazo_Ampliacion_Only.ToString();
                Fecha_final_ampliacion = lstFiscalizacion[0].Fecha_Final_Ampliacion.ToString("dd/MM/yyyy");
                valorAnticipo = Convert.ToDecimal(lstFiscalizacion[0].Valor_Anticipo);
                if (Coordinador_2 != null)
                    lblCoordinador = "Coordinador";
            }

            Anticipo_devengar = valorAnticipo - importeTotalAnticipado;

            ReportParameter[] parametros = new ReportParameter[47];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[3] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                parametros[4] = new ReportParameter("Fis_Fiscalizacion_Id", Fiscalizacion_Id);
                parametros[5] = new ReportParameter("Fis_Planilla_Id", Planilla_Id);
                parametros[6] = new ReportParameter("pr_dat_numero_planilla", Numero_Planilla);
                parametros[7] = new ReportParameter("pr_dat_fis_planilla_anio", Fis_Planilla_Anio);
                parametros[8] = new ReportParameter("pr_dat_apu_presupuesto_nombre", Apu_Presupuesto_Nombre);
                parametros[9] = new ReportParameter("pr_dat_apu_presupuesto_costo_total", Apu_Presupuesto_Costo_Total);
                parametros[10] = new ReportParameter("pr_dat_fecha_contrato_inicial", Fecha_Contrato_Inicial);
                parametros[11] = new ReportParameter("pr_dat_contratista_per_personal_nombre", Contratista_Per_Personal_Nombre);
                parametros[12] = new ReportParameter("pr_dat_numero_dias_periodo", Numero_Dias_Periodo);
                parametros[13] = new ReportParameter("pr_dat_fecha_inicial", Fecha_Inicial);
                parametros[14] = new ReportParameter("pr_dat_fecha_final", Fecha_Final);
                parametros[15] = new ReportParameter("pr_dat_fecha_contrato_final", Fecha_Contrato_Final);
                parametros[16] = new ReportParameter("pr_dat_porcentaje_iva", Porcentaje_Iva);
                parametros[17] = new ReportParameter("pr_dat_coordinador_1", Coordinador_1 );
                parametros[18] = new ReportParameter("pr_dat_coordinador_2", Coordinador_2);
                parametros[19] = new ReportParameter("pr_dat_fiscalizador_personal_nom", Fiscalizador_personal_nom);
                parametros[20] = new ReportParameter("pr_dat_contratista_personal_nom", Contratista_personal_nom);
                parametros[21] = new ReportParameter("pr_dat_porcentaje_anticipo", Porcentaje_anticipo);
                parametros[22] = new ReportParameter("pr_dat_valor_anticipo", Valor_anticipo);
                parametros[23] = new ReportParameter("pr_dat_costo_total", Costo_total);
                parametros[24] = new ReportParameter("pr_dat_sum_importe_anterior", Sum_importe_anterior);
                parametros[25] = new ReportParameter("pr_dat_sum_importe_actual", Sum_importe_actual);
                parametros[26] = new ReportParameter("pr_dat_sum_importe_total", Sum_importe_total);
                parametros[27] = new ReportParameter("pr_dat_sum_importe_anterior_anticipo", Sum_importe_anterior_anticipo);
                parametros[28] = new ReportParameter("pr_dat_sum_importe_actual_anticipo", Sum_importe_actual_anticipo);
                parametros[29] = new ReportParameter("pr_dat_sum_importe_total_anticipo", Sum_importe_total_anticipo);
                parametros[30] = new ReportParameter("pr_dat_sum_importe_anterior_iva", Sum_importe_anterior_iva);
                parametros[31] = new ReportParameter("pr_dat_sum_importe_actual_iva", Sum_importe_actual_iva);
                parametros[32] = new ReportParameter("pr_dat_sum_importe_total_iva", Sum_importe_total_iva);
                parametros[33] = new ReportParameter("pr_dat_sum_importe_anterior_deducciones", Sum_importe_anterior_deducciones);
                parametros[34] = new ReportParameter("pr_dat_sum_importe_actual_deducciones", Sum_importe_anterior_deducciones);
                parametros[35] = new ReportParameter("pr_dat_sum_importe_total_deducciones", Sum_importe_total_deducciones);
                parametros[36] = new ReportParameter("pr_dat_sum_importe_anterior_pagar", Sum_importe_anterior_pagar);
                parametros[37] = new ReportParameter("pr_dat_sum_importe_actual_pagar", Sum_importe_actual_pagar);
                parametros[38] = new ReportParameter("pr_dat_sum_importe_total_pagar", Sum_importe_total_pagar);
                parametros[39] = new ReportParameter("pr_dat_sum_incremento_monto_1", Sum_incremento_monto_1);
                parametros[40] = new ReportParameter("pr_dat_sum_incremento_monto_2", Sum_incremento_monto_2);
                parametros[41] = new ReportParameter("pr_dat_lblCoordinador", lblCoordinador);
                parametros[42] = new ReportParameter("pr_dat_monto_total", Monto_total);
                parametros[43] = new ReportParameter("pr_dat_fis_planilla_total", Fis_planilla_total);
                parametros[44] = new ReportParameter("pr_dat_plazo_ampliacion", Plazo_ampliacion);
                parametros[45] = new ReportParameter("pr_dat_fecha_final_ampliacion", Fecha_final_ampliacion);
                parametros[46] = new ReportParameter("pr_dat_anticipo_devengar", Anticipo_devengar.ToString("N2", nfi));

                rpvFis_Planilla_Det.LocalReport.SetParameters(parametros);
            }
        }
    }
}
