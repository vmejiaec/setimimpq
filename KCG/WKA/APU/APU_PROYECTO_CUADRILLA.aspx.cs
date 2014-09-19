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
using HER;
using System.Globalization;

public partial class APU_APU_PROYECTO_CUADRILLA : KPagina
{
    decimal aux;
    protected void Page_Load(object sender, EventArgs e)
    {
        fvMaestroApuProyecto.DataBound += new EventHandler(fvMaestroApuProyecto_DataBound);

    }

    void fvMaestroApuProyecto_DataBound(object sender, EventArgs e)
    {
        CuadrillaSumatoria.Text = fvMaestroApuProyecto.DataKey["Cuadrilla_Sumatoria"].ToString();
        aux = Convert.ToDecimal(CuadrillaSumatoria.Text);
        CuadrillaSumatoria.Text = aux.ToString("N2");
        CuadrillaCoeficienteSumatoria.Text = fvMaestroApuProyecto.DataKey["Cuadrilla_Coeficiente_sumatoria"].ToString();
    }
    protected void Btn_Reporte_Cuadrilla_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        TextBox ProyectoId = (TextBox)fvMaestroApuProyecto.FindControl("Codigo");
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_CUADRILLA_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId.Text + "&Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"], "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Apu_Proyecto_Cuadrilla_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Formula_Polinomica_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_INDICE.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
