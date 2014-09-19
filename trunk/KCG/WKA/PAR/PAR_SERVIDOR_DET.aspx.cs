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

public partial class PAR_PAR_SERVIDOR_DET :PaginaBaseKCG
{


    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Par_Servidor_Det); }
    }

    protected override GridView Gv
    {
        get { return gvParServidorDet; }
    }

    protected override FormView Fv
    {
        get { return fvParServidorDet; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVParServidorDet; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsParServidorDet; }
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
        get { return "PAR_SERVIDOR_DET"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
