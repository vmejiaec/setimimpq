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
using FEL.META;

public partial class VER_Ver_version : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Ver_Version); }
    }

    protected override GridView Gv
    {
        get { return gvverversion; }
    }

    protected override FormView Fv
    {
        get { return fvverversion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvverversion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsverversion; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "Ver_version"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    //protected void InsertButton_Click(object sender, EventArgs e)
    //{
    //    Scope s = (Scope)Session["Scope"];

    //    try
    //    {
    //        //DropDownList Predeterminada = (DropDownList)fvverversion.FindControl("Predeterminada");
    //        //BO_META.VER_VERSION_EXISTE_REGISTROS(s, Predeterminada.SelectedValue.ToString());
    //        //string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ10RecursoKCG.Text").ToString();
    //        //AsignarMensaje(mensaje, bien);

    //    }
    //    catch
    //    {
    //        string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ14RecursoKCG.Text").ToString();
    //        AsignarMensaje(mensaje, _clrMal);

    //    }
    //}
}