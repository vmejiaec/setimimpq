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

public partial class APU_APU_INDICE : PaginaBaseKCG 
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
        get { return typeof(global::Apu_Indice); }
    }
    
    protected override GridView Gv
    {
        get { return gvapu_indice; }
    }

    protected override FormView Fv
    {
        get { return fvapu_indice; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_indice; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_indice; }
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
        get { return "APU_INDICE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

}
