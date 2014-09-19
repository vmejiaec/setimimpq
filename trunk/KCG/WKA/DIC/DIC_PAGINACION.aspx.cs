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

public partial class DIC_DIC_PAGINACION : PaginaBaseKCG
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
        get { return typeof(global::Dic_Paginacion); }
    }

    protected override GridView Gv
    {
        get { return KGrid1; }
    }

    protected override FormView Fv
    {
        get { return FvDicPaginacion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvDicPaginacion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvDicPaginacion; }
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
        get { return "DIC_PAGINACION"; }
    }
}
