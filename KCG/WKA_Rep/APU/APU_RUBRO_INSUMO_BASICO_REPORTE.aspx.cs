using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using AEL.APU;
using BEL;
using REL.APU;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep
{
    public partial class APU_RUBRO_INSUMO_BASICO_REPORTE : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarReporte();
            }
        }

        void CargarReporte()
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
            string Apu_Rubro_Id = "";
            string Apu_Rubro_Codigo = "";
            string Apu_Rubro_Nombre = "";

            if (!IsPostBack)
            {

                if (Request.QueryString["Apu_Rubro_Codigo"] != null)
                {
                    Apu_Rubro_Codigo = Request.QueryString["Apu_Rubro_Codigo"];
                    Txt_Apu_Rubro_Codigo.Text = Apu_Rubro_Codigo.ToString();
                }
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
            ReportParameter[] parametros = new ReportParameter[5];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_rubro_nombre", Apu_Rubro_Nombre);
            parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[4] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

            rptRubroInsumoBasico.LocalReport.SetParameters(parametros);
            rptRubroInsumoBasico.LocalReport.Refresh();
        }

        protected void btn_Consultar_Click(object sender, EventArgs e)
        {
            CargarReporte();
        }
    }
}
