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
    public partial class APU_OFERTA_RUBRO_BASICO_REPORTE : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarReporte();

        }

        void CargarReporte()
        {
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

                }
                else
                {
                    DataTable ofertas = RO_Apu_Oferta.GetByCodigo(s, Apu_Oferta_Codigo);
                    if (ofertas.Rows.Count > 0)
                    {
                        Apu_Oferta_Nombre = (string)(ofertas.Rows[0])["Nombre"];
                        Apu_Oferta_Id = (string)(ofertas.Rows[0])["Id"];
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
                ReportParameter[] parametros = new ReportParameter[5];
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_oferta_nombre", Apu_Oferta_Nombre);
                parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[4] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));


                rptOfertaRubroBasico.LocalReport.SetParameters(parametros);
                rptOfertaRubroBasico.LocalReport.Refresh();

            }
        }
    }
}
