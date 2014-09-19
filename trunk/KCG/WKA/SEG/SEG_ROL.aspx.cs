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

public partial class SEG_ROL : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        //base.Page_Load(sender, e);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Seg_Rol); }
    }

    protected override GridView Gv
    {
        get { return gvSegRol; }
    }

    protected override FormView Fv
    {
        get { return fvSegRol; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvSegRol; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvSegRol; }
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
        get { return "SEG_ROL"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
