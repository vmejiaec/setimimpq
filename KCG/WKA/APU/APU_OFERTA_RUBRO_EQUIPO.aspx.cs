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
using System.Web.UI.HtmlControls;
using FEL.APU;
using Koala.KoalaWebControls;
using System.Globalization;

public partial class APU_APU_OFERTA_RUBRO_EQUIPO : PaginaBaseKCG
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
        Btn_Apu_Oferta_Rubro_Equipo_Oferta_Rubro.Click += new EventHandler(Btn_Apu_Oferta_Rubro_Equipo_Oferta_Rubro_Click);
        fvApuOfertaRubroEquipo.DataBound += new EventHandler(fvApuOfertaRubroEquipo_DataBound);        
    }   

    void fvApuOfertaRubroEquipo_DataBound(object sender, EventArgs e)
    {
        if (fvApuOfertaRubroEquipo.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtCosto = (TextBox)fvApuOfertaRubroEquipo.FindControl("Costo");
            txtCosto.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);

            string estado = ApuOferta_Actual.Estado;// Request.QueryString["Estado"];
            string presupuesto_estado = ApuOferta_Actual.Apu_Presupuesto_Estado;// Request.QueryString["Apu_Presupuesto_Estado"];
            if (estado == "BOR" || presupuesto_estado == "PEN")
                HabilitarControl("InsertButton");
            else
                DeshabilitarControl("InsertButton");
        }
    }
    
    private void DeshabilitarControl(string idControl)
    {
        Control control = fvApuOfertaRubroEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvApuOfertaRubroEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    void Btn_Apu_Oferta_Rubro_Equipo_Oferta_Rubro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA_RUBRO.aspx?Apu_Oferta_Id=" +
            Request.QueryString["Apu_Oferta_Id"] +            
            "&Apu_Oferta_Rubro_Id=" + Request.QueryString["Apu_Oferta_Rubro_Id"] +           
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Rubro_Equipo);}
    }

    protected override GridView Gv
    {
        get { return gvApuOfertaRubroEquipo; }
    }

    protected override FormView Fv
    {
        get { return fvApuOfertaRubroEquipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuOfertaRubroEquipo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuOfertaRubroEquipo; }
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
        get { return "APU_OFERTA_RUBRO_EQUIPO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {
        // Parametros de inserción para el sistema
        param.Add(new DictionaryEntry("Apu_Oferta_Rubro_Id", Request.QueryString["Apu_Oferta_Rubro_Id"]));
        param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));
        
        //Parametros de inserción para visualización del usuario
        param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOfertaRubro_Actual.Apu_Oferta_Codigo));// Request.QueryString["Apu_Oferta_Codigo"]));
        param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOfertaRubro_Actual.Apu_Oferta_Nombre)); //Request.QueryString["Apu_Oferta_Nombre"]));
        param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuOfertaRubro_Actual.Apu_Rubro_Codigo)); //Request.QueryString["Apu_Rubro_Codigo"]));
        param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuOfertaRubro_Actual.Apu_Rubro_Nombre)); //Request.QueryString["Apu_Rubro_Nombre"]));
        param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuOfertaRubro_Actual.Apu_Rubro_Unidad));// Request.QueryString["Apu_Rubro_Unidad"]));
        
        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetEquipo(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Equipo boApuEquipo = new BO_Apu_Equipo();
        List<Apu_Equipo> litApuEquipo = boApuEquipo.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuEquipo.Count && i < count; i++)
        {
            string value = litApuEquipo[i].Id;
            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuEquipo[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
