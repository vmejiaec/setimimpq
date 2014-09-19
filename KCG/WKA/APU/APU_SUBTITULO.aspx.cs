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

public partial class APU_APU_SUBTITULO : PaginaBaseKCG
{
    string sValor = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sValor = Request.QueryString["valorZoom"];
            Session.Add("sNombre", sValor);
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Subtitulo); }
    }

    protected override GridView Gv
    {
        get { return gvAPUSubtitulo; }
    }

    protected override FormView Fv
    {
        get { return fvApuSubTitulo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVApuSubtitulo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVApuSubTitulo; }
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
        get { return  kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_SUBTITULO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
