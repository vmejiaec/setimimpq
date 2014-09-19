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
using FEL.DIC;


public partial class DIC_DIC_MODULO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Modulo); }
    }

    protected override GridView Gv
    {
        get { return GridView1; }
    }

    protected override FormView Fv
    {
        get { return FormView1; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicModulo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicModulo; }
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
        get { return "DIC_MODULO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    private void EtiquetarBotones()
    {
        Atras.Text = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString();
        Atras.ToolTip = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString();
        Atras.AccessKey = HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_AtrasRecursoKCG.AccesKey").ToString();
        Seleccionar.AccessKey = HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_SeleccionarRecursoKCG.AccesKey").ToString();
        Seleccionar.Text = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString();
        Seleccionar.ToolTip = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString();
    }
}
