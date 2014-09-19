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

public partial class APU_APU_PROYECTO_INDICE : KPagina
{
    decimal auxInd = 0, auxCoe = 0; 
    protected void Page_Load(object sender, EventArgs e)
    {
        fvMaestroApuProyecto.DataBound += new EventHandler(fvMaestroApuProyecto_DataBound);
        Btn_Apu_Proyecto_Indice_Cuadrilla.Click += new EventHandler(Btn_Apu_Proyecto_Indice_Cuadrilla_Click);       
    }

    void Btn_Apu_Proyecto_Indice_Cuadrilla_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_CUADRILLA.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void fvMaestroApuProyecto_DataBound(object sender, EventArgs e)
    {
        IndiceSumatoria.Text = fvMaestroApuProyecto.DataKey["Indice_Sumatoria"].ToString();
        auxInd = Convert.ToDecimal(IndiceSumatoria.Text);
        IndiceSumatoria.Text = auxInd.ToString("N4");
        CoeficienteSumatoria.Text = fvMaestroApuProyecto.DataKey["Coeficiente_Sumatoria"].ToString();
        auxCoe = Convert.ToDecimal(CoeficienteSumatoria.Text);
        CoeficienteSumatoria.Text = auxCoe.ToString("N3");
    }
    protected void Btn_Reporte_Indice_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];       
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        TextBox ProyectoId = (TextBox)fvMaestroApuProyecto.FindControl("Codigo");
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_INDICE_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId.Text + "&Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"], "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Apu_Proyecto_Indice_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Equipo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_FORMULA_EQUIPO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] + 
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Material_click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_FORMULA_MATERIAL.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] + 
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Transporte_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_FORMULA_TRANSPORTE.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] + 
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}

