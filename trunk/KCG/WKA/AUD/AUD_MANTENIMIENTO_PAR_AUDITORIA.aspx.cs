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

public partial class DIC_Aud_Mantenimiento_Par_Auditoria : PaginaBaseGridKCG
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
        get { return "AUD_MANTENIMIENTO_PAR_AUDITORIA"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsAud_Mantenimiento_Par_Auditoria; }
    }

    protected override GridView Gv
    {
        get { return gvAud_Mantenimiento_Par_Auditoria; }
    }

    protected void Btn_Aud_Mantenimiento_Par_Auditoria_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        try
        {
            BO_META.AUD_MANTENIMIENTO_PAR_AUDITORIA(s);

            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, bien);

        }
        catch
        {
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, mal);

        }
    }
}
