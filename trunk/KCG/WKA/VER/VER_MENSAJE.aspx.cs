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

public partial class VER_VER_MENSAJE :PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Ver_Mensaje); }
    }

    protected override GridView Gv
    {
        get { return gvVerMensaje; }
    }

    protected override FormView Fv
    {
        get { return fvVerMensaje; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvVerMensaje; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvVerMensaje; }
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
        get { return "VER_MENSAJE"; }
    }


    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
