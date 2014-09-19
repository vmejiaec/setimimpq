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

public partial class APR_APR_MANTENIMIENTO_DOCUMENTO :PaginaBaseGridKCG
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
        get { return "APR_MANTENIMIENTO_DOCUMENTO"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsAprMantenimientoDocumento; }
    }

    protected override GridView Gv
    {
        get { return gvAprMantenimientoDocumento; }
    }

    protected void btnAprMantenimientoDocumento_Click(object sender, EventArgs e)
    {
        Scope s = (Scope)Session["Scope"];

        try
        {
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
