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

public partial class APU_APU_OFERTA_INDICE : KPagina
{
    decimal auxSum = 0, auxCoe = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        fvMaestroApuOferta.DataBound += new EventHandler(fvMaestroApuOferta_DataBound);
        Btn_Apu_Oferta_Indice_Cuadrilla.Click += new EventHandler(Btn_Apu_Oferta_Indice_Cuadrilla_Click);
        Btn_Apu_Oferta_Indice_Oferta_Listado.Click += new EventHandler(Btn_Apu_Oferta_Indice_Oferta_Listado_Click);
    }

    void Btn_Apu_Oferta_Indice_Cuadrilla_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA_CUADRILLA.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void Btn_Apu_Oferta_Indice_Oferta_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void fvMaestroApuOferta_DataBound(object sender, EventArgs e)
    {
        IndiceSumatoria.Text = fvMaestroApuOferta.DataKey["Indice_Sumatoria"].ToString();
        auxSum = Convert.ToDecimal(IndiceSumatoria.Text);
        IndiceSumatoria.Text = auxSum.ToString("N2");
        CoeficienteSumatoria.Text = fvMaestroApuOferta.DataKey["Coeficiente_Sumatoria"].ToString();
        auxCoe = Convert.ToDecimal(CoeficienteSumatoria.Text);
        CoeficienteSumatoria.Text = auxCoe.ToString("N3");
    }
    protected void Btn_Apu_Oferta_Indice_Reporte_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox OfertaCodigo = (TextBox)fvMaestroApuOferta.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_INDICE_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + 
            "&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            "&Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"], "_blank", "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Apu_Oferta_Indice_Equipo_Click(object sender, EventArgs e)
    {
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_EQUIPO.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] + 
            "&Estado=" + estado +
            "&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Oferta_Indice_Material_Click(object sender, EventArgs e)
    {
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_MATERIAL.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] + 
            "&Estado=" + estado +
            "&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Oferta_Indice_Transporte_Click(object sender, EventArgs e)
    {
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_TRANSPORTE.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] + 
            "&Estado=" + estado +
            "&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void BtnOferta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA.aspx?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
