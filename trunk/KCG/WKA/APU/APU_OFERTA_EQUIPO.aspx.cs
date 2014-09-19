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
using Koala.KoalaWebControls;

public partial class APU_APU_OFERTA_EQUIPO : PaginaBaseKCG
{
    bool Seleccionar_ = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        gvMaestroApuOfertaEquipo.SelectedIndexChanged += new EventHandler(gvMaestroApuOfertaEquipo_SelectedIndexChanged);
        gvMaestroApuOfertaEquipo.DataBound += new EventHandler(gvMaestroApuOfertaEquipo_DataBound);

        fvDetalleApuOfertaEquipo.DataBound += new EventHandler(fvDetalleApuOfertaEquipo_DataBound);
        Btn_Apu_Oferta_Equipo_Formula.Click += new EventHandler(Btn_Apu_Oferta_Equipo_FormulaClick);
        gvDetalleApuOfertaEquipo.DataBound += new EventHandler(gvDetalleApuOfertaEquipo_DataBound);
        Fv.DataBound += new EventHandler(Fv_DataBound);
        fvDetalleApuOfertaEquipo.ModeChanging += new FormViewModeEventHandler(fvDetalleApuOfertaEquipo_ModeChanging);
    }

    void fvDetalleApuOfertaEquipo_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Insert || e.NewMode == FormViewMode.Edit)
        {
            gvDetalleApuOfertaEquipo.SelectedIndex = -1;
            Seleccionar_ = false;
        }
    }

    void gvDetalleApuOfertaEquipo_DataBound(object sender, EventArgs e)
    {
        if (gvDetalleApuOfertaEquipo.Rows.Count == 0)
            fvDetalleApuOfertaEquipo.ChangeMode(FormViewMode.Insert);

        else
        {
            if (Seleccionar_)
                detSeleccionItemGrid();
        }        
    }

    void detSeleccionItemGrid()
    {
        if (gvDetalleApuOfertaEquipo.SelectedIndex < gvDetalleApuOfertaEquipo.Rows.Count)
        {
            if (gvDetalleApuOfertaEquipo.Rows.Count > 0)
            {
                if (gvDetalleApuOfertaEquipo.SelectedIndex < 0)
                    gvDetalleApuOfertaEquipo.SelectedIndex = 0;
                fvDetalleApuOfertaEquipo.DefaultMode = FormViewMode.ReadOnly;
                fvDetalleApuOfertaEquipo.ChangeMode(FormViewMode.ReadOnly);
                AsignarParametrosDataSourceDeatailsView(gvDetalleApuOfertaEquipo.SelectedDataKey["Id"].ToString());
            }
        }
        else
        {
            if (gvDetalleApuOfertaEquipo.Rows.Count > 0)
            {
                gvDetalleApuOfertaEquipo.SelectedIndex = 0;
                fvDetalleApuOfertaEquipo.DefaultMode = FormViewMode.ReadOnly;
                fvDetalleApuOfertaEquipo.ChangeMode(FormViewMode.ReadOnly);
                AsignarParametrosDataSourceDeatailsView(gvDetalleApuOfertaEquipo.SelectedDataKey["Id"].ToString());
            }
            else
                gvDetalleApuOfertaEquipo.SelectedIndex = -1;
        }   
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox Porcentaje = (TextBox)Fv.FindControl("Porcentaje");
            Porcentaje.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Indice = (TextBox)Fv.FindControl("Costo_Indice");
            Costo_Indice.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
         }
    }

    void Btn_Apu_Oferta_Equipo_FormulaClick (object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA_INDICE.aspx?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Listado_Oferta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void gvMaestroApuOfertaEquipo_DataBound(object sender, EventArgs e)
    {
        if(gvMaestroApuOfertaEquipo.SelectedIndex != -1 )
        {
            //gvMaestroApuOfertaEquipo.DataBind();
            Suma_porcentaje_Equipo_Indice.Text =
                gvMaestroApuOfertaEquipo.SelectedDataKey["Suma_porcentaje_Equipo_Indice"].ToString();
        }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (gvMaestroApuOfertaEquipo.SelectedIndex != -1)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Equipo_Id", gvMaestroApuOfertaEquipo.SelectedValue));
            param.Add(
                new DictionaryEntry("Apu_Oferta_Equipo_Costo_Total", gvMaestroApuOfertaEquipo.SelectedRow.Cells[3].Text));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    void fvDetalleApuOfertaEquipo_DataBound(object sender, EventArgs e)
    {
        InicializarPagina();
        //if (Request.QueryString["Apu_Oferta_Etapa"] == "CON" && fvDetalleApuOfertaEquipo.Enabled)
        //{
        //    switch (fvDetalleApuOfertaEquipo.CurrentMode)
        //    {
        //        case FormViewMode.Insert:
        //            DeshabilitarControl("InsertButton");
        //            DeshabilitarControl("InsertCancelButton");
        //            EstablecerTextBoxEnReadOnly("Porcentaje");
        //            EstablecerTextBoxEnReadOnly("Apu_Indice_Nombre");
        //            break;
        //        case FormViewMode.ReadOnly:
        //            DeshabilitarControl("EditButton");
        //            DeshabilitarControl("DeleteButton");
        //            DeshabilitarControl("NewButton");
        //            break;
        //    }

        //}

        string estado = Request.QueryString["Estado"];
        string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
        if (estado == "BOR" || presupuesto_estado == "PEN")
            HabilitarControl("InsertButton");
        else
            DeshabilitarControl("InsertButton");
    }    

    private void HabilitarControl(string idControl)
    {
        Control control = fvDetalleApuOfertaEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    private void InicializarPagina()
    {
        if (!IsPostBack)
        {
            EstablecerTextBoxEnReadOnly("Porcentaje");
            EstablecerTextBoxEnReadOnly("Apu_Indice_Nombre");
            fvDetalleApuOfertaEquipo.Enabled = false;
            gvDetalleApuOfertaEquipo.Enabled = false;
            nav.Enabled = false;
            kftFiltro.Enabled = false;
        }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);        
    }

    private void EstablecerTextBoxEnReadOnly(string idTextBox)
    {
        Control control = Fv.FindControl(idTextBox);
        TextBox txbControl = (TextBox)control;
        txbControl.ReadOnly = true;
        txbControl.CssClass = "";
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }
    }

    void gvMaestroApuOfertaEquipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        fvDetalleApuOfertaEquipo.Enabled = true;
        gvDetalleApuOfertaEquipo.Enabled = true;
        nav.Enabled = true;
        kftFiltro.Enabled = true;
        
        if (gvMaestroApuOfertaEquipo.SelectedIndex == -1)
        {
            fvDetalleApuOfertaEquipo.Enabled = false;
            gvDetalleApuOfertaEquipo.Enabled = false;
            nav.Enabled = false;
            kftFiltro.Enabled = false;
        }
        
        fvDetalleApuOfertaEquipo.ChangeMode(FormViewMode.Insert);
        fvDetalleApuOfertaEquipo.DefaultMode = FormViewMode.Insert;
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(Apu_Oferta_Equipo_Indice); }
    }

    protected override GridView Gv
    {
        get { return gvDetalleApuOfertaEquipo; }
    }

    protected override FormView Fv
    {
        get { return fvDetalleApuOfertaEquipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvDetalleApuOfertaEquipo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvDetalleApuOfertaEquipo; }
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
        get { return "APU_OFERTA_EQUIPO"; }
    }

    [WebMethod]
    static public string[] GetIndiceEquipo(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Indice_Equipo boApuIndiceEquipo = new FEL.APU.BO_Apu_Indice_Equipo();
        List<Apu_Indice_Equipo> litApuIndiceEquipo = boApuIndiceEquipo.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuIndiceEquipo.Count && i < count; i++)
        {
            string value = litApuIndiceEquipo[i].Apu_Indice_Id + "||" +
                           litApuIndiceEquipo[i].Codigo + "||" +
                           litApuIndiceEquipo[i].Porcentaje.ToString("N2", NumberFormatInfo.CurrentInfo);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuIndiceEquipo[i].Apu_Indice_Nombre, value));
        }
        return opciones.ToArray();
    }
}
