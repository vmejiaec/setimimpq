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

public partial class APU_APU_PROYECTO_RUBRO_EQUIPO : PaginaBaseKCG
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
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoRubroEquipo);
        btn_Apu_Proyecto_Rubro.Click += new EventHandler(btn_Apu_Proyecto_Rubro_Click);
    }

    void Fv_DataBoundApuProyectoRubroEquipo(object sender, EventArgs e)
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
        Control control = fvApuProyectoRubroEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvApuProyectoRubroEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro_Equipo); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoRubroEquipo; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoRubroEquipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuProyectoRubroEquipo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuProyectoRubroEquipo; }
    }

    protected override Button BResponderZoom
    {
        get { return bResponderZoom; }
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
        get { return "APU_PROYECTO_RUBRO_EQUIPO"; }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            //para la insercion en el sistema
            param.Add(new DictionaryEntry("Apu_Proyecto_Rubro_Id", Request.QueryString["Apu_Proyecto_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Id", Request.QueryString["Apu_Proyecto_Id"]));
            
            // para mostrar al usuario
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", ApuProyectoRubro_Actual.Apu_Proyecto_Codigo));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", ApuProyectoRubro_Actual.Apu_Proyecto_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", ApuProyectoRubro_Actual.Apu_Rubro_Codigo));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", ApuProyectoRubro_Actual.Apu_Rubro_Nombre));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", ApuProyectoRubro_Actual.Apu_Rubro_Unidad));
            param.Add(new DictionaryEntry("rendimiento_equipo_hora", ApuProyectoRubro_Actual.Rendimiento_Equipo_Hora));
        }
    }

    [WebMethod]
    static public string[] GetEquipo(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        BO_Apu_Equipo boApuEquipo = new BO_Apu_Equipo();
        List<Apu_Equipo> litApuEquipo = boApuEquipo.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuEquipo.Count && i < count; i++)
        {
            string value = litApuEquipo[i].Id + "||" +
                           litApuEquipo[i].Costo_Hora.ToString("N4", NumberFormatInfo.CurrentInfo);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuEquipo[i].Nombre, value));
        }
        return opciones.ToArray();
    }
    protected void btn_Apu_Proyecto_Rubro_Click(object sender, EventArgs e)
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
