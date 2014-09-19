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
using System.Web.Services;
using FEL.APU;
using System.Collections.Generic;
using AjaxControlToolkit;
using FEL.FIS;

public partial class FIS_FIS_CATALOGO_MANO_OBRA : PaginaBaseKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    public Fis_Catalogo FisCatalogoActual
    {
        get
        {
            if (ViewState["FIS_CATALOGO"] == null)
                ViewState["FIS_CATALOGO"] = ObtenerFisCatalogo();
            return (Fis_Catalogo)ViewState["FIS_CATALOGO"];
        }
    }

    Fis_Catalogo ObtenerFisCatalogo()
    {
        FEL.FIS.BO_Fis_Catalogo fisCatalogo = new BO_Fis_Catalogo();
        return fisCatalogo.GetById("", (Scope)Session["Scope"], Request.QueryString["Fis_Catalogo_Id"])[0];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        odsGv_Fis_Catalogo_Mano_Obra.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Catalogo_Mano_Obra_Selecting);
        SeleccionarItemEnCarga(null);
        Fv_Fis_Catalogo_Mano_Obra.DataBound +=new EventHandler(Fv_Fis_Catalogo_Mano_Obra_DataBound);
        Gv_Fis_Catalogo_Mano_Obra.SelectedIndexChanged += new EventHandler(Gv_Fis_Catalogo_Mano_Obra_SelectedIndexChanged);
        Gv_Fis_Catalogo_Mano_Obra.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Catalogo_Mano_Obra_SelectedIndexChanging);
        Gv_Fis_Catalogo_Mano_Obra.Sorting += new GridViewSortEventHandler(Gv_Fis_Catalogo_Mano_Obra_Sorting);        
    }   

    void Gv_Fis_Catalogo_Mano_Obra_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void Gv_Fis_Catalogo_Mano_Obra_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Catalogo_Mano_Obra.PageSize = NumPagina;
        Gv_Fis_Catalogo_Mano_Obra.PageIndex = PageActual;
    }

    void Gv_Fis_Catalogo_Mano_Obra_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
    }

    void odsGv_Fis_Catalogo_Mano_Obra_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Apu_Categoria_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Categoria_Codigo"].Valor.Length > 0)
        {
            string Apu_Categoria_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Categoria_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Categoria_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Categoria_Codigo_Desde, "Desde");

            string Apu_Categoria_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Categoria_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Categoria_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Categoria_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Categoria_Codigo_Desde = null;
            e.InputParameters["Apu_Categoria_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Categoria_Codigo_Desde, "Desde");

            string Apu_Categoria_Codigo_Hasta = null;
            e.InputParameters["Apu_Categoria_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Categoria_Codigo_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Categoria_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Categoria_Nombre"].Valor.Length > 0)
        {
            string Apu_Categoria_Nombre = KftFiltro.ParametrosFiltro["Apu_Categoria_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Categoria_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Categoria_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Categoria_Nombre = null;
            e.InputParameters["Apu_Categoria_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Categoria_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Codigo"].Valor.Length > 0)
        {
            string Apu_Mano_Obra_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Mano_Obra_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Mano_Obra_Codigo_Desde, "Desde");

            string Apu_Mano_Obra_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Mano_Obra_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Mano_Obra_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Mano_Obra_Codigo_Desde = null;
            e.InputParameters["Apu_Mano_Obra_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Mano_Obra_Codigo_Desde, "Desde");

            string Apu_Mano_Obra_Codigo_Hasta = null;
            e.InputParameters["Apu_Mano_Obra_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Mano_Obra_Codigo_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Nombre"].Valor.Length > 0)
        {
            string Apu_Mano_Obra_Nombre = KftFiltro.ParametrosFiltro["Apu_Mano_Obra_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Mano_Obra_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Mano_Obra_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Mano_Obra_Nombre = null;
            e.InputParameters["Apu_Mano_Obra_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Mano_Obra_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Fis_Catalogo_CMO_Valor"].Valor != null && KftFiltro.ParametrosFiltro["Fis_Catalogo_CMO_Valor"].Valor.Length > 0)
        {
            string Fis_Catalogo_CMO_Valor_Desde = KftFiltro.ParametrosFiltro["Fis_Catalogo_CMO_Valor"].Valor[0].ToString();
            e.InputParameters["Fis_Catalogo_CMO_Valor_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Fis_Catalogo_CMO_Valor_Desde, "Desde");

            string Fis_Catalogo_CMO_Valor_Hasta = KftFiltro.ParametrosFiltro["Fis_Catalogo_CMO_Valor"].Valor[1].ToString();
            e.InputParameters["Fis_Catalogo_CMO_Valor_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Fis_Catalogo_CMO_Valor_Hasta, "Hasta");
        }
        else
        {
            string Fis_Catalogo_CMO_Valor_Desde = null;
            e.InputParameters["Fis_Catalogo_CMO_Valor_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Fis_Catalogo_CMO_Valor_Desde, "Desde");

            string Fis_Catalogo_CMO_Valor_Hasta = null;
            e.InputParameters["Fis_Catalogo_CMO_Valor_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Fis_Catalogo_CMO_Valor_Hasta, "Hasta");
        }

        if (Gv_Fis_Catalogo_Mano_Obra.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Catalogo_Mano_Obra.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Catalogo_Mano_Obra.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Catalogo_Mano_Obra.PageSize;
            Gv_Fis_Catalogo_Mano_Obra.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Catalogo_Mano_Obra.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    void  Fv_Fis_Catalogo_Mano_Obra_DataBound(object sender, EventArgs e)
    {
 	    if(Fv_Fis_Catalogo_Mano_Obra.CurrentMode == FormViewMode.Insert || Fv_Fis_Catalogo_Mano_Obra.CurrentMode == FormViewMode.Edit)
        {
            string Catalogo_Id = Request.QueryString["Fis_Catalogo_Id"];
            ((AutoCompleteExtender)Fv.FindControl("AutoCo_Mano_Obra")).ContextKey = Catalogo_Id;

            if (Fv_Fis_Catalogo_Mano_Obra.CurrentMode == FormViewMode.Edit)
            {
                TextBox Apu_Categoria_Nombre = (TextBox)Fv_Fis_Catalogo_Mano_Obra.FindControl("Apu_Categoria_Nombre");
                TextBox Valor = (TextBox)Fv_Fis_Catalogo_Mano_Obra.FindControl("Valor");
                if (Apu_Categoria_Nombre.Text != "")
                    Valor.Enabled = false;
                else
                    Valor.Enabled = true;
            }
        }        
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (Gv_Fis_Catalogo_Mano_Obra.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Catalogo_Mano_Obra.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Catalogo_Mano_Obra.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Catalogo_Mano_Obra.Indice_Navegacion;
            else
            {
                if (!selecciona)
                    s.Pagina_Actual = 1;
            }
        }
        s.Numero_Registros = Gv_Fis_Catalogo_Mano_Obra.PageSize;
        Gv_Fis_Catalogo_Mano_Obra.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Catalogo_Mano_Obra.Pagina_Actual = s.Pagina_Actual;

    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Categoria_Codigo_Desde = null, Apu_Categoria_Codigo_Hasta = null, Apu_Categoria_Nombre = null, Apu_Mano_Obra_Codigo_Desde = null, Apu_Mano_Obra_Codigo_Hasta = null, Apu_Mano_Obra_Nombre = null;
        string Fis_Catalogo_CMO_Valor_Desde = null, Fis_Catalogo_CMO_Valor_Hasta = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        string Fis_Catalogo_Id = Request.QueryString["Fis_Catalogo_Id"];
        Apu_Categoria_Codigo_Desde = e.InputParameters["Apu_Categoria_Codigo_Desde"].ToString();
        Apu_Categoria_Codigo_Hasta = e.InputParameters["Apu_Categoria_Codigo_Hasta"].ToString();
        Apu_Categoria_Nombre = e.InputParameters["Apu_Categoria_Nombre"].ToString();
        Apu_Mano_Obra_Codigo_Desde = e.InputParameters["Apu_Mano_Obra_Codigo_Desde"].ToString();
        Apu_Mano_Obra_Codigo_Hasta = e.InputParameters["Apu_Mano_Obra_Codigo_Hasta"].ToString();
        Apu_Mano_Obra_Nombre = e.InputParameters["Apu_Mano_Obra_Nombre"].ToString();
        Fis_Catalogo_CMO_Valor_Desde = e.InputParameters["Fis_Catalogo_CMO_Valor_Desde"].ToString();
        Fis_Catalogo_CMO_Valor_Hasta = e.InputParameters["Fis_Catalogo_CMO_Valor_Hasta"].ToString();

        FEL.FIS.BO_Fis_Catalogo_Mano_Obra boApuCategoria = new BO_Fis_Catalogo_Mano_Obra();
        Total_Paginas = boApuCategoria.TotalPaginas(s,Fis_Catalogo_Id,Apu_Categoria_Codigo_Desde,Apu_Categoria_Codigo_Hasta,Apu_Categoria_Nombre,Apu_Mano_Obra_Codigo_Desde,
            Apu_Mano_Obra_Codigo_Hasta,Apu_Mano_Obra_Nombre,Convert.ToDecimal(Fis_Catalogo_CMO_Valor_Desde),Convert.ToDecimal(Fis_Catalogo_CMO_Valor_Hasta));

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Fis_Catalogo_Id", Request.QueryString["Fis_Catalogo_Id"]));
            param.Add(new DictionaryEntry("Fis_Catalogo_Codigo", FisCatalogoActual.Codigo));
            param.Add(new DictionaryEntry("Fis_Catalogo_Nombre", FisCatalogoActual.Descripcion));
            param.Add(new DictionaryEntry("Fis_Catalogo_Fecha_Publicacion", FisCatalogoActual.Fecha_Publicacion.ToShortDateString()));
            param.Add(new DictionaryEntry("Fis_Catalogo_Fecha_Creacion", FisCatalogoActual.Fecha_Creacion.ToShortDateString()));
        }
    }

    [WebMethod]
    static public string[] Get_Apu_Mano_Obra_Nombre(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.APU.BO_Apu_Mano_Obra ApuManoObra = new BO_Apu_Mano_Obra();        
        List<Apu_Mano_Obra> lstManoObra = ApuManoObra.GetByLikeNombreCatalogo("", s, contextKey, prefixText + "%" );               
        List<string> opciones = new List<string>();
        for (int i = 0; i < lstManoObra.Count; i++)
        {
            string value = lstManoObra[i].Id + "||" +
                           lstManoObra[i].Codigo + "||" +
                           lstManoObra[i].Nombre + "||" +
                           lstManoObra[i].Apu_Categoria_Id + "||" +
                           lstManoObra[i].Apu_Categoria_Codigo + "||" +
                           lstManoObra[i].Apu_Categoria_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstManoObra[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void Btn_Fis_Catalogo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FIS/FIS_CATALOGO.aspx?Fis_Catalogo_Id=" + Request.QueryString["Fis_Catalogo_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"]);
    }


    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Catalogo_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Catalogo_Mano_Obra; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Catalogo_Mano_Obra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Catalogo_Mano_Obra; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Catalogo_Mano_Obra; }
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
        get { return "FIS_CATALOGO_MANO_OBRA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
