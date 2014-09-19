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

public partial class PAR_PAR_SERVIDOR : PaginaBaseKCG
{
    

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof (global::Par_Servidor); }
    }

    protected override GridView Gv
    {
        get { return gvParServidor; }
    }

    protected override FormView Fv
    {
        get { return fvParServidor; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVParServidor; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVParServidor; }
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
        get { return "PAR_SERVIDOR"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
