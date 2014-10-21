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
using REL.APU;
using System.Globalization;
using BEL;
using Microsoft.Reporting.WebForms;
using WKA_Rep.DataSet1TableAdapters;

namespace WKA_Rep.APU
{
    public partial class Apu_Proyecto_Oferta_Rubro_Reporte : KPaginaReporte
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
            // Identificadores de los proyecto y las ofertas
            string Apu_Proyecto_Id_A = "";
            string Apu_Proyecto_Codigo_A = "";
            string Apu_Proyecto_Nombre_A = "";
            string Apu_Proyecto_Id_B = "";
            string Apu_Proyecto_Codigo_B = "";
            string Apu_Proyecto_Nombre_B = "";
            string Apu_Oferta_Id_A = "";
            string Apu_Oferta_Codigo_A = "";
            string Apu_Oferta_Nombre_A = "";
            string Apu_Oferta_Id_B = "";
            string Apu_Oferta_Codigo_B = "";
            string Apu_Oferta_Nombre_B = "";
            // Si es la primera vez no hace nada
            if (IsPostBack)
            {
                // Recupera query string
                Scope s = Scope_Factory.Get(Request.QueryString);
                Session["Scope"] = s;
                Session["Ver_Version_Id"] = s.Ver_Version_Id;
                // Recupera los códigos de proyectos y ofertas ingresados por el usuario
                Apu_Proyecto_Codigo_A = Txt_Apu_Proyecto_Codigo_A.Text;
                Apu_Proyecto_Codigo_B = Txt_Apu_Proyecto_Codigo_B.Text;
                Apu_Oferta_Codigo_A = Txt_Apu_Oferta_Codigo_A.Text;
                Apu_Oferta_Codigo_B = Txt_Apu_Oferta_Codigo_B.Text;
                // Consulta el nombre de los proyectos y las ofertas
                Txt_Capitulo.Text = "";
                Apu_Proyecto_Info_ByCodigoTableAdapter taProyInfo =
                    new Apu_Proyecto_Info_ByCodigoTableAdapter();
                WKA_Rep.DataSet1.Apu_Proyecto_Info_ByCodigoDataTable dtProyInfo ;
                dtProyInfo = taProyInfo.GetData(Apu_Proyecto_Codigo_A);
                if (dtProyInfo.Rows.Count > 0)
                {
                    Apu_Proyecto_Nombre_A = (string)(dtProyInfo.Rows[0])["Nombre"];
                    Apu_Proyecto_Id_A = (string)(dtProyInfo.Rows[0])["ID"];
                    Txt_Capitulo.Text = "Proyecto A: " + Apu_Proyecto_Nombre_A + "\n"; 
                }
                dtProyInfo = taProyInfo.GetData(Apu_Proyecto_Codigo_B);
                if (dtProyInfo.Rows.Count > 0)
                {
                    Apu_Proyecto_Nombre_B = (string)(dtProyInfo.Rows[0])["Nombre"];
                    Apu_Proyecto_Id_B = (string)(dtProyInfo.Rows[0])["ID"];
                    Txt_Capitulo.Text += "Proyecto B: " + Apu_Proyecto_Nombre_B + "\n";
                }
                Apu_Oferta_Info_ByCodigoTableAdapter taOferInfo =
                    new Apu_Oferta_Info_ByCodigoTableAdapter();
                WKA_Rep.DataSet1.Apu_Oferta_Info_ByCodigoDataTable dtOferInfo;
                dtOferInfo = taOferInfo.GetData(Apu_Oferta_Codigo_A);
                if (dtOferInfo.Rows.Count > 0)
                {
                    Apu_Oferta_Nombre_A = (string)(dtOferInfo.Rows[0])["Nombre"];
                    Apu_Oferta_Id_A = (string)(dtOferInfo.Rows[0])["ID"];
                    Txt_Capitulo.Text += "Oferta A: " + Apu_Oferta_Nombre_A + "\n";
                }
                dtOferInfo = taOferInfo.GetData(Apu_Oferta_Codigo_B);
                if (dtOferInfo.Rows.Count > 0)
                {
                    Apu_Oferta_Nombre_B = (string)(dtOferInfo.Rows[0])["Nombre"];
                    Apu_Oferta_Id_B = (string)(dtOferInfo.Rows[0])["ID"];
                    Txt_Capitulo.Text += "Oferta B: " + Apu_Oferta_Nombre_B;
                }
                // Pone visible al reporte que en diseño esta false
                rptRubro.Visible = true;
                // Carga los parametros al reporte
                ReportParameter[] parametros = new ReportParameter[5];
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_proyecto_nombre", Txt_Capitulo.Text);
                parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[4] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));
                rptRubro.LocalReport.SetParameters(parametros);
                // Crea los datos a consultar
                Apu_Proyecto_Oferta_Rubro_ByPryOfrTableAdapter taPryOfr = new Apu_Proyecto_Oferta_Rubro_ByPryOfrTableAdapter() ;
                WKA_Rep.DataSet1.Apu_Proyecto_Oferta_Rubro_ByPryOfrDataTable dtPryOfr;
                dtPryOfr = taPryOfr.GetData(s.Ver_Version_Id,
                                            Apu_Proyecto_Codigo_A, Apu_Proyecto_Codigo_B,
                                            Apu_Oferta_Codigo_A, Apu_Oferta_Codigo_B);
                // Carga los datos al reporte
                ReportDataSource rptDatos = new ReportDataSource("DataSet1_Apu_Proyecto_Oferta_Rubro_ByPryOfr",
                                                                (DataTable) dtPryOfr);
                rptRubro.LocalReport.DataSources.Clear();
                rptRubro.LocalReport.DataSources.Add(rptDatos);
                //Llama al reporte
                rptRubro.LocalReport.Refresh();
            }
        }
    }
}