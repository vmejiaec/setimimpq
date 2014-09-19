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
using FEL.APU;
using HER;
using System.Web.Services.Protocols;
using System.Drawing;
using System.Xml;

public partial class APU_APU_PROYECTO_FORMULA_EQUIPO : PaginaBaseGridKCG
{
    protected new Color bien = Color.WhiteSmoke;
    protected new Color mal = Color.WhiteSmoke;

    public Apu_Proyecto Apu_Proyecto_Actual
    {
        get
        {
            if (ViewState["APU_PROYECTO"] == null)
                ViewState["APU_PROYECTO"] = ObtenerApu_Proyecto();
            return (Apu_Proyecto)ViewState["APU_PROYECTO"];
        }
    }

    Apu_Proyecto ObtenerApu_Proyecto()
    {
        FEL.APU.BO_Apu_Proyecto datos = new BO_Apu_Proyecto();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Apu_Proyecto_Id"])[0];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblNombre.DataBind();
            Estado_Nombre.Text = Apu_Proyecto_Actual.Estado_Nombre;
            Codigo.Text = Apu_Proyecto_Actual.Codigo;
            Nombre.Text = Apu_Proyecto_Actual.Nombre;
        }

        gvMaestroApuProyectoEquipo.SelectedIndexChanged += new EventHandler(gvMaestroApuProyectoEquipo_SelectedIndexChanged);
        //DETALLE
        odsFvDetalleApuProyectoEquipoIndice.Inserting += new ObjectDataSourceMethodEventHandler(odsFvDet_Inserting);
        odsFvDetalleApuProyectoEquipoIndice.Inserted += new ObjectDataSourceStatusEventHandler(odsFvDet_Inserted);        
        fvDetalleApuProyectoFormulaEquipo.ItemInserted += new FormViewInsertedEventHandler(fvDet_ItemInserted);
        fvDetalleApuProyectoFormulaEquipo.ItemInserting += new FormViewInsertEventHandler(fvDet_ItemInserting);

        odsFvDetalleApuProyectoEquipoIndice.Updating += new ObjectDataSourceMethodEventHandler(odsFvDet_Updating);
        odsFvDetalleApuProyectoEquipoIndice.Updated += new ObjectDataSourceStatusEventHandler(odsFvDet_Updated);
        fvDetalleApuProyectoFormulaEquipo.ItemUpdated += new FormViewUpdatedEventHandler(fvDet_ItemUpdated);
        fvDetalleApuProyectoFormulaEquipo.ItemUpdating += new FormViewUpdateEventHandler(fvDet_ItemUpdating);

        odsFvDetalleApuProyectoEquipoIndice.Deleting += new ObjectDataSourceMethodEventHandler(odsFvDet_Deleting);
        odsFvDetalleApuProyectoEquipoIndice.Deleted += new ObjectDataSourceStatusEventHandler(odsFvDet_Deleted);

        fvDetalleApuProyectoFormulaEquipo.DataBound += new EventHandler(fvDetalleApuProyectoFormulaEquipo_DataBound);
        gvDetalleApuProyectoEquipoIndice.DataBound += new EventHandler(gvDetalleApuProyectoEquipoIndice_DataBound);
        fvDetalleApuProyectoFormulaEquipo.ModeChanging += new FormViewModeEventHandler(fvDetalleApuProyectoFormulaEquipo_ModeChanging);
        gvDetalleApuProyectoEquipoIndice.SelectedIndexChanged += new EventHandler(gvDetalleApuProyectoEquipoIndice_SelectedIndexChanged);        

        btnFormula.Click += new EventHandler(btnFormula_Click);
        Btn_Apu_Proyecto_Formula_Equipo_Listado.Click += new EventHandler(Btn_Apu_Proyecto_Formula_Equipo_Listado_Click);        
    }    

    protected void PegarValoresEnControlesOrigen(Control contenedor, List<DictionaryEntry> parametros)
    {
        for (int i = 0; i < parametros.Count; i++)
        {
            if (parametros[i].Value != null)
            {
                Navegacion.AsignarValorDeControl(
                    contenedor.FindControl(parametros[i].Key.ToString()),
                    parametros[i].Value.ToString());
            }
        }
    }        
    

    #region MAESTRO

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        gvMaestroApuProyectoEquipo_SelectedIndexChanged(sender, e);        
    }    

    void gvMaestroApuProyectoEquipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (gvMaestroApuProyectoEquipo.SelectedIndex != -1)
        {
            SumaPorcentajeEquipo.Text = gvMaestroApuProyectoEquipo.DataKeys[gvMaestroApuProyectoEquipo.SelectedIndex].Values["Suma_porcentaje_Equipo"].ToString();
            dat_ApuProyEquId = gvMaestroApuProyectoEquipo.SelectedValue.ToString();
            dat_ApuProEquCosTot = gvMaestroApuProyectoEquipo.SelectedRow.Cells[5].Text;
            //gvMaestroApuProyectoEquipo.SelectedDataKey["Suma_porcentaje_Equipo"].ToString();                                        
        }        

        fvDetalleApuProyectoFormulaEquipo.Enabled = true;
        gvDetalleApuProyectoEquipoIndice.Enabled = true;
        nav.Enabled = true;
        //kftFiltro.Enabled = true;
        if (gvMaestroApuProyectoEquipo.SelectedIndex == -1)
        {
            fvDetalleApuProyectoFormulaEquipo.Enabled = false;
            gvDetalleApuProyectoEquipoIndice.Enabled = false;
            nav.Enabled = false;
            //kftFiltro.Enabled = false;
        }

        fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.Insert;
        fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.Insert);
    }

    #endregion

    #region DETALLE

    private string dat_ApuProyEquId
    {
        get
        {
            object o = ViewState["dat_ApuProyEquId"];
            return (o == null) ? "" : (string)o;

        }
        set
        {
            ViewState["dat_ApuProyEquId"] = value;
        }
    }

    private string dat_ApuProEquCosTot
    {
        get
        {
            object o = ViewState["dat_ApuProEquCosTot"];
            return (o == null) ? "" : (string)o;

        }
        set
        {
            ViewState["dat_ApuProEquCosTot"] = value;
        }
    }

    private int detfilasAfectadas;
    private List<DictionaryEntry> detparamFijosDeInsercion = new List<DictionaryEntry>();
    private List<DictionaryEntry> detparamInsertNoRealizado = new List<DictionaryEntry>();
    private List<DictionaryEntry> detparamUpdateNoRealizado = new List<DictionaryEntry>();
    bool Seleccionar_ = true;

    private void InicializarPagina( string estado_)
    {
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        if (estado_ == "BOR" || presupuestoEstado == "PEN")
        {
            if (fvDetalleApuProyectoFormulaEquipo.CurrentMode == FormViewMode.Insert)
            {
                if (gvMaestroApuProyectoEquipo.SelectedIndex > -1)
                {                    
                    HabilitarControl("InsertButton");
                    HabilitarControl("InsertCancelButton");                   
                }
                else
                {
                    DeshabilitarControl("InsertButton");
                    DeshabilitarControl("InsertCancelButton");
                }
                fvDetalleApuProyectoFormulaEquipo.Enabled = true;
                gvDetalleApuProyectoEquipoIndice.Enabled = true;
                nav.Enabled = true;
            }
        }
        else if (estado_ == "DIS")
        {
            if (fvDetalleApuProyectoFormulaEquipo.CurrentMode == FormViewMode.Insert && fvDetalleApuProyectoFormulaEquipo.DataItemCount == 0)
            {
                //EstablecerTextBoxEnReadOnly("Porcentaje");
                //EstablecerTextBoxEnReadOnly("Apu_Indice_Nombre");
                DeshabilitarControl("InsertButton");
                DeshabilitarControl("InsertCancelButton");
                fvDetalleApuProyectoFormulaEquipo.Enabled = false;
                gvDetalleApuProyectoEquipoIndice.Enabled = false;
                nav.Enabled = false;
            }
            else
            {                
                fvDetalleApuProyectoFormulaEquipo.Enabled = true;
                gvDetalleApuProyectoEquipoIndice.Enabled = true;
                nav.Enabled = true;
            }
        }
    }

    void fvDetalleApuProyectoFormulaEquipo_DataBound(object sender, EventArgs e)
    {
        InicializarPagina(Request.QueryString["Estado"]);     
        if (fvDetalleApuProyectoFormulaEquipo.CurrentMode == FormViewMode.Insert)
        {
            if (gvMaestroApuProyectoEquipo.SelectedIndex != -1)
            {

                TextBox Apu_Proyecto_Equipo_Id = (TextBox)fvDetalleApuProyectoFormulaEquipo.FindControl("Apu_Proyecto_Equipo_Id");
                Apu_Proyecto_Equipo_Id.Text = dat_ApuProyEquId;
                TextBox Apu_Proyecto_Equipo_Costo_Total = (TextBox)fvDetalleApuProyectoFormulaEquipo.FindControl("Apu_Proyecto_Equipo_Costo_Total");
                Apu_Proyecto_Equipo_Costo_Total.Text = dat_ApuProEquCosTot;                
            }            
        }
        
        if (detparamInsertNoRealizado.Count > 0)
        {
            PegarValoresEnControlesOrigen(fvDetalleApuProyectoFormulaEquipo, detparamInsertNoRealizado);
        }
        if (detparamUpdateNoRealizado.Count > 0)
        {
            PegarValoresEnControlesOrigen(fvDetalleApuProyectoFormulaEquipo, detparamUpdateNoRealizado);
        }    
        
    }

    void gvDetalleApuProyectoEquipoIndice_SelectedIndexChanged(object sender, EventArgs e)
    {
        fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.ReadOnly);
        detAsignarParametrosDataSourceDeatailsView(gvDetalleApuProyectoEquipoIndice.SelectedValue.ToString());
    }

    void fvDetalleApuProyectoFormulaEquipo_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Insert || e.NewMode == FormViewMode.Edit)
        {
            gvDetalleApuProyectoEquipoIndice.SelectedIndex = -1;
            Seleccionar_ = false;
        }
    }

    void gvDetalleApuProyectoEquipoIndice_DataBound(object sender, EventArgs e)
    {
        if (gvDetalleApuProyectoEquipoIndice.Rows.Count == 0)
            fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.Insert);

        else
        {
            if (Seleccionar_)
                detSeleccionItemGrid();
        }
    }

    void detSeleccionItemGrid()
    {
        if (gvDetalleApuProyectoEquipoIndice.SelectedIndex < gvDetalleApuProyectoEquipoIndice.Rows.Count)
        {
            if (gvDetalleApuProyectoEquipoIndice.Rows.Count > 0)
            {
                if (gvDetalleApuProyectoEquipoIndice.SelectedIndex < 0)
                    gvDetalleApuProyectoEquipoIndice.SelectedIndex = 0;
                fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.ReadOnly;
                fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.ReadOnly);
                detAsignarParametrosDataSourceDeatailsView(gvDetalleApuProyectoEquipoIndice.SelectedDataKey["Id"].ToString());
            }
        }
        else
        {
            if (gvDetalleApuProyectoEquipoIndice.Rows.Count > 0)
            {
                gvDetalleApuProyectoEquipoIndice.SelectedIndex = 0;
                fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.ReadOnly;
                fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.ReadOnly);
                detAsignarParametrosDataSourceDeatailsView(gvDetalleApuProyectoEquipoIndice.SelectedDataKey["Id"].ToString());
            }
            else
                gvDetalleApuProyectoEquipoIndice.SelectedIndex = -1;
        }   
    }    

    private void EstablecerTextBoxEnReadOnly(string idTextBox)
    {
        Control control = fvDetalleApuProyectoFormulaEquipo.FindControl(idTextBox);
        TextBox txbControl = (TextBox)control;
        txbControl.ReadOnly = true;
        txbControl.CssClass = "";
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvDetalleApuProyectoFormulaEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }

    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvDetalleApuProyectoFormulaEquipo.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = true;
        }

    }

    private void detDefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (gvMaestroApuProyectoEquipo.SelectedIndex != -1)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Equipo_Id", gvMaestroApuProyectoEquipo.SelectedValue));
            param.Add(new DictionaryEntry("Apu_Proyecto_Equipo_Costo_Total", gvMaestroApuProyectoEquipo.SelectedRow.Cells[5].Text));
        }
    }


    //Insertar

    void fvDet_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            // Coloca los valores no insertados en la pantalla
            e.KeepInInsertMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.Values.Count];
            e.Values.CopyTo(parametros, 0);
            detparamInsertNoRealizado.AddRange(parametros);
            // Mensaje de Error
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
    }

    void fvDet_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = !Page.IsValid;
    }

    void odsFvDet_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
        }
        else
        {
            detAsignarParametrosDataSourceDeatailsView(Convert.ToString(e.ReturnValue));
            detSeleccionarItemGridView(e.ReturnValue);
            fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.ReadOnly;
            fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.ReadOnly);
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, bien);
        }
    }

    protected string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
        }
        string pre_mensaje =
            HttpContext.
                GetLocalResourceObject("~/KOALA.master",
                                        CodigoError + "RecursoKCG.Text").ToString();
        pre_mensaje = string.Format(pre_mensaje, MensajeError);
        return pre_mensaje;
    }

    private void detAsignarParametrosDataSourceDeatailsView(string id)
    {
        odsFvDetalleApuProyectoEquipoIndice.SelectParameters["Id"].DefaultValue = id;
    }

    protected void detSeleccionarItemGridView(object id)
    {
        DataView lista = (DataView)odsGvDetalleApuProyectoEquipoIndice.Select();
        OrdenarDataView(lista, gvDetalleApuProyectoEquipoIndice.SortExpression, gvDetalleApuProyectoEquipoIndice.SortDirection);

        if (lista == null) return;

        int iTotal = BuscarObjetoPorID(id, lista);
        int iPagina;
        int iFila;

        if (iTotal != -1)
            CalcularPaginaYFilaDeSeleccion(out iPagina, out iFila, iTotal, gvDetalleApuProyectoEquipoIndice.PageSize);
        else
        {
            iPagina = 0;
            iFila = -1;
        }

        gvDetalleApuProyectoEquipoIndice.PageIndex = iPagina;
        gvDetalleApuProyectoEquipoIndice.SelectedIndex = iFila;
        gvDetalleApuProyectoEquipoIndice.DataBind();
    }

    void odsFvDet_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
        e.InputParameters.CopyTo(parametros, 0);
        e.InputParameters.Clear();
        List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
        parametrosList.AddRange(parametros);
        e.InputParameters.Add("parametros", parametrosList);
        e.InputParameters.Add("s", Session["Scope"]);
    }

    //Updated

    void fvDet_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        e.Cancel = !Page.IsValid;
    }

    void fvDet_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            // Coloca los valores no actualizados en la pantalla
            e.KeepInEditMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.NewValues.Count];
            e.NewValues.CopyTo(parametros, 0);
            detparamUpdateNoRealizado.AddRange(parametros);
            // Mensaje de error
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            detAsignarParametrosDataSourceDeatailsView(e.NewValues["Id"].ToString());
            detSeleccionarItemGridView(e.NewValues["Id"]);
            string mensaje;

            if (detfilasAfectadas == 0) // Controla que se haya actualizado el registro.
            {
                e.KeepInEditMode = true;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ100RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
            }
            else
            {
                fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.ReadOnly;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
            }
        }
    }

    void odsFvDet_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            detfilasAfectadas = 0;
        else
            detfilasAfectadas = (int)e.ReturnValue;
    }

    void odsFvDet_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
        e.InputParameters.CopyTo(parametros, 0);
        e.InputParameters.Clear();
        List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
        parametrosList.AddRange(parametros);
        e.InputParameters.Add("s", Session["Scope"]);
        e.InputParameters.Add("parametros", parametrosList);
    }

    //Delete

    void odsFvDet_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            detfilasAfectadas = 0;
        else
            detfilasAfectadas = (int)e.ReturnValue;

        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            fvDetalleApuProyectoFormulaEquipo.ChangeMode(FormViewMode.Insert);
            gvDetalleApuProyectoEquipoIndice.SelectedIndex = -1;
            fvDetalleApuProyectoFormulaEquipo.DefaultMode = FormViewMode.Insert;
            if (detfilasAfectadas == 0)
            {
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ100RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
            }
            else
            {
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
            }
        }
    }

    void odsFvDet_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
        e.InputParameters.CopyTo(parametros, 0);
        List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
        parametrosList.AddRange(parametros);
        e.InputParameters.Clear();
        e.InputParameters.Add("s", Session["Scope"]);
        e.InputParameters.Add("parametros", parametrosList);
    }   

    #endregion

    #region BOTONES
    void btnFormula_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_INDICE.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void Btn_Apu_Proyecto_Formula_Equipo_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }      

    #endregion
                                          
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

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_FORMULA_EQUIPO"; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return gvMaestroApuProyectoEquipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvMasterApuProyectoEquipo; }
    }
}
