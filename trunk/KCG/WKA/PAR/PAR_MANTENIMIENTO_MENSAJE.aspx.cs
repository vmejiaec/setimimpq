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
using Koala.KoalaWebControls;

public partial class PAR_PAR_MANTENIMIENTO_MENSAJE : PaginaBaseGridKCG
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
        get { return "PAR_MANTENIMIENTO_MENSAJE"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsParMantenimientoMensaje; }
    }

    protected override GridView Gv
    {
        get { return gvParMantenimientoMensaje; }
    }

    protected void BtnParMantenimientoMensaje_Click(object sender, EventArgs e)
    {
        Scope s = (Scope)Session["Scope"];
        try
        {
            BO_META.PAR_MANTENIMIENTO_MENSAJE(s);
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, bien);

        }
        catch
        {
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, mal);

        }
    }
    protected void gvParMantenimientoMensaje_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
