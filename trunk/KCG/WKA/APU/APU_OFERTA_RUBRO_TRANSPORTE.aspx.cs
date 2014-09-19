using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using FEL.APU;
using System.Web.UI.HtmlControls;

public partial class APU_APU_OFERTA_RUBRO_TRANSPORTE : PaginaBaseKCG
{
    public Apu_Oferta ApuOferta_Actual
    {
        get
        {
            if (ViewState["APU_OFERTA"] == null)
                ViewState["APU_OFERTA"] = ObtenerApuOferta();
            return (Apu_Oferta)ViewState["APU_OFERTA"];
        }
    }


    Apu_Oferta ObtenerApuOferta()
    {
        //FEL.APU.BO_Apu_Oferta datos = new BO_Apu_Oferta();
        //return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Apu_Oferta_Id"])[0];
        Apu_Oferta tmpOferta = new Apu_Oferta();
        tmpOferta.Estado = "DIS";
        tmpOferta.Apu_Presupuesto_Estado = "PEN";
        return tmpOferta;
    }

    public Apu_Oferta_Rubro ApuOfertaRubro_Actual
    {
        get
        {
            if (ViewState["APU_OFERTA_RUBRO"] == null)
                ViewState["APU_OFERTA_RUBRO"] = ObtenerApuOfertaRubro();
            return (Apu_Oferta_Rubro)ViewState["APU_OFERTA_RUBRO"];
        }
    }


    Apu_Oferta_Rubro ObtenerApuOfertaRubro()
    {
        FEL.APU.BO_Apu_Oferta_Rubro datos = new BO_Apu_Oferta_Rubro();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Apu_Oferta_Rubro_Id"])[0];

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuOfertaRubro);
    }

    private void cargarBotones()
    {
        RubroButton.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG.Text").ToString();
        RubroButton.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuOfertaRubro(object sender, EventArgs e)
    {        
        string estado = ApuOferta_Actual.Estado;
        string presupuesto_estado = ApuOferta_Actual.Apu_Presupuesto_Estado;
        //if (estado == "BOR" || presupuesto_estado == "PEN")
        //    HabilitarControl("InsertButton");
        //else
        //    DeshabilitarControl("InsertButton");
    }           

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Rubro_Material); }
    }

    protected override GridView Gv
    {
        get { return gvapu_oferta_rubro_transporte; }
    }

    protected override FormView Fv
    {
        get { return fvapu_oferta_rubro_transporte; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_oferta_rubro_transporte; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_oferta_rubro_transporte; }
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
        get { return "APU_OFERTA_RUBRO_TRANSPORTE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Rubro_Id", Request.QueryString["Apu_Oferta_Rubro_Id"]));            
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOfertaRubro_Actual.Apu_Oferta_Codigo));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOfertaRubro_Actual.Apu_Oferta_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuOfertaRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuOfertaRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuOfertaRubro_Actual.Apu_Rubro_Unidad));

        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    protected void RubroButton_Click(object sender, EventArgs e)
    {       
        TextBox Apu_Oferta_Id = (TextBox)Fv.FindControl("Apu_Oferta_Id");       
        Response.Redirect("~/APU/APU_OFERTA_RUBRO.aspx?Apu_Oferta_Rubro_Id=" + 
            Request.QueryString["Apu_Oferta_Rubro_Id"] +
            "&Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +            
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
