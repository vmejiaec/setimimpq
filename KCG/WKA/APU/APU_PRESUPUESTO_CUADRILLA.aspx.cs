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
using System.Collections.Generic;
using FEL.FIS;
using FEL.APU;
using Koala.KoalaWebControls;
using System.Web.Services.Protocols;
using System.Xml;

public partial class APU_APU_PRESUPUESTO_CUADRILLA : PaginaBaseGridKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_Estado.Text = Request.QueryString["Estado"];
        Gv_Apu_Presupuesto_Cuadrilla.DataBound += new EventHandler(Gv_Apu_Presupuesto_Cuadrilla_DataBound);
        pnl_Proyecto.DataBind();
    }

    void Gv_Apu_Presupuesto_Cuadrilla_DataBound(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        string Presupuesto_Estado = Request.QueryString["Estado"];
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.FIS.BO_Fis_Fiscalizacion fisFiscalizacion = new BO_Fis_Fiscalizacion();
        List<Fis_Fiscalizacion> lstFiscalizacion = fisFiscalizacion.GetByFiscalizacion("", s, Presupuesto_Id);
        if (lstFiscalizacion.Count > 0)
        {
            Apu_Origen_Codigo.Text = lstFiscalizacion[0].Apu_Origen_Codigo;
            Codigo_Institucion.Text = lstFiscalizacion[0].Codigo_Institucion;
            Fecha_Ini_Contrato.Text = lstFiscalizacion[0].Fecha_Ini_Contrato.ToString();
            Plazo_Contrato.Text = lstFiscalizacion[0].Plazo_Contrato.ToString();
            Fecha_Fin_Contrato.Text = lstFiscalizacion[0].Fecha_Fin_Contrato.ToString();
            Estado_Nombre.Text = lstFiscalizacion[0].Estado_Nombre;
            Apu_Origen_Nombre.Text = lstFiscalizacion[0].Apu_Origen_Nombre;
            Fecha_Indice_Base.Text = lstFiscalizacion[0].Fecha_Indice_Base.ToString();
            Publicacion_Base.Text = lstFiscalizacion[0].Publicacion_Base;
            Cuadrilla_Coeficiente_Sumatoria.Text = lstFiscalizacion[0].Cuadrilla_Coeficiente_Sumatoria.ToString();
            SRD_x_Coeficiente_Sumatoria.Text = lstFiscalizacion[0].SRD_x_Coeficiente_Sumatoria.ToString("N4");
            SRD_x_Coeficiente_Sumatoria_Rea.Text = lstFiscalizacion[0].SRD_x_Coeficiente_Sumatoria_Rea.ToString("N4");
        }             

        if (txt_Estado.Text == "REA")
        {
            Btn_Formula_Provisional.Visible = false;
            SRD_x_Coeficiente_Sumatoria.Visible = false;
        }
        else
        {
            Btn_Formula_Definitiva.Visible = false;
            SRD_x_Coeficiente_Sumatoria_Rea.Visible = false;
        }
    }

    protected override string Contenedor
    {
        get { return "APU_PRESUPUESTO_CUADRILLA"; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override GridView Gv
    {
        get { return Gv_Apu_Presupuesto_Cuadrilla; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Apu_Presupuesto_Cuadrilla; }
    }

    protected string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
        }
        string pre_mensaje =
            HttpContext.
                GetLocalResourceObject("~/KOALA.master",
                                       CodigoError + "RecursoKCG.Text").ToString();
        pre_mensaje = string.Format(pre_mensaje, MensajeError.Split('|'));
        return pre_mensaje;
    }

    protected void Btn_Presupuesto_Click(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_PRESUPUESTO_PROYECTO.aspx?Apu_Presupuesto_Id=" + Presupuesto_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Formula_Provisional_Click(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_FORMULA.aspx?Apu_Presupuesto_Id=" + Presupuesto_Id + "&Estado=" + estado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }    
}
