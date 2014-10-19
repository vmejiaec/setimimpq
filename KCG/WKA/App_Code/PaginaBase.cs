using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Xml;
using HER;
using System.Collections;


public abstract class PaginaBase: KPagina
{
    //Atributos
    protected abstract string Contenedor { get; }
	protected Color bien = Color.WhiteSmoke;
    protected Color mal = Color.Red;
    //Propiedades
    protected Scope Scope
    {
        get
        {
            if (Session["Scope"] == null) Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            return (Scope)Session["Scope"];
        }
    }
    protected string MemoriaRegistroActual
    {
        get {
            if (Session["MemoriaRegistroActual"] == null) Session["MemoriaRegistroActual"] = "*";
            return (string)Session["MemoriaRegistroActual"];
        }
        set {
            Session["MemoriaRegistroActual"] = value;
        }
    }
    //Métodos
    // Coloca el mensaje en la barra inferior
    protected void AsignarMensaje(string mensaje, Color color)
    {
        ((Label)Master.FindControl("LabelError")).Text = mensaje;
        ((Label)Master.FindControl("LabelError")).Visible = true;
        ((Label)Master.FindControl("LabelError")).ForeColor = color;
    }
    private string ObtenerMensajeError(XmlNode detalleMensajeError)
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
        pre_mensaje = string.Format(pre_mensaje, MensajeError);
        return pre_mensaje;
    }
    //Inicializa la página
    protected override void OnLoad(EventArgs e) //Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Scope.Dic_Contenedor_Nombre = Contenedor;
            // Victor: Añade el título a la página
            Page.Header.Title = this.Contenedor;
        }
    }
    // Extrae del mensaje el resumen del error
    protected string ExtraeMensajeResumen(Exception e)
    {
        string resumen = e.Message;
        string sFinDeLinea = "\n";
        int nFinDeLinea = e.Message.IndexOf(sFinDeLinea);
        resumen = resumen.Substring(
            resumen.IndexOf("--->") + 4,
            nFinDeLinea - resumen.IndexOf("--->") - 4 );
        return resumen;
    }
}