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

public partial class INT_INT_MANTENIMIENTO_SUCURSAL : PaginaBaseGridKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
    }


    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "INT_MANTENIMIENTO_SUCURSAL"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsint_mant_sucursal; }
    }

    protected override GridView Gv
    {
        get { return gvint_mant_sucursal; }
    }


    //protected void Btn_Int_Mantenimiento_Sucursal(object sender, EventArgs e)
    //{
    //    Scope s = (Scope)Session["Scope"];

    //    try
    //    {
    //        BO_META.INT_MANTENIMIENTO_SUCURSAL(s);

    //        string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
    //        AsignarMensaje(mensaje, bien);

    //    }
    //    catch
    //    {
    //        string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();
    //        AsignarMensaje(mensaje, mal);

    //    }
    //}
}
