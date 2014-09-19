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
    protected abstract ObjectDataSource odsFV { get; }
    //Atributos
	protected Color bien = Color.WhiteSmoke;
    protected Color mal = Color.WhiteSmoke;
    protected Scope Scope
    { get { return (Scope) Session["Scope"]; } }
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
    //La carga inicial
    //protected override void OnInit(EventArgs e)
    //{
    //    odsFV.Inserting += odsFV_Inserting;
    //}
    //Aumenta el parámetro de Scope
    //private void odsFV_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    //{
    //    DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
    //    e.InputParameters.CopyTo(parametros, 0);
    //    List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
    //    parametrosList.AddRange(parametros);
    //    e.InputParameters.Clear();
    //    if (Session["Scope"] == null) Response.Redirect("~/PAS/PAR_ACCESO.aspx");
    //    e.InputParameters.Add("s", Session["Scope"]);
    //    e.InputParameters.Add("parametros", parametrosList);
    //}
}