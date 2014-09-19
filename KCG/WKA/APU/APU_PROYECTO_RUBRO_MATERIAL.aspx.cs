using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;
using Koala.KoalaWebControls;

public partial class APU_APU_PROYECTO_RUBRO_MATERIAL : PaginaBaseKCG
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
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoRubroMaterial);
        btn_Apu_Proyecto_Rubro.Click += new EventHandler(btn_Apu_Proyecto_RubroClick);
    }

    private void btn_Apu_Proyecto_RubroClick(object sender, EventArgs e)
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

    void Fv_DataBoundApuProyectoRubroMaterial(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox cantidad = (TextBox)Fv.FindControl("Cantidad");
            cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_unitario = (TextBox)Fv.FindControl("costo_unitario");
            costo_unitario.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_total = (TextBox)Fv.FindControl("costo_total");
            costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

            string estado = Request.QueryString["Estado"];
            string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
            if (estado == "BOR" || presupuesto_estado == "PEN")
                HabilitarControl("InsertButton");
            else
                DeshabilitarControl("InsertButton");
        }
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvApuProyectoRubroMaterial.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvApuProyectoRubroMaterial.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
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
        get { return gvApuProyectoRubroMaterial; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoRubroMaterial; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuPoyectoRubroMaterial; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuProyectoRubroMaterial; }
    }

    protected override Button BResponderZoom
    {
        get { return  bResponder; }
    }

    protected override Button BRegreso
    {
        get { return bRegreso; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_RUBRO_MATERIAL"; }
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
            param.Add(new DictionaryEntry("rendimiento_equipo_hora", ApuProyectoRubro_Actual.Rendimiento_Equipo_Hora));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuProyectoRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuProyectoRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuProyectoRubro_Actual.Apu_Rubro_Unidad));
        }
    }
    
    [WebMethod]
    static public string[] GetMaterial(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Material boApuMaterial = new BO_Apu_Material();
        List<Apu_Material> litApuMaterial = boApuMaterial.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuMaterial.Count && i < count; i++)
        {
            string value = litApuMaterial[i].Id + "||" +
                           litApuMaterial[i].Costo_Total.ToString("N4", NumberFormatInfo.CurrentInfo) + "||" +
                           litApuMaterial[i].Unidad;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuMaterial[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
