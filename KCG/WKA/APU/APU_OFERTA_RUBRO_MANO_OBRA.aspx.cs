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
using FEL.APU;
using System.Web.Services;
using System.Collections.Generic;
using System.Globalization;

public partial class APU_APU_OFERTA_RUBRO_MANO_OBRA : PaginaBaseKCG 
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
        tmpOferta.Estado = "BOR";
        tmpOferta.Apu_Presupuesto_Estado = "PEN";
        tmpOferta.Id = Request.QueryString["Apu_Oferta_Id"];
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
        Control control = fvapu_oferta_rubro_mano_obra.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvapu_oferta_rubro_mano_obra.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    private void cargarBotones()
    {
        BtnOferta.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Mano_Obra_Oferta_RubroRecursoKCG.Text").ToString();
        BtnOferta.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Mano_Obra_Oferta_RubroRecursoKCG.ToolTip").ToString();
    }        

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Rubro_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return gvapu_oferta_rubro_mano_obra; }
    }

    protected override FormView Fv
    {
        get { return fvapu_oferta_rubro_mano_obra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_oferta_rubro_mano_obra; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_oferta_rubro_mano_obra; }
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
        get { return "APU_OFERTA_RUBRO_MANO_OBRA"; }
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
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOfertaRubro_Actual.Apu_Oferta_Codigo));// Request.QueryString["Apu_Oferta_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOfertaRubro_Actual.Apu_Oferta_Nombre));// Request.QueryString["Apu_Oferta_Nombre"]));                        
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuOfertaRubro_Actual.Apu_Rubro_Codigo));// Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuOfertaRubro_Actual.Apu_Rubro_Nombre));// Request.QueryString["Apu_Rubro_Nombre"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuOfertaRubro_Actual.Apu_Rubro_Unidad));// Request.QueryString["Apu_Rubro_Unidad"]));                        
        }

        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetManoDeObra(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Mano_Obra boApuManoObra = new BO_Apu_Mano_Obra();
        List<Apu_Mano_Obra> litApuManoObra = boApuManoObra.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuManoObra.Count && i < count; i++)
        {
            string value = litApuManoObra[i].Id;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuManoObra[i].Nombre, value));
        }

        return opciones.ToArray();
    }

    protected void BtnOferta_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");        
        Response.Redirect("~/APU/APU_OFERTA_RUBRO.aspx?Apu_Oferta_Id=" + OfertaId.Text +             
            "&Apu_Oferta_Rubro_Id=" + Request.QueryString["Apu_Oferta_Rubro_Id"] +            
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }  
}