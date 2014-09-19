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
using HER;

public partial class FIS_FIS_CATALOGO : PaginaBaseKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Seleccionar_PagFina();
        //if (!IsPostBack)
        //    Gv_Fis_Catalogo.PageSize = NumPagina;
        odsGv_Fis_Catalogo.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Catalogo_Selecting);
        SeleccionarItemEnCarga("Fis_Catalogo_Id");
        Gv_Fis_Catalogo.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Catalogo_SelectedIndexChanging);
        Gv_Fis_Catalogo.SelectedIndexChanged += new EventHandler(Gv_Fis_Catalogo_SelectedIndexChanged);
        odsFv_Fis_Catalogo.Updated += new ObjectDataSourceStatusEventHandler(odsFv_Fis_Catalogo_Updated);
        Fv_Fis_Catalogo.ModeChanging += new FormViewModeEventHandler(Fv_Fis_Catalogo_ModeChanging);
        Gv_Fis_Catalogo.Sorting += new GridViewSortEventHandler(Gv_Fis_Catalogo_Sorting);
        Fv_Fis_Catalogo.DataBound += new EventHandler(Fv_Fis_Catalogo_DataBound);
    }

    private void Seleccionar_PagFina()
    {
        if (!IsPostBack)
        {
            elem_PagActual.Text = Request.QueryString["Elem_PagActual"];
            elem_NumRegis.Text = Request.QueryString["Elem_NumRegis"];            
        }
    }

    void Fv_Fis_Catalogo_DataBound(object sender, EventArgs e)
    {
        if (Fv_Fis_Catalogo.CurrentMode == FormViewMode.Insert)
        {
            TextBox Codigo = (TextBox)Fv_Fis_Catalogo.FindControl("Codigo");
            Codigo.Text = string.Empty;

            Btn_Fis_Catalogo_Indices.Enabled = false;
            Btn_Fis_Catalogo_Categorias.Enabled = false;
            Btn_Fis_Catalogo_ManoObra.Enabled = false;
            Btn_Fis_Catalogo_RepPrecios.Enabled = false;
        }
        else
        {
            Btn_Fis_Catalogo_Indices.Enabled = true;
            Btn_Fis_Catalogo_Categorias.Enabled = true;
            Btn_Fis_Catalogo_ManoObra.Enabled = true;
            Btn_Fis_Catalogo_RepPrecios.Enabled = true;
        }
        elem_PagActual.Text = Convert.ToString(Scope.Pagina_Actual);
        elem_NumRegis.Text = NumRegistros.Text;
        if (Gv_Fis_Catalogo.SelectedIndex < Gv_Fis_Catalogo.Rows.Count)
        {
            //code
        }
        else
        {
            elem_NumRegis.Text = "";
            elem_PagActual.Text = "";
        }
    }

    void Gv_Fis_Catalogo_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void Fv_Fis_Catalogo_ModeChanging(object sender, FormViewModeEventArgs e)
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

    void odsFv_Fis_Catalogo_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        seleccionado = true;
    }

    void Gv_Fis_Catalogo_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void Gv_Fis_Catalogo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Catalogo.PageSize = NumPagina;
        Gv_Fis_Catalogo.PageIndex = PageActual; 
    }

    void odsGv_Fis_Catalogo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor != null && KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor.Length > 0)
        {
            string Fecha_Creacion_Desde = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[0].ToString();
            e.InputParameters["Fecha_Creacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Creacion_Desde, "Desde");

            string Fecha_Creacion_Hasta = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[1].ToString();
            e.InputParameters["Fecha_Creacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Creacion_Hasta, "Hasta");
        }
        else
        {
            string Fecha_Creacion_Desde = null;
            e.InputParameters["Fecha_Creacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Creacion_Desde, "Desde");

            string Fecha_Creacion_Hasta = null;
            e.InputParameters["Fecha_Creacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Creacion_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor != null && KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor.Length > 0)
        {
            string Fecha_Publicacion_Desde = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[0].ToString();
            e.InputParameters["Fecha_Publicacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Publicacion_Desde, "Desde");

            string Fecha_Publicacion_Hasta = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[1].ToString();
            e.InputParameters["Fecha_Publicacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Publicacion_Hasta, "Hasta");
        }
        else
        {
            string Fecha_Publicacion_Desde = null;
            e.InputParameters["Fecha_Publicacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Publicacion_Desde, "Desde");

            string Fecha_Publicacion_Hasta = null;
            e.InputParameters["Fecha_Publicacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Publicacion_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Nombre"].Valor.Length > 0)
        {
            string Nombre = KftFiltro.ParametrosFiltro["Nombre"].Valor[0].ToString();
            e.InputParameters["Nombre"] = HER.Filtrado.NormalizarFiltrado(Nombre, "[%]", "%");
        }
        else
        {
            string Nombre = null;
            e.InputParameters["Nombre"] = HER.Filtrado.NormalizarFiltrado(Nombre, "[%]", "%");
        }

        if (Gv_Fis_Catalogo.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Catalogo.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Catalogo.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Catalogo.PageSize;
            Gv_Fis_Catalogo.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Catalogo.Pagina_Actual = s.Pagina_Actual;
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
        if (Gv_Fis_Catalogo.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Catalogo.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Catalogo.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Catalogo.Indice_Navegacion;
            else
            {
                if (string.IsNullOrEmpty(elem_PagActual.Text))
                {
                    if (!seleccionado)
                        s.Pagina_Actual = 1;
                }
                else
                {
                    s.Pagina_Actual = Convert.ToInt32(elem_PagActual.Text);
                }
            }
        }
        s.Numero_Registros = Gv_Fis_Catalogo.PageSize;
        Gv_Fis_Catalogo.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Catalogo.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Fecha_Creacion_Desde = null, Fecha_Creacion_Hasta = null, Fecha_Publicacion_Desde = null,
            Fecha_Publicacion_Hasta = null, Nombre = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Fecha_Creacion_Desde = e.InputParameters["Fecha_Creacion_Desde"].ToString();
        Fecha_Creacion_Hasta = e.InputParameters["Fecha_Creacion_Hasta"].ToString();
        Fecha_Publicacion_Desde = e.InputParameters["Fecha_Publicacion_Desde"].ToString();
        Fecha_Publicacion_Hasta = e.InputParameters["Fecha_Publicacion_Hasta"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();        

        FEL.FIS.BO_Fis_Catalogo boFisTotalPaginas = new BO_Fis_Catalogo();
        Total_Paginas = boFisTotalPaginas.TotalPaginas(s, Convert.ToDateTime(Fecha_Creacion_Desde), Convert.ToDateTime(Fecha_Creacion_Hasta),
            Convert.ToDateTime(Fecha_Publicacion_Desde), Convert.ToDateTime(Fecha_Publicacion_Hasta), Nombre);


        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected void CopyButton_Click(object sender, EventArgs e)
    {
        CopiarValoresDeControles_Insert(Fv_Fis_Catalogo, TipoObjeto);
    }

    protected void Btn_Fis_Catalogo_Indices_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv_Fis_Catalogo.FindControl("Id");
        Response.Redirect("~/FIS/FIS_CATALOGO_INDICE.aspx?Fis_Catalogo_Id=" + Id.Text +
                    "&Elem_PagActual=" + elem_PagActual.Text +
                    "&Elem_NumRegis=" + elem_NumRegis.Text);
    }

    protected void Btn_Fis_Catalogo_Categorias_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv_Fis_Catalogo.FindControl("Id");
        Response.Redirect("~/FIS/FIS_CATALOGO_CATEGORIA.aspx?Fis_Catalogo_Id=" + Id.Text +
                    "&Elem_PagActual=" + elem_PagActual.Text +
                    "&Elem_NumRegis=" + elem_NumRegis.Text);
    }

    protected void Btn_Fis_Catalogo_ManoObra_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv_Fis_Catalogo.FindControl("Id");
        Response.Redirect("~/FIS/FIS_CATALOGO_MANO_OBRA.aspx?Fis_Catalogo_Id=" + Id.Text +
                    "&Elem_PagActual=" + elem_PagActual.Text +
                    "&Elem_NumRegis=" + elem_NumRegis.Text);
    }

    protected void Btn_Fis_Catalogo_RepPrecios_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv_Fis_Catalogo.FindControl("Id");
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                + "FIS/R_FIS_CATALOGO.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&Id={0}", Id.Text),
                                "_blank", "scrollbars=yes, resizable=yes");
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Catalogo); }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return Gv_Fis_Catalogo; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Catalogo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Catalogo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Catalogo; }
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
        get { return "FIS_CATALOGO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
