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
    public partial class APU_PROYECTO_RUBRO_TECNICA_REPORTE : KPaginaReporte
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
            string Apu_Proyecto_Id="";
            string Apu_Proyecto_Codigo = "";
            string Apu_Proyecto_Nombre = "";

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
            }
            else
            {
                DataTable proyectos = RO_Apu_Proyecto.GetByCodigo(s, Apu_Proyecto_Codigo);
                if (proyectos.Rows.Count > 0)
                {
                    Apu_Proyecto_Nombre = (string) (proyectos.Rows[0])["Nombre"];
                    Apu_Proyecto_Id = (string) (proyectos.Rows[0])["ID"];
                    lblMensaje.Text = "";
                }
                else
                {
                    Txt_Apu_Proyecto_Codigo.Text = "";
                    lblMensaje.Text = "Codigo de Proyecto no existe";
                }
            }
            Session["Apu_Proyecto_Id"] = Apu_Proyecto_Id;

            // Carga los parametros al reporte
            ReportParameter[] parametros = new ReportParameter[5];
            parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
            parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
            parametros[2] = new ReportParameter("pr_dat_proyecto_nombre", Apu_Proyecto_Nombre);
            parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
            parametros[4] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen)); 

            rptRubroTecnica.LocalReport.SetParameters(parametros);
            rptRubroTecnica.LocalReport.Refresh();

        }
    }
}
