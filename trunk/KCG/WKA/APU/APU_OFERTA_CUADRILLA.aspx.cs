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

public partial class APU_APU_OFERTA_CUADRILLA : KPagina
{
    decimal aux;
    protected void Page_Load(object sender, EventArgs e)
    {
        fvMaestroApuOferta.DataBound += new EventHandler(fvMaestroApuOferta_DataBound);
        Btn_Apu_Oferta_Cuadrilla_Listado.Click += new EventHandler(Btn_Apu_Oferta_Cuadrilla_Listado_Click);
    }

    void Btn_Apu_Oferta_Cuadrilla_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void fvMaestroApuOferta_DataBound(object sender, EventArgs e)
    {
        TextBox txtCosto_MO = (TextBox)fvMaestroApuOferta.FindControl("txtCosto_MO");
        CuadrillaSumatoria.Text = fvMaestroApuOferta.DataKey["Cuadrilla_Sumatoria"].ToString();
        //txtCosto_MO.Text = fvMaestroApuOferta.DataKey["Cuadrilla_Sumatoria"].ToString();
        aux = Convert.ToDecimal(CuadrillaSumatoria.Text);
        CuadrillaSumatoria.Text = aux.ToString("N2");
        CuadrillaCoeficienteSumatoria.Text = fvMaestroApuOferta.DataKey["Cuadrilla_Coeficiente_sumatoria"].ToString();


    }
    protected void Btn_Apu_Oferta_Cuadrilla_Reporte_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox OfertaCodigo = (TextBox)fvMaestroApuOferta.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_CUADRILLA_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Oferta_Codigo=" + OfertaCodigo.Text + "&Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"], "_blank", "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Apu_Oferta_Cuadrilla_FormPoli_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA_INDICE.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
