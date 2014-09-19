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

public partial class DIC_DIC_ROTULO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        cargarBotones();
    }
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Rotulo); }
    }

    protected override GridView Gv
    {
        get { return gvDicRotulo; }
    }

    protected override FormView Fv
    {
        get { return fvDicRotulo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicRotulo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicRotulo; }
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
        get { return "DIC_ROTULO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    private void cargarBotones()
    {
        BtnEtiqueta.Text = GetLocalResourceObject("Btn_Dic_Rotulo_EtiquetaRecursoKCG.Text").ToString();
        BtnEtiqueta.ToolTip = GetLocalResourceObject("Btn_Dic_Rotulo_EtiquetaRecursoKCG.ToolTip").ToString();
    }
    protected void BtnEtiqueta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/VER/VER_ETIQUETA.aspx?");
    }
}
