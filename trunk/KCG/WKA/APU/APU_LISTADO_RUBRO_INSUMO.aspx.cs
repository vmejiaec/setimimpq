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
using HER;


public partial class APU_APU_LISTADO_RUBRO_INSUMO : PaginaBaseGridKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        odsgvApuListadoRubroInsumo.Selecting += new ObjectDataSourceSelectingEventHandler(odsgvApuListadoRubroInsumo_Selecting);
        gvApuListadoRubroInsumo.DataBound += new EventHandler(gvApuListadoRubroInsumo_DataBound);
        gvApuListadoRubroInsumo.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoRubroInsumo_SelectedIndexChanging);
        gvApuListadoRubroInsumo.SelectedIndexChanged += new EventHandler(gvApuListadoRubroInsumo_SelectedIndexChanged);
        gvApuListadoRubroInsumo.Sorting += new GridViewSortEventHandler(gvApuListadoRubroInsumo_Sorting);
    }

    void gvApuListadoRubroInsumo_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoRubroInsumo_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoRubroInsumo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoRubroInsumo.PageSize = NumPagina;
        gvApuListadoRubroInsumo.PageIndex = PageActual; 
    }

    void gvApuListadoRubroInsumo_DataBound(object sender, EventArgs e)
    {
        if (gvApuListadoRubroInsumo.SelectedIndex > -1)
        {
            Btn_Apu_Rubro_Insumo_Insumo.Enabled = true;
            Btn_Apu_Rubro_Insumo_Rubro.Enabled = true;
        }
        else
        {
            Btn_Apu_Rubro_Insumo_Insumo.Enabled = false;
            Btn_Apu_Rubro_Insumo_Rubro.Enabled = false;
        }
    }

    void odsgvApuListadoRubroInsumo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor.Length > 0)
        {
            string Apu_Rubro_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Rubro_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Codigo_Desde, "Desde");

            string Apu_Rubro_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Rubro_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Rubro_Codigo_Desde = null;
            e.InputParameters["Apu_Rubro_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Codigo_Desde, "Desde");

            string Apu_Rubro_Codigo_Hasta = null;
            e.InputParameters["Apu_Rubro_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Codigo_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Rubro_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Rubro_Nombre"].Valor.Length > 0)
        {
            string Apu_Rubro_Nombre = KftFiltro.ParametrosFiltro["Apu_Rubro_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Rubro_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Rubro_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Rubro_Nombre = null;
            e.InputParameters["Apu_Rubro_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Rubro_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Insumo_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Insumo_Nombre"].Valor.Length > 0)
        {
            string Apu_Insumo_Nombre = KftFiltro.ParametrosFiltro["Apu_Insumo_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Insumo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Insumo_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Insumo_Nombre = null;
            e.InputParameters["Apu_Insumo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Insumo_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Tipo"].Valor != null && KftFiltro.ParametrosFiltro["Tipo"].Valor.Length > 0)
        {
            string Tipo = KftFiltro.ParametrosFiltro["Tipo"].Valor[0].ToString();
            e.InputParameters["Tipo"] = HER.Filtrado.NormalizarFiltrado(Tipo, "[%]", "%");
        }
        else
        {
            string Tipo = null;
            e.InputParameters["Tipo"] = HER.Filtrado.NormalizarFiltrado(Tipo, "[%]", "%");
        }

        //if (KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor.Length > 0)
        //{
        //    string Apu_Subtitulo_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor[0].ToString();
        //    e.InputParameters["Apu_Subtitulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Desde, "Desde");

        //    string Apu_Subtitulo_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor[1].ToString();
        //    e.InputParameters["Apu_Subtitulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Hasta, "Hasta");
        //}
        //else
        //{
        //    string Apu_Subtitulo_Codigo_Desde = null;
        //    e.InputParameters["Apu_Subtitulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Desde, "Desde");

        //    string Apu_Subtitulo_Codigo_Hasta = null;
        //    e.InputParameters["Apu_Subtitulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Hasta, "Hasta");
        //}

        if (KftFiltro.ParametrosFiltro["Apu_Subtitulo_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Subtitulo_Nombre"].Valor.Length > 0)
        {
            string Apu_Subtitulo_Nombre = KftFiltro.ParametrosFiltro["Apu_Subtitulo_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Subtitulo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Subtitulo_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Subtitulo_Nombre = null;
            e.InputParameters["Apu_Subtitulo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Subtitulo_Nombre, "[%]", "%");
        }

        //if (KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor.Length > 0)
        //{
        //    string Apu_Titulo_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor[0].ToString();
        //    e.InputParameters["Apu_Titulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Desde, "Desde");

        //    string Apu_Titulo_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor[1].ToString();
        //    e.InputParameters["Apu_Titulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Hasta, "Hasta");
        //}
        //else
        //{
        //    string Apu_Titulo_Codigo_Desde = null;
        //    e.InputParameters["Apu_Titulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Desde, "Desde");

        //    string Apu_Titulo_Codigo_Hasta = null;
        //    e.InputParameters["Apu_Titulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Hasta, "Hasta");
        //}

        if (KftFiltro.ParametrosFiltro["Apu_Titulo_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Titulo_Nombre"].Valor.Length > 0)
        {
            string Apu_Titulo_Nombre = KftFiltro.ParametrosFiltro["Apu_Titulo_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Titulo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Titulo_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Titulo_Nombre = null;
            e.InputParameters["Apu_Titulo_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Titulo_Nombre, "[%]", "%");
        }

        if (gvApuListadoRubroInsumo.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoRubroInsumo.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoRubroInsumo.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoRubroInsumo.PageSize;
            gvApuListadoRubroInsumo.Total_PaginasGruesa = PagGruesa;
            gvApuListadoRubroInsumo.Pagina_Actual = s.Pagina_Actual;
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
        if (gvApuListadoRubroInsumo.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoRubroInsumo.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoRubroInsumo.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoRubroInsumo.Indice_Navegacion;
            else if (!seleccionado)
                s.Pagina_Actual = 1;
        }
        s.Numero_Registros = gvApuListadoRubroInsumo.PageSize;
        gvApuListadoRubroInsumo.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoRubroInsumo.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Insumo_Nombre = null, Tipo = null, Apu_Rubro_Codigo_Desde = null, Apu_Rubro_Codigo_Hasta = null, Apu_Rubro_Nombre = null;
        string Apu_Subtitulo_Nombre = null, Apu_Titulo_Nombre = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        Apu_Rubro_Codigo_Desde = e.InputParameters["Apu_Rubro_Codigo_Desde"].ToString();
        Apu_Rubro_Codigo_Hasta = e.InputParameters["Apu_Rubro_Codigo_Hasta"].ToString();
        Apu_Rubro_Nombre = e.InputParameters["Apu_Rubro_Nombre"].ToString();
        Apu_Insumo_Nombre = e.InputParameters["Apu_Insumo_Nombre"].ToString();
        Tipo = e.InputParameters["Tipo"].ToString();        
        Apu_Subtitulo_Nombre = e.InputParameters["Apu_Subtitulo_Nombre"].ToString();        
        Apu_Titulo_Nombre = e.InputParameters["Apu_Titulo_Nombre"].ToString();

        FEL.APU.BO_Apu_Rubro_Insumo boApuTotalPaginas = new FEL.APU.BO_Apu_Rubro_Insumo();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre, Apu_Insumo_Nombre,
                                                       Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Rubro_Insumo_Insumo.Text = GetLocalResourceObject("Btn_Apu_Rubro_Insumo_InsumoRecursoKCG.Text").ToString();
        Btn_Apu_Rubro_Insumo_Insumo.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Insumo_InsumoRecursoKCG.Text").ToString();
        Btn_Apu_Rubro_Insumo_Rubro.Text = GetLocalResourceObject("Btn_Apu_Rubro_Insumo_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Rubro_Insumo_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Insumo_RubroRecursoKCG.Text").ToString();
    }

    protected void Btn_Apu_Rubro_Insumo_Insumo_Click(object sender, EventArgs e)
    {
        string val = gvApuListadoRubroInsumo.DataKeys[gvApuListadoRubroInsumo.SelectedIndex].Values["Apu_Insumo_Id"].ToString();
        string tipo = gvApuListadoRubroInsumo.DataKeys[gvApuListadoRubroInsumo.SelectedIndex].Values["Tipo"].ToString();

        switch (tipo)
        {
            case "MAT":
                Response.Redirect("~/APU/Apu_Material.aspx?Apu_Material_Id=" + val);
                break;
            case "TRA":
                Response.Redirect("~/APU/Apu_Material.aspx?Apu_Material_Id=" + val);
                break;
            case "MAN":
                Response.Redirect("~/APU/Apu_Mano_Obra.aspx?Apu_Mano_Obra_Id=" + val);
                break;
            case "EQU":
                Response.Redirect("~/APU/Apu_Equipo.aspx?Apu_Equipo_Id=" + val);
                break;
        }
    }

    protected void Btn_Apu_Rubro_Insumo_Rubro_Click(object sender, EventArgs e)
    {
        string RubroId = gvApuListadoRubroInsumo.DataKeys[gvApuListadoRubroInsumo.SelectedIndex].Values["Apu_Rubro_Id"].ToString();
        Response.Redirect("~/APU/APU_RUBRO.aspx?Apu_Rubro_Id=" + RubroId);
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuListadoRubroInsumo; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_RUBRO_INSUMO"; }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return gvApuListadoRubroInsumo; }
    }    
}
