using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using AEL.APU;
using BEL;
using REL.APU;
using Microsoft.Reporting.WebForms;
using System.Threading;

namespace WKA_Rep
{
    public partial class APU_RUBRO_ANALISIS_UNITARIO : KPaginaReporte
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

            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            string Apu_Rubro_Id = "";
            string Apu_Rubro_Codigo = "";
            string Apu_Rubro_Nombre = "";
            string Apu_Rubro_Unidad = "";
            decimal Rendimiento_Equipo = 0;            
            decimal Apu_Rubro_Equipo_Costo_Total = 0;
            decimal Apu_Rubro_Mano_Obra_Costo_Total = 0;
            decimal Apu_Rubro_Material_Costo_Total = 0;
            decimal Apu_Rubro_Transporte_Costo_Total = 0;
            decimal Apu_Procentaje_Costo_Indirecto = 0;
            decimal Costo_Directo = 0;
            decimal Costo_Indirecto = 0;
            decimal Costo_Total = 0;

            if (!IsPostBack)
            {
                Apu_Rubro_Codigo = Request.QueryString["Apu_Rubro_Codigo"];                
                Txt_Apu_Rubro_Codigo.Text = Apu_Rubro_Codigo.ToString();
            }
            else
                Apu_Rubro_Codigo = Txt_Apu_Rubro_Codigo.Text;
            // Recupera query string
            Scope s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            if (Apu_Rubro_Codigo == "")
            {
                Apu_Rubro_Nombre = "";                
            }
            else
            {
                DataTable rubros = RO_Apu_Rubro.GetByCodigo(s, Apu_Rubro_Codigo);
                if (rubros.Rows.Count > 0)
                {
                    Apu_Rubro_Nombre = (string)(rubros.Rows[0])["Nombre"];
                    Apu_Rubro_Id = (string)(rubros.Rows[0])["Id"];
                    Apu_Rubro_Unidad = (string)(rubros.Rows[0])["Unidad"];
                    Rendimiento_Equipo = Convert.ToDecimal((rubros.Rows[0])["Rendimiento_Equipo"]);                    
                    Apu_Rubro_Equipo_Costo_Total = Convert.ToDecimal((rubros.Rows[0])["Apu_rubro_equipo_costo_total"]);
                    Apu_Rubro_Mano_Obra_Costo_Total = Convert.ToDecimal((rubros.Rows[0])["Apu_rubro_mano_obra_costo_total"]);
                    Apu_Rubro_Material_Costo_Total = Convert.ToDecimal((rubros.Rows[0])["Apu_rubro_material_costo_total"]);
                    Apu_Rubro_Transporte_Costo_Total = Convert.ToDecimal((rubros.Rows[0])["Apu_rubro_transporte_costo_total"]);
                    Apu_Procentaje_Costo_Indirecto = Convert.ToDecimal((rubros.Rows[0])["Porcentaje_costo_indirecto"]);
                    Costo_Directo = Convert.ToDecimal((rubros.Rows[0])["Costo_Directo"]);
                    Costo_Indirecto = Convert.ToDecimal((rubros.Rows[0])["Costo_Indirecto"]);
                    Costo_Total = Convert.ToDecimal((rubros.Rows[0])["Costo_Total"]);
                    lblMensaje.Text = "";
                }
                else
                {
                    Txt_Apu_Rubro_Codigo.Text = "";
                    lblMensaje.Text = "Codigo de Rubro no existe";
                }
            }
            Session["Apu_Rubro_Id"] = Apu_Rubro_Id;

            // Carga los parametros al reporte
            ReportParameter[] parametros = new ReportParameter[16];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_rubro_nombre", Apu_Rubro_Nombre);
            parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[4] = new ReportParameter("pr_dat_rubro_unidad", Apu_Rubro_Unidad);
            parametros[5] = new ReportParameter("pr_dat_rendimiento_equipo", Convert.ToString(Rendimiento_Equipo));            
            parametros[6] = new ReportParameter("pr_dat_apu_rubro_equipo_costo_total", Apu_Rubro_Equipo_Costo_Total.ToString("N4", nfi));
            parametros[7] = new ReportParameter("pr_dat_apu_rubro_mano_obra_costo_total", Apu_Rubro_Mano_Obra_Costo_Total.ToString("N4", nfi));
            parametros[8] = new ReportParameter("pr_dat_apu_rubro_material_costo_total", Apu_Rubro_Material_Costo_Total.ToString("N4", nfi));
            parametros[9] = new ReportParameter("pr_dat_apu_rubro_transporte_costo_total", Apu_Rubro_Transporte_Costo_Total.ToString("N4", nfi));
            parametros[10] = new ReportParameter("pr_dat_costo_directo", Costo_Directo.ToString("N4", nfi));
            parametros[11] = new ReportParameter("pr_dat_costo_indirecto", Costo_Indirecto.ToString("N4",nfi));
            parametros[12] = new ReportParameter("pr_dat_costo_total", Costo_Total.ToString("N2",nfi));
            parametros[13] = new ReportParameter("pr_dat_porcentaje_costo_indirecto", Convert.ToString(Apu_Procentaje_Costo_Indirecto));
            parametros[14] = new ReportParameter("pr_dat_rubro_codigo", Apu_Rubro_Codigo);
            parametros[15] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

            rpApuAnalisisPrecioUnitario.LocalReport.SetParameters(parametros);
            rpApuAnalisisPrecioUnitario.LocalReport.Refresh();
        }
    }
}
