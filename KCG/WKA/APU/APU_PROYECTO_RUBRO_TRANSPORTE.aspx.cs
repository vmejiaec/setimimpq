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
using FEL.APU;

public partial class APU_APU_PROYECTO_RUBRO_TRANSPORTE : PaginaBaseKCG
{
    public Apu_Proyecto_Rubro ApuProyectoRubro_Actual
    {
        get
        {
            if (ViewState["APU_PROYECTO_RUBRO"] == null)
                ViewState["APU_PROYECTO_RUBRO"] = ObtenerApuProyectoRubro();
            return (Apu_Proyecto_Rubro)ViewState["APU_PROYECTO_RUBRO"];
        }
    }


    Apu_Proyecto_Rubro ObtenerApuProyectoRubro()
    {
        FEL.APU.BO_Apu_Proyecto_Rubro datos = new BO_Apu_Proyecto_Rubro();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Apu_Proyecto_Rubro_Id"])[0];

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        EtiquetarBotones();
    }

    private void EtiquetarBotones()
    {
        Btn_Rubro.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Transporte_RubroRecursoKCG.Text").ToString();
        Btn_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Transporte_RubroRecursoKCG.ToolTip").ToString();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro_Material); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoRubroTransporte; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoRubroTransporte; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuProyectoRubroTransporte; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuProyectoRubroTransporte; }
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
        get { return "APU_PROYECTO_RUBRO_TRANSPORTE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Rubro_Id", Request.QueryString["Apu_Proyecto_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Id", Request.QueryString["Apu_Proyecto_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", ApuProyectoRubro_Actual.Apu_Proyecto_Codigo));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", ApuProyectoRubro_Actual.Apu_Proyecto_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuProyectoRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuProyectoRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuProyectoRubro_Actual.Apu_Rubro_Unidad));
        }
    }

    protected void Btn_Rubro_Click(object sender, EventArgs e)
    {        
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx" +
            "?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] +
            "&Apu_Proyecto_Rubro_Id=" + Request.QueryString["Apu_Proyecto_Rubro_Id"] +
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
