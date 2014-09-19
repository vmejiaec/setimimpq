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


public partial class VER_VER_MANTENIMIENTO_VERSION : PaginaBaseGridKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "VER_MANTENIMIENTO_VERSION"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVVerMantenimientoVersion; }
    }

    protected override GridView Gv
    {
        get { return gvMantenimientoVersion; }
    }

    protected void BtnParMantenimientoMensaje_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        try
        {
            BO_META.VER_MANTENIMIENTO_VERSION(s);
            string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ10RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, bien);

        }
        catch
        {
            string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ14RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, mal);

        }
        
    }
}
