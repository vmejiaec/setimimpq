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
    public partial class APU_OFERTA_RUBRO_INSUMO_REPORTE : KPaginaReporte
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
            string Apu_Oferta_Id = "";
            string Apu_Oferta_Codigo = "";
            string Apu_Oferta_Nombre = "";
            string Apu_Lugar_Nombre = "";
            string Apu_Provincia_Nombre = "";


            if (!IsPostBack)
            {
                Apu_Oferta_Codigo = Request.QueryString["Apu_Oferta_Codigo"];
                Txt_Apu_Oferta_Codigo.Text = Apu_Oferta_Codigo.ToString();
            }
            else
                Apu_Oferta_Codigo = Txt_Apu_Oferta_Codigo.Text;
            // Recupera query string
            Scope s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            if (Apu_Oferta_Codigo == "")
            {
                Apu_Oferta_Nombre = "";
                Apu_Lugar_Nombre = "";
                Apu_Provincia_Nombre = "";

            }
            else
            {
                DataTable ofertas = RO_Apu_Oferta.GetByCodigo(s, Apu_Oferta_Codigo);
                if (ofertas.Rows.Count > 0)
                {
                    Apu_Oferta_Nombre = (string) (ofertas.Rows[0])["Nombre"];
                    Apu_Oferta_Id = (string) (ofertas.Rows[0])["Id"];
                    Apu_Lugar_Nombre = (string) (ofertas.Rows[0])["Apu_Lugar_Nombre"];
                    Apu_Provincia_Nombre = (string) (ofertas.Rows[0])["Apu_Provincia_Nombre"];
                    lblMensaje.Text = "";
                }
                else
                {
                    Txt_Apu_Oferta_Codigo.Text = "";
                    lblMensaje.Text = "Codigo de Oferta no existe";
                }
            }
            Session["Apu_Oferta_Id"] = Apu_Oferta_Id;

            // Carga los parametros al reporte
            ReportParameter[] parametros = new ReportParameter[7];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_oferta_nombre", Apu_Oferta_Nombre);
            parametros[3] = new ReportParameter("pr_dat_lugar_nombre", Apu_Lugar_Nombre);
            parametros[4] = new ReportParameter("pr_dat_provincia_nombre", Apu_Provincia_Nombre);
            parametros[5] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[6] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));



            rptOfertaRubroInsumo.LocalReport.SetParameters(parametros);
            rptOfertaRubroInsumo.LocalReport.Refresh();

        }
        
    }
}
