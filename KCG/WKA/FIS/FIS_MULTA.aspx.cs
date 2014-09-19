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

public partial class FIS_FIS_MULTA : PaginaBaseKCG
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
        get { return typeof(global::Fis_Multa); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Multa; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Multa; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Multa; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Multa; }
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
        get { return KFiltro; }
    }

    protected override string Contenedor
    {
        get { return "FIS_MULTA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
