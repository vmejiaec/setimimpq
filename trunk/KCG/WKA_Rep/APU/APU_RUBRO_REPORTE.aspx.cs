using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI.WebControls;
using AEL.APU;
using System.Data;
using BEL;
using REL.APU;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep
{
    public partial class APU_RUBRO_REPORTE : KPaginaReporte
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
           
            
            if (!IsPostBack)
            {                             
                // Recupera query string
                Scope s = Scope_Factory.Get(Request.QueryString);
                Session["Scope"] = s;
                Session["Int_Empresa_Id"] = s.Int_Empresa_Id;
                //Consulta del Nombre del jefe de Proyectos
                DataTable proyectosN = RO_Per_Personal.GetByJefeCostos(s);
                string Apu_Proyecto_JefeCostos = (string)(proyectosN.Rows[0])["Nombre"];
                // Carga los parametros al reporte
                ReportParameter[] parametros = new ReportParameter[6];
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_usuario_nombre", s.Int_Usuario_Nombre);
                parametros[3] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[4] = new ReportParameter("pr_dat_jefecostos", Apu_Proyecto_JefeCostos);
                parametros[5] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

                ReportViewer1.LocalReport.SetParameters(parametros);
               // ReportViewer1.LocalReport.Refresh();
            }
            ddlTitulo.Items.Insert(0, new ListItem("Todas", "0"));
            
                if (ddlTitulo.SelectedValue == "0")
                    odsDatos.FilterExpression = "";
           

            idTituloSeleccionado = ddlTitulo.SelectedValue;
            idSubTituloSeleccionado = ddlSubTitulo.SelectedValue;

            ddlTitulo.SelectedIndexChanged += new EventHandler(ddlTitulo_SelectedIndexChanged);
        }

        void ddlTitulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            idSubTituloSeleccionado="";
        }
       
        private string idTituloSeleccionado = "";
        private string idSubTituloSeleccionado = "";


        protected void ddlTitulo_DataBound(object sender, EventArgs e)
        {            
            ddlTitulo.Items.Insert(0, new ListItem("Todas", "0"));           
            if(!string.IsNullOrEmpty(idTituloSeleccionado))
            {
                ddlTitulo.SelectedValue = idTituloSeleccionado;
            }
            if (ddlTitulo.SelectedValue != "0")
            {
                odsDatos.FilterExpression = "Apu_Titulo_id" + "=" + ddlTitulo.SelectedValue; 
            }             
        }

        protected void ddlSubTitulo_DataBound(object sender, EventArgs e)
        {
            ddlSubTitulo.Items.Insert(0, new ListItem("Todas", "0"));           
            if (!string.IsNullOrEmpty(idSubTituloSeleccionado))
            {
                ddlSubTitulo.SelectedValue = idSubTituloSeleccionado;
            }
            if (ddlSubTitulo.SelectedValue != "0")
            {
                odsDatos.FilterExpression = "Apu_Subtitulo_id" + "=" + ddlSubTitulo.SelectedValue;
            }
            ReportViewer1.LocalReport.Refresh();
        }
    }
}
