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
using FEL.FIS;
using System.Web.Services;
using System.Collections.Generic;
using FEL.APU;
using AjaxControlToolkit;
using System.Globalization;

public partial class FIS_FIS_CATALOGO_INDICE : PaginaBaseKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    public Fis_Catalogo FisCatalogo_Actual
    {
        get
        {
            if (ViewState["FIS_CATALOGO"] == null)
                ViewState["FIS_CATALOGO"] = Obtener_FisCatalogo();
            return (Fis_Catalogo)ViewState["FIS_CATALOGO"];
        }
    }

    Fis_Catalogo Obtener_FisCatalogo()
    {
        FEL.FIS.BO_Fis_Catalogo datos = new BO_Fis_Catalogo();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Fis_Catalogo_Id"])[0];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Pnl_Publicidad.DataBind();
        odsGv_Fis_Catalogo_Indice.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Catalogo_Indice_Selecting);
        SeleccionarItemEnCarga(null);
        Gv_Fis_Catalogo_Indice.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Catalogo_Indice_SelectedIndexChanging);
        Gv_Fis_Catalogo_Indice.SelectedIndexChanged += new EventHandler(Gv_Fis_Catalogo_Indice_SelectedIndexChanged);
        odsFv_Fis_Catalogo_Indice.Updated += new ObjectDataSourceStatusEventHandler(odsFv_Fis_Catalogo_Indice_Updated);
        Fv_Fis_Catalogo_Indice.ModeChanging += new FormViewModeEventHandler(Fv_Fis_Catalogo_Indice_ModeChanging);
        Gv_Fis_Catalogo_Indice.Sorting += new GridViewSortEventHandler(Gv_Fis_Catalogo_Indice_Sorting);
        Fv_Fis_Catalogo_Indice.DataBound += new EventHandler(Fv_Fis_Catalogo_Indice_DataBound);
    }

    void Fv_Fis_Catalogo_Indice_DataBound(object sender, EventArgs e)
    {
        Filtro_Fis_Catalogo_Codigo.Text = FisCatalogo_Actual.Codigo;
        Filtro_Fis_Catalogo_Fecha_Creacion.Text = Convert.ToString(FisCatalogo_Actual.Fecha_Creacion);
        Filtro_Fis_Catalogo_Fecha_Publicacion.Text = Convert.ToString(FisCatalogo_Actual.Fecha_Publicacion);
        Filtro_Fis_Catalogo_Nombre.Text = FisCatalogo_Actual.Nombre;
        if (Fv_Fis_Catalogo_Indice.CurrentMode == FormViewMode.Insert)
        {            
            TextBox Valor = (TextBox)Fv_Fis_Catalogo_Indice.FindControl("Valor");
            Valor.Text = 0.ToString("N3", NumberFormatInfo.CurrentInfo);
        }

        if (Fv_Fis_Catalogo_Indice.CurrentMode == FormViewMode.Insert || Fv_Fis_Catalogo_Indice.CurrentMode == FormViewMode.Edit)
        {
            string FisCatalogoId = Request.QueryString["Fis_Catalogo_Id"];
            ((AutoCompleteExtender)Fv_Fis_Catalogo_Indice.FindControl("ace_ApuIndNom")).ContextKey = FisCatalogoId;            
        }
    }

    void Gv_Fis_Catalogo_Indice_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void Fv_Fis_Catalogo_Indice_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Edit)
        {
            seleccionado = true;
        }
        else if (e.NewMode == FormViewMode.Insert)
        {
            seleccionado = true;
        }
        else
            seleccionado = true;
    }

    void odsFv_Fis_Catalogo_Indice_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        seleccionado = true;
    }

    void Gv_Fis_Catalogo_Indice_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void Gv_Fis_Catalogo_Indice_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Catalogo_Indice.PageSize = NumPagina;
        Gv_Fis_Catalogo_Indice.PageIndex = PageActual; 
    }

    void odsGv_Fis_Catalogo_Indice_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Apu_Indice_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Indice_Codigo"].Valor.Length > 0)
        {
            string Apu_Indice_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Indice_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Indice_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Indice_Codigo_Desde, "Desde");

            string Apu_Indice_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Indice_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Indice_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Indice_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Indice_Codigo_Desde = null;
            e.InputParameters["Apu_Indice_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Indice_Codigo_Desde, "Desde");

            string Apu_Indice_Codigo_Hasta = null;
            e.InputParameters["Apu_Indice_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Indice_Codigo_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Indice_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Indice_Nombre"].Valor.Length > 0)
        {
            string Apu_Indice_Nombre = KftFiltro.ParametrosFiltro["Apu_Indice_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Indice_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Indice_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Indice_Nombre = null;
            e.InputParameters["Apu_Indice_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Indice_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Valor"].Valor != null && KftFiltro.ParametrosFiltro["Valor"].Valor.Length > 0)
        {
            string Valor_Desde = KftFiltro.ParametrosFiltro["Valor"].Valor[0].ToString();
            e.InputParameters["Valor_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Valor_Desde, "Desde");

            string Valor_Hasta = KftFiltro.ParametrosFiltro["Valor"].Valor[1].ToString();
            e.InputParameters["Valor_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Valor_Hasta, "Hasta");
        }
        else
        {
            string Valor_Desde = null;
            e.InputParameters["Valor_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Valor_Desde, "Desde");

            string Valor_Hasta = null;
            e.InputParameters["Valor_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Valor_Hasta, "Hasta");
        }

        if (Gv_Fis_Catalogo_Indice.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Catalogo_Indice.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Catalogo_Indice.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Catalogo_Indice.PageSize;
            Gv_Fis_Catalogo_Indice.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Catalogo_Indice.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (Gv_Fis_Catalogo_Indice.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Catalogo_Indice.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Catalogo_Indice.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Catalogo_Indice.Indice_Navegacion;
            else if (!seleccionado)
                s.Pagina_Actual = 1;
        }
        s.Numero_Registros = Gv_Fis_Catalogo_Indice.PageSize;
        Gv_Fis_Catalogo_Indice.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Catalogo_Indice.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Indice_Codigo_Desde = null, Apu_Indice_Codigo_Hasta = null, Apu_Indice_Nombre = null,
            Valor_Desde = null, Valor_Hasta = null;
        string FisCatalogoId = Request.QueryString["Fis_Catalogo_Id"];
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Apu_Indice_Codigo_Desde = e.InputParameters["Apu_Indice_Codigo_Desde"].ToString();
        Apu_Indice_Codigo_Hasta = e.InputParameters["Apu_Indice_Codigo_Hasta"].ToString();
        Apu_Indice_Nombre = e.InputParameters["Apu_Indice_Nombre"].ToString();
        Valor_Desde = e.InputParameters["Valor_Desde"].ToString();
        Valor_Hasta = e.InputParameters["Valor_Hasta"].ToString();

        FEL.FIS.BO_Fis_Catalogo_Indice boFisTotalPaginas = new BO_Fis_Catalogo_Indice();
        Total_Paginas = boFisTotalPaginas.TotalPaginas(s, FisCatalogoId, Apu_Indice_Codigo_Desde,
            Apu_Indice_Codigo_Hasta, Apu_Indice_Nombre, Convert.ToDecimal(Valor_Desde), Convert.ToDecimal(Valor_Hasta));

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Fis_Catalogo_Id", Request.QueryString["Fis_Catalogo_Id"]));            
        }
    }

    [WebMethod]
    static public string[] Get_ApuIndNom(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Indice ApuIndice = new BO_Apu_Indice();
        List<Apu_Indice> litApuIndice = ApuIndice.GetByLikeNombreCatalogo("", s, contextKey, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuIndice.Count && i < count; i++)
        {
            string value = litApuIndice[i].Id + "||" +
                           litApuIndice[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuIndice[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void Btn_Fis_Catalogo_Indice_Publicacion_Click(object sender, EventArgs e)
    {
        //TextBox Id = (TextBox)Fv_Fis_Catalogo.FindControl("Id");
        Response.Redirect("~/FIS/FIS_CATALOGO.aspx?Fis_Catalogo_Id=" + Request.QueryString["Fis_Catalogo_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"]);
    }

    protected void Btn_Fis_Catalogo_Indice_Categoria_Click(object sender, EventArgs e)
    {
        string Fis_Catalogo_Id = Request.QueryString["Fis_Catalogo_Id"];
        Response.Redirect("~/FIS/FIS_CATALOGO_CATEGORIA.aspx?Fis_Catalogo_Id=" + Fis_Catalogo_Id +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"]);
    }

    protected void Btn_FIs_Catalogo_Indice_ManoObra_Click(object sender, EventArgs e)
    {
        string Fis_Catalogo_Id = Request.QueryString["Fis_Catalogo_Id"];
        Response.Redirect("~/FIS/FIS_CATALOGO_MANO_OBRA.aspx?Fis_Catalogo_Id=" + Fis_Catalogo_Id +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"]);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Catalogo_Indice); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Catalogo_Indice; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Catalogo_Indice; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Catalogo_Indice; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Catalogo_Indice; }
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
        get { return KFiltro; }
    }

    protected override string Contenedor
    {
        get { return "FIS_CATALOGO_INDICE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
