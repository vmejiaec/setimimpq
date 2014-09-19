using System;
using System.Web;
using System.Web.UI.WebControls;
using FEL.META;
using Koala.KoalaWebControls;

public partial class APR_APR_MANTENIMIENTO_DOC_ESTADO : PaginaBaseGridKCG
{
    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APR_MANTENIMIENTO_DOC_ESTADO"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsAprMantenimientoEstado; }
    }

    protected override GridView Gv
    {
        get { return gvAprMantenimientoEstado; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_Apr_Mantenimiento_Doc_EstadoRecursoKCG_Click(object sender, EventArgs e)
    {
        Scope s = (Scope) Session["Scope"];

        try
        {
            BO_META.APR_MANTENIMIENTO_DOC_ESTADO(s);
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