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

public partial class VER_VER_DOMINIO : PaginaBaseKCG
{
    

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Ver_Dominio); }
    }

    protected override GridView Gv
    {
        get { return gvVerDominio; }
    }

    protected override FormView Fv
    {
        get { return fvVerDominio; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVVerDominio; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVVerDominio; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        //base.Page_Load(sender, e);
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "VER_DOMINIO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
