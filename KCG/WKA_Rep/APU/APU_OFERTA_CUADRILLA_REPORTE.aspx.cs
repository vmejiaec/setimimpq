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
    public partial class APU_OFERTA_CUADRILLA_REPORTE : KPaginaReporte
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarReporte();
        }

        Apu_Oferta_Cuadrilla_Diferencia DatosDiferencia(string _Id)
        {
            try
            {
                Scope s = (Scope)Session["Scope"];
                List<Apu_Oferta_Cuadrilla_Diferencia> ltsProyectosDiferencia = RO_Apu_Oferta_Cuadrilla_Diferencia.Adapter.GetByOferta(s, _Id);
                if (ltsProyectosDiferencia.Count == 1)
                    return ltsProyectosDiferencia[0];
                return null;
            }
            catch
            {
                return null;
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

            //Formato para cantidades
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            string Apu_Oferta_Id = "";
            string Apu_Oferta_Codigo = "";
            string Apu_Oferta_Nombre = "";
            decimal Apu_Proyecto_Cuadrilla_Sumatoria = 0;
            decimal Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = 0;
            string Apu_Oferta_Cadena_Cuadrilla = "";
            decimal Coeficiente = 0;
            decimal Costo_Total = 0;
            string Apu_Cuadrilla_Codigo = "";
            string Apu_Cuadrilla_Diferencia = "";

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
                Apu_Proyecto_Cuadrilla_Sumatoria = 0;
                Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = 0;
                Apu_Oferta_Cadena_Cuadrilla = "";
            }
            else
            {
                DataTable ofertas = RO_Apu_Oferta.GetByCodigo(s, Apu_Oferta_Codigo);
                if (ofertas.Rows.Count > 0)
                {
                    Apu_Oferta_Nombre = (string)(ofertas.Rows[0])["Nombre"];
                    Apu_Oferta_Id = (string)(ofertas.Rows[0])["Id"];
                    Apu_Proyecto_Cuadrilla_Sumatoria = (decimal)(ofertas.Rows[0])["Cuadrilla_Sumatoria"];
                    Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = (decimal)(ofertas.Rows[0])["Cuadrilla_Coeficiente_Sumatoria"];
                    Apu_Oferta_Cadena_Cuadrilla = (string)(ofertas.Rows[0])["Cadena_Cuadrilla"];
                    lblMensaje.Text = "";
                }
                else
                {
                    Txt_Apu_Oferta_Codigo.Text = "";
                    lblMensaje.Text = "Codigo de Oferta no existe";
                }

                try
                {
                    string ApuOfetaId = Request.QueryString["Apu_Oferta_Id"];

                    List<Apu_Oferta_Cuadrilla> ltsOfertasC = RO_Apu_Oferta_Cuadrilla.Adapter.Get(s, ApuOfetaId);
                    Apu_Oferta_Cuadrilla_Diferencia OfertasCuadrillaDiferencia = DatosDiferencia(ApuOfetaId);

                    if (ltsOfertasC.Count > 0 && OfertasCuadrillaDiferencia != null)
                    {
                        string DiferecniaCodigo = OfertasCuadrillaDiferencia.Apu_Cuadrilla_Codigo;
                        for (int j = 0; j < ltsOfertasC.Count; j++)
                        {
                            if (DiferecniaCodigo == ltsOfertasC[j].Apu_Cuadrilla_Codigo)
                            {
                                Costo_Total = (decimal)(ltsOfertasC[j].Costo_Total + OfertasCuadrillaDiferencia.costo_total);
                                Coeficiente = (decimal)(ltsOfertasC[j].Coeficiente + OfertasCuadrillaDiferencia.Coeficiente);
                                Apu_Cuadrilla_Codigo = ltsOfertasC[j].Apu_Cuadrilla_Codigo;
                                Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria + OfertasCuadrillaDiferencia.Coeficiente;
                                Apu_Cuadrilla_Diferencia = OfertasCuadrillaDiferencia.Apu_Cuadrilla_Codigo;
                                break;
                            }
                        }
                    }
                }
                catch
                {

                }
            }
            Session["Apu_Oferta_Id"] = Apu_Oferta_Id;

            // Carga los parametros al reporte
            ReportParameter[] parametros = new ReportParameter[12];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_oferta_nombre", Apu_Oferta_Nombre);
            parametros[3] = new ReportParameter("pr_dat_Cuadrilla_Sumatoria", Apu_Proyecto_Cuadrilla_Sumatoria.ToString("N2", nfi));
            parametros[4] = new ReportParameter("pr_dat_Cuadrilla_Coeficiente_Sumatoria", Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria.ToString("N3", nfi));
            parametros[5] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[6] = new ReportParameter("pr_dat_Cadena_Cuadrilla", Apu_Oferta_Cadena_Cuadrilla.ToString());
            parametros[7] = new ReportParameter("pr_dat_Costo_Total", Costo_Total.ToString("N2", nfi));
            parametros[8] = new ReportParameter("pr_dat_Coeficiente", Coeficiente.ToString("N3", nfi));
            parametros[9] = new ReportParameter("pr_dat_Apu_Cuadrilla_Codigo", Apu_Cuadrilla_Codigo.ToString());
            parametros[10] = new ReportParameter("pr_dat_Apu_Cuadrilla_Diferencia", Apu_Cuadrilla_Diferencia.ToString());
            parametros[11] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));


            rptOfertaCuadrilla.LocalReport.SetParameters(parametros);
            rptOfertaCuadrilla.LocalReport.Refresh();
        }
    }
}
