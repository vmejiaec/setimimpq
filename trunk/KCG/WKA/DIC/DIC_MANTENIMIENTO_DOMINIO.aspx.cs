using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.DIC;
using FEL.META;
using FEL.VER;

public partial class DIC_DIC_MANTENIMIENTO_DOMINIO : PaginaBaseGridKCG
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
        get { return "DIC_MANTENIMIENTO_DOMINIO"; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicMantenimientoDominio; }
    }

    protected override GridView Gv
    {
        get { return gvDicMantenimiento; }
    }

    protected void btnEjecutarProceso_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        try
        {
            BO_META.DIC_MANTENIMIENTO_DOMINIO(s);

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
