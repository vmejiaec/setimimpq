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
using Koala.KoalaWebControls;

public partial class APU_APU_TITULO : PaginaBaseKCG
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
        get { return typeof(global::Apu_Titulo); }
    }

    protected override GridView Gv
    {
        get { return gvApuTitulo; }
    }

    protected override FormView Fv
    {
        get { return fvApuTitulo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVApuTitulo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVApuTitulo; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_TITULO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}