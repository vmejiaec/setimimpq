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
using FEL.FIS;
using System.Collections.Generic;
using Koala.KoalaWebControls;
using System.Web.Services.Protocols;
using System.Xml;
using FEL.APU;


public partial class APU_APU_PRESUPUESTO_FORMULA : PaginaBaseGridKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_Estado.Text = Request.QueryString["Estado"];
        pnl_Proyecto.DataBind();
        Gv_Apu_Presupuesto_Formula.DataBound += new EventHandler(Gv_Apu_Presupuesto_Formula_DataBound);
    }

    void Gv_Apu_Presupuesto_Formula_DataBound(object sender, EventArgs e)
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
            Coeficiente_Sumatoria.Text = lstFiscalizacion[0].Coeficiente_Sumatoria.ToString("N4");
        }

        if (lstFiscalizacion[0].Fiscalizador_Per_Personal_Id == s.Per_Personal_Id)
        {
            if  ((lstFiscalizacion[0].Estado == "EJE" && Presupuesto_Estado == "DIS") || (lstFiscalizacion[0].Estado == "REA" && Presupuesto_Estado == "REA"))
                Btn_Publicacion.Enabled = true;
            else
                Btn_Publicacion.Enabled = false;
        }
        else
            Btn_Publicacion.Enabled = false;

        if (txt_Estado.Text == "REA")
            Btn_Cuadrilla.Visible = false;
        else
            Btn_Cuadrilla_Definitiva.Visible = false;
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

    protected void Btn_Cuadrilla_Click(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_CUADRILLA.aspx?Apu_Presupuesto_Id=" + Presupuesto_Id + "&Estado=" + estado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Publicacion_Click(object sender, EventArgs e)
    {
        Boolean respuesta;
        string mensaje = "";

        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        string estado = Request.QueryString["Estado"];
        try
        {
            FEL.APU.BO_Apu_Presupuesto_Formula ApuPresupuesto_Formula = new BO_Apu_Presupuesto_Formula();

            respuesta = ApuPresupuesto_Formula.Obtener_Publicacion(s, Presupuesto_Id, estado);
            if (respuesta)
            {
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
            }

        }
        catch (Exception ex)
        {
            SoapException ed = (SoapException)ex;
            mensaje = ObtenerMensajeError(ed.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
        }

       
    }

    protected override string Contenedor
    {
        get { return "APU_PRESUPUESTO_FORMULA"; }
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override GridView Gv
    {
        get { return Gv_Apu_Presupuesto_Formula; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Apu_Presupuesto_Formula; }
    }
}
