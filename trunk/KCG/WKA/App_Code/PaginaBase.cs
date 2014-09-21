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
    //Atributos abstractos
    protected abstract GridView Gv { get; }
    protected abstract FormView Fv { get; }
    protected abstract ObjectDataSource odsGv { get; }
    protected abstract ObjectDataSource odsFv { get; }
    protected abstract ObjectDataSource odsGvById { get; }
    
    protected abstract string Contenedor { get; }
    //Atributos
	protected Color bien = Color.WhiteSmoke;
    protected Color mal = Color.WhiteSmoke;
    //Propiedades
    protected Scope Scope
    {
        get
        {
            if (Session["Scope"] == null) Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            return (Scope)Session["Scope"];
        }
    }
    //Métodos
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
        }
    }
}