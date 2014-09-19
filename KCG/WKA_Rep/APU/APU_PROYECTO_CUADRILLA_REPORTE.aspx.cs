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
    public partial class APU_PROYECTO_CUADRILLA_REPORTE : KPaginaReporte
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

            //Formato cantidades
            string numd;
            string numm;
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
            NumberFormatInfo nfi = Thread.CurrentThread.CurrentCulture.NumberFormat;
            numd = nfi.NumberDecimalSeparator;
            numm = nfi.NumberGroupSeparator;

            string Apu_Proyecto_Id = "";
            string Apu_Proyecto_Codigo = "";
            string Apu_Proyecto_Nombre = "";
            decimal Apu_Proyecto_Cuadrilla_Sumatoria = 0;
            decimal Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = 0;
            string Apu_Proyecto_Cadena_Cuadrilla = "";
            decimal Coeficiente = 0;
            decimal Costo_Total = 0;
            string Apu_Cuadrilla_Codigo = "";
            string Apu_Cuadrilla_Diferencia = "";

            if (!IsPostBack)
            {
                Apu_Proyecto_Codigo = Request.QueryString["Apu_Proyecto_Codigo"];
                Txt_Apu_Proyecto_Codigo.Text = Apu_Proyecto_Codigo.ToString();
            }
            else
                Apu_Proyecto_Codigo = Txt_Apu_Proyecto_Codigo.Text;
            // Recupera query string
            Scope s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            if (Apu_Proyecto_Codigo == "")
            {
                Apu_Proyecto_Nombre = "";
                Apu_Proyecto_Cuadrilla_Sumatoria = 0;
                Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = 0;
                Apu_Proyecto_Cadena_Cuadrilla = "";
            }
            else
            {
                DataTable proyectos = RO_Apu_Proyecto.GetByCodigo(s, Apu_Proyecto_Codigo);
                if (proyectos.Rows.Count > 0)
                {
                    Apu_Proyecto_Nombre = (string) (proyectos.Rows[0])["Nombre"];
                    Apu_Proyecto_Id = (string) (proyectos.Rows[0])["ID"];
                    Apu_Proyecto_Cuadrilla_Sumatoria = (decimal)(proyectos.Rows[0])["Cuadrilla_Sumatoria"];
                    lblMensaje.Text = "";
                    Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria =
                        (decimal)(proyectos.Rows[0])["Cuadrilla_Coeficiente_Sumatoria"];
                    Apu_Proyecto_Cadena_Cuadrilla = 
                        (string) (proyectos.Rows[0])["Cadena_Cuadrilla"];
                }
                else
                {
                    Txt_Apu_Proyecto_Codigo.Text = "";
                    lblMensaje.Text = "Codigo de Proyecto no existe";
                }

                try
                {
                    string ApuProyectoId = Request.QueryString["Apu_Proyecto_Id"];

                    List<Apu_Proyecto_Cuadrilla> ltsProyectosC = RO_Apu_Proyecto_Cuadrilla.Adapter.Get(s,ApuProyectoId);
                 
                    Apu_Proyecto_Cuadrilla_Diferencia ProyectosCuadrillaDiferencia = DatosDiferencia(ApuProyectoId);

                    if (ltsProyectosC.Count > 0  && ProyectosCuadrillaDiferencia != null)
                    {
                        string DiferecniaCodigo = ProyectosCuadrillaDiferencia.Apu_Cuadrilla_Codigo;                        
                        for (int j = 0; j < ltsProyectosC.Count; j++)
                        {
                            if (DiferecniaCodigo == ltsProyectosC[j].Apu_Cuadrilla_Codigo)
                            {
                                Costo_Total = (decimal)(ltsProyectosC[j].Costo_Total + ProyectosCuadrillaDiferencia.Costo_Total);
                                Coeficiente = (decimal)(ltsProyectosC[j].Coeficiente + ProyectosCuadrillaDiferencia.Coeficiente);
                                Apu_Cuadrilla_Codigo = ltsProyectosC[j].Apu_Cuadrilla_Codigo;
                                Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria = Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria + ProyectosCuadrillaDiferencia.Coeficiente;
                                Apu_Cuadrilla_Diferencia = ProyectosCuadrillaDiferencia.Apu_Cuadrilla_Codigo;
                                break;
                            }
                        }
                    }
                }
                catch
                {

                }
            }
            Session["Apu_Proyecto_Id"] = Apu_Proyecto_Id;

            // Carga los parametros al reporte
            ReportParameter[] parametros = new ReportParameter[12];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_proyecto_nombre", Apu_Proyecto_Nombre);
            parametros[3] = new ReportParameter("pr_dat_Cuadrilla_Sumatoria", Apu_Proyecto_Cuadrilla_Sumatoria.ToString("N2",nfi));
            parametros[4] = new ReportParameter("pr_dat_Cuadrilla_Coeficiente_Sumatoria", Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria.ToString("N3",nfi));
            parametros[5] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[6] = new ReportParameter("pr_dat_Cadena_Cuadrilla", Apu_Proyecto_Cadena_Cuadrilla.ToString());
            parametros[7] = new ReportParameter("pr_dat_Costo_Total", Costo_Total.ToString("N2",nfi));
            parametros[8] = new ReportParameter("pr_dat_Coeficiente", Coeficiente.ToString());
            parametros[9] = new ReportParameter("pr_dat_Apu_Cuadrilla_Codigo", Apu_Cuadrilla_Codigo.ToString());
            parametros[10] = new ReportParameter("pr_dat_Apu_Cuadrilla_Diferencia", Apu_Cuadrilla_Diferencia.ToString());
            parametros[11] = new ReportParameter("pr_dat_empresa_imagen",ObtenerUrlCompleta(Empresa.Imagen));

            rptCuadrilla.LocalReport.SetParameters(parametros);
            rptCuadrilla.LocalReport.Refresh();

        }

        Apu_Proyecto_Cuadrilla_Diferencia DatosDiferencia(string _Id)
        {
            try
            {
                Scope s = (Scope)Session["Scope"];
                List<Apu_Proyecto_Cuadrilla_Diferencia> ltsProyectosDiferencia = RO_Apu_Proyecto_Cuadrilla_Diferencia.Adapter.GetByProyecto(s,_Id);
                if (ltsProyectosDiferencia.Count == 1)
                    return ltsProyectosDiferencia[0];
                return null; 
            }
            catch
            {
                return null;
            }
        }
    }
}
