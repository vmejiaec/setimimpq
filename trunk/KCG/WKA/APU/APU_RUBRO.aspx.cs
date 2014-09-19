using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;
using System.Text;
using System.Globalization;
using HER;

public partial class APU_APU_RUBRO : PaginaBaseFormView  
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        // Busca el id del rubro y decide si edita o crea nuevo.
        string Apu_Rubro_Id = Request.QueryString.Get("Apu_Rubro_Id");
        if( Apu_Rubro_Id != null )
            fvapu_rubro.DefaultMode = FormViewMode.ReadOnly;
        Fv.DataBound += new EventHandler(Fv_DataBoundApuRubro);
    }

    void Fv_DataBoundApuRubro(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtRendimiento_Equipo = (TextBox)Fv.FindControl("Rendimiento_Equipo");
            txtRendimiento_Equipo.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox txtRendimiento_Mano_Obra = (TextBox)Fv.FindControl("Rendimiento_Mano_Obra");
            txtRendimiento_Mano_Obra.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Rubro); }
    }

    protected override FormView Fv
    {
        get { return fvapu_rubro; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_rubro ; }
    }

    protected override string Contenedor
    {
        get { return "APU_RUBRO"; }
    }    

    protected void Especificacion_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Unidad");
        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_TECNICA.aspx?Apu_Rubro_Id=" + RubroId.Text + 
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void BtnClonar_Click(object sender, EventArgs e)
    {

        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_CLONAR.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + RubroId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }

    protected void BtnEquipo_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Unidad");
        TextBox RubroEquipo = (TextBox)Fv.FindControl("Rendimiento_Equipo_Hora");
        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_EQUIPO.aspx?Apu_Rubro_Id=" + RubroId.Text +
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text +
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&apu_rubro_rendimiento_Equipo_Hora=" + RubroEquipo.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
        
    }
    protected void BtnManoObra_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Unidad");
        TextBox RubroManoObraHora = (TextBox)Fv.FindControl("Rendimiento_Mano_Obra_Hora");
        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_MANO_OBRA.aspx?Apu_Rubro_Id=" + RubroId.Text +
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + nombre + 
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&apu_rubro_rendimiento_mano_obra_hora=" + RubroManoObraHora.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }
    protected void BtnMateriales_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Unidad");
        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_MATERIAL.aspx?Apu_Rubro_Id=" + RubroId.Text +
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void BtnTransporte_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Unidad");
        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_TRANSPORTE.aspx?Apu_Rubro_Id=" + RubroId.Text + 
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void Disponible_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList ddlDisponible = (DropDownList)sender;
            ddlDisponible.SelectedValue = "S";
        }
    }
    protected void BtnRubroListado_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Id");
        string srtRubroId = RubroId.Text;
        Response.Redirect("~/APU/APU_LISTADO_RUBRO.aspx?Apu_Rubro_Id=" + srtRubroId +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void BtnAnalisisConPrecios_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_RUBRO_INSUMO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Rubro_Codigo=" + RubroCodigo.Text, "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void BtnReporteBasico_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_RUBRO_INSUMO_BASICO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Rubro_Codigo=" + RubroCodigo.Text, "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void BtnReporteAPU_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_RUBRO_ANALISIS_UNITARIO.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Rubro_Codigo=" + RubroCodigo.Text, "_blank", "scrollbars=yes, resizable=yes");
    }
}
