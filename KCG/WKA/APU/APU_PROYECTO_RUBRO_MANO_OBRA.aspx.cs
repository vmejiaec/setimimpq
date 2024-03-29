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
using System.Globalization;

public partial class APU_APU_PROYECTO_RUBRO_MANO_OBRA : PaginaBaseKCG 
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
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoRubroManoObra);        
    }

    private void cargarBotones()
    {
        BtnProyectoRubro.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_Obra_RubroRecursoKCG.Text").ToString();
        BtnProyectoRubro.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_Obra_RubroRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuProyectoRubroManoObra(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox cantidad = (TextBox)Fv.FindControl("Cantidad");
            cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_hora_x_cantidad = (TextBox)Fv.FindControl("costo_hora_x_cantidad");
            costo_hora_x_cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_x_rendimiento_hora = (TextBox)Fv.FindControl("costo_x_rendimiento_hora");
            costo_x_rendimiento_hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_hora = (TextBox)Fv.FindControl("costo_hora");
            costo_hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

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
        Control control = fvapu_proyecto_rubro_mano_obra.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvapu_proyecto_rubro_mano_obra.FindControl(idControl);
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
        get { return typeof(global::Apu_Proyecto_Rubro_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return gvapu_proyecto_rubro_mano_obra; }
    }

    protected override FormView Fv
    {
        get { return fvapu_proyecto_rubro_mano_obra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_proyecto_rubro_mano_obra; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_proyecto_rubro_mano_obra; }
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
        get { return "APU_PROYECTO_RUBRO_MANO_OBRA"; }
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
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuProyectoRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuProyectoRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuProyectoRubro_Actual.Apu_Rubro_Unidad));
            param.Add(new DictionaryEntry("rendimiento_mano_obra_hora", ApuProyectoRubro_Actual.Rendimiento_Mano_Obra_Hora));
        }

        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetManoDeObra(string prefixText, int count)
    {
        if (count == 0) count = 10;
        
        Scope s = (Scope) HttpContext.Current.Session["Scope"];
        
        FEL.APU.BO_Apu_Mano_Obra boApuManoObra = new BO_Apu_Mano_Obra();
        List<Apu_Mano_Obra> litApuManoObra = boApuManoObra.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuManoObra.Count && i < count; i++)
        {
            string value = litApuManoObra[i].Id + "||" +
                           litApuManoObra[i].Apu_Categoria_Codigo + "||" +
                           litApuManoObra[i].Apu_Categoria_Nombre + "||" +
                           litApuManoObra[i].Costo_Hora.ToString();

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuManoObra[i].Nombre, value));
        }

        return opciones.ToArray();
    }
    protected void BtnProyectoRubro_Click(object sender, EventArgs e)
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

