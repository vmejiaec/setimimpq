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
using System.Collections.Generic;
using System.Web.Services;
using Koala.KoalaWebControls;
using FEL.APU;
using System.Globalization;

public partial class APU_APU_OFERTA_RUBRO_MATERIAL : PaginaBaseKCG
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
        EtiquetarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtCosto = (TextBox)Fv.FindControl("Costo");
            txtCosto.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);

            string estado = ApuOferta_Actual.Estado;
            string presupuesto_estado = ApuOferta_Actual.Apu_Presupuesto_Estado;
            if (estado == "BOR" || presupuesto_estado == "PEN")
                HabilitarControl("InsertButton");
            else
                DeshabilitarControl("InsertButton");
        }
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvApuOfertaRubroMaterial.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvApuOfertaRubroMaterial.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    private void EtiquetarBotones()
    {
        Btn_Rubro.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Material_Oferta_RubroRecursoKCG.Text").ToString();
        Btn_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Material_Oferta_RubroRecursoKCG.ToolTip").ToString();
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
        get { return gvApuOfertaRubroMaterial; }
    }

    protected override FormView Fv
    {
        get { return fvApuOfertaRubroMaterial; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuOfertaRubroMaterial; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuOfertaRubroMaterial; }
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
        get { return "APU_OFERTA_RUBRO_MATERIAL"; }
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
            param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOfertaRubro_Actual.Apu_Oferta_Codigo));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOfertaRubro_Actual.Apu_Oferta_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuOfertaRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuOfertaRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuOfertaRubro_Actual.Apu_Rubro_Unidad));
        }
    }

    [WebMethod]
    static public string[] GetMaterial(string prefixText, int count)
    {
        if (count == 0) 
            count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Material boApuMaterial = new BO_Apu_Material();
        List<Apu_Material> litApuMaterial = boApuMaterial.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuMaterial.Count && i < count; i++)
        {
            string value = litApuMaterial[i].Id + "||" +
                           litApuMaterial[i].Codigo; 
            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuMaterial[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void Btn_Rubro_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        //TextBox OfertaCodigo = (TextBox)Fv.FindControl("Apu_Oferta_Codigo");
        //TextBox OfdertaNombre = (TextBox)Fv.FindControl("Apu_Oferta_Nombre");
        //TextBox OfertaEtapa = (TextBox)Fv.FindControl("Apu_Oferta_Etapa");
        Response.Redirect("~/APU/APU_OFERTA_RUBRO.aspx?Apu_Oferta_Id=" + OfertaId.Text + 
            //"&Apu_Oferta_Codigo=" + OfertaCodigo.Text +
            //"&Apu_Oferta_Nombre=" + OfdertaNombre.Text + 
            //"&Apu_Oferta_Etapa=" + OfertaEtapa.Text + 
            "&Apu_Oferta_Rubro_Id=" + Request.QueryString["Apu_Oferta_Rubro_Id"] + 
            //"&Estado=" + Request.QueryString["Estado"] +
            //"&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }   
}
