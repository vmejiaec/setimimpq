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

public partial class APU_APU_CLONAR : KPagina
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
    }
    private void cargarBotones()
    {
        lblactual.Text = GetLocalResourceObject("Lbl_ActualRecursoKCG.Text").ToString();        
        lblnuevo.Text = GetLocalResourceObject("Lbl_NuevoRecursoKCG.Text").ToString();
        Aceptar.Text = GetLocalResourceObject("Btn_AceptarRecursoKCG.Text").ToString();
        Aceptar.Text = GetLocalResourceObject("Btn_AceptarRecursoKCG.ToolTip").ToString();
        Cancelar.Text = GetLocalResourceObject("Btn_CancelarRecursoKCG.Text").ToString();
        Cancelar.Text = GetLocalResourceObject("Btn_CancelarRecursoKCG.ToolTip").ToString();
        BtnDenominacion.Text = GetLocalResourceObject("Btn_DenominacionRecursoKCG.Text").ToString();
        BtnDenominacion.ToolTip = GetLocalResourceObject("Btn_DenominacionRecursoKCG.ToolTip").ToString();        
    }
    protected void BtnDenominacion_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/APU/" + Request.QueryString["Dic_Contenedor_Nombre"] + ".aspx");
    }
    protected void Aceptar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/" + Request.QueryString["Dic_Contenedor_Nombre"] + ".aspx?Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/" + Request.QueryString["Dic_Contenedor_Nombre"] + ".aspx?Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    } 

    
}
