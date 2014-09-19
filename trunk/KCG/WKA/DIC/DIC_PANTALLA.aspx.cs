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

public partial class DIC_DIC_PANTALLA : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Pantalla); }
    }

    protected override GridView Gv
    {
        get { return gvdicpantalla; }
    }

    protected override FormView Fv
    {
        get { return fvdicpantalla; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvdicpantalla; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsdicpantalla; }
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
        get { return "DIC_PANTALLA"; }
    }
    
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
