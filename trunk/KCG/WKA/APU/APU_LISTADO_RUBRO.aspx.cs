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
using HER;
using FEL.APU;
using Koala.KoalaWebControls;

public partial class APU_APU_LISTADO_RUBRO : PaginaBaseGridKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Seleccionar_PagFina();
        EtiquetarBotones();
        string Apu_Rubro_Id = Request.QueryString["Apu_Rubro_Id"];

        if (!string.IsNullOrEmpty(Apu_Rubro_Id) && !IsPostBack)
        {
            SeleccionarItemGridView(Apu_Rubro_Id);
        }

        odsGvApuListadoRubro.Selecting += new ObjectDataSourceSelectingEventHandler(odsGvApuListadoRubro_Selecting);
        gvApuListadoRubro.SelectedIndexChanged += new EventHandler(gvApuListadoRubro_SelectedIndexChanged);
        gvApuListadoRubro.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoRubro_SelectedIndexChanging);
        gvApuListadoRubro.Sorting += new GridViewSortEventHandler(gvApuListadoRubro_Sorting);
        gvApuListadoRubro.DataBound += new EventHandler(gvApuListadoRubro_DataBound);
    }

    private void Seleccionar_PagFina()
    {
        if (!IsPostBack)
        {
            elem_PagActual.Text = Request.QueryString["Elem_PagActual"];
            elem_NumRegis.Text = Request.QueryString["Elem_NumRegis"];
            elem_Id.Text = Request.QueryString["Elem_Id"];
        }
    }

    void gvApuListadoRubro_DataBound(object sender, EventArgs e)
    {
        if (gvApuListadoRubro.SelectedIndex == -1)
        {
            btnApuListadoRubroTecnica.Enabled = false;
            Btn_Apu_Listado_Rubro_Reporte.Enabled = false;
            BtnReporteListadoApu.Enabled = false;
            Btn_Apu_Listado_Rubro_Rubro.Enabled = false;   
        }
        else
        {            
            btnApuListadoRubroTecnica.Enabled = true;
            Btn_Apu_Listado_Rubro_Reporte.Enabled = true;
            BtnReporteListadoApu.Enabled = true;
            Btn_Apu_Listado_Rubro_Rubro.Enabled = true;
        }

        elem_PagActual.Text = Convert.ToString(Scope.Pagina_Actual);
        elem_NumRegis.Text = NumRegistros.Text;
        if (gvApuListadoRubro.SelectedIndex < gvApuListadoRubro.Rows.Count)
        {
            if (!string.IsNullOrEmpty(elem_Id.Text))
                gvApuListadoRubro.SelectedIndex = Convert.ToInt32(elem_Id.Text);
        }
        else
        {
            elem_Id.Text = "";
            elem_NumRegis.Text = "";
            elem_PagActual.Text = "";
        }
    }

    void gvApuListadoRubro_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void gvApuListadoRubro_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoRubro.PageSize = NumPagina;
        gvApuListadoRubro.PageIndex = PageActual;
    }

    void gvApuListadoRubro_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
        elem_Id.Text = Convert.ToString(gvApuListadoRubro.SelectedIndex);//gvApuListadoRubro.DataKeys[gvApuListadoRubro.SelectedIndex].Values["Id"].ToString();
    }

    void odsGvApuListadoRubro_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Codigo"].Valor.Length > 0)
        {
            string Codigo_Desde = KftFiltro.ParametrosFiltro["Codigo"].Valor[0].ToString();
            e.InputParameters["Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Desde, "Desde");

            string Codigo_Hasta = KftFiltro.ParametrosFiltro["Codigo"].Valor[1].ToString();
            e.InputParameters["Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Hasta, "Hasta");
        }
        else
        {
            string Codigo_Desde = null;
            e.InputParameters["Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Desde, "Desde");

            string Codigo_Hasta = null;
            e.InputParameters["Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Hasta, "Hasta");
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

        if (KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor.Length > 0)
        {
            string Apu_Subtitulo_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Subtitulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Desde, "Desde");

            string Apu_Subtitulo_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Subtitulo_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Subtitulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Subtitulo_Codigo_Desde = null;
            e.InputParameters["Apu_Subtitulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Desde, "Desde");

            string Apu_Subtitulo_Codigo_Hasta = null;
            e.InputParameters["Apu_Subtitulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Subtitulo_Codigo_Hasta, "Hasta");
        }

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

        if (KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor.Length > 0)
        {
            string Apu_Titulo_Codigo_Desde = KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Titulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Desde, "Desde");

            string Apu_Titulo_Codigo_Hasta = KftFiltro.ParametrosFiltro["Apu_Titulo_Codigo"].Valor[1].ToString();
            e.InputParameters["Apu_Titulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Hasta, "Hasta");
        }
        else
        {
            string Apu_Titulo_Codigo_Desde = null;
            e.InputParameters["Apu_Titulo_Codigo_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Desde, "Desde");

            string Apu_Titulo_Codigo_Hasta = null;
            e.InputParameters["Apu_Titulo_Codigo_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Titulo_Codigo_Hasta, "Hasta");
        }

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

        if (gvApuListadoRubro.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoRubro.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoRubro.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoRubro.PageSize;
            gvApuListadoRubro.Total_PaginasGruesa = PagGruesa;
            gvApuListadoRubro.Pagina_Actual = s.Pagina_Actual;
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
        if (gvApuListadoRubro.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoRubro.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoRubro.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoRubro.Indice_Navegacion;
            else
            {
                if (string.IsNullOrEmpty(elem_PagActual.Text))
                {
                    if (!selecciona)
                        s.Pagina_Actual = 1;
                }
                else
                {
                    s.Pagina_Actual = Convert.ToInt32(elem_PagActual.Text);
                }
            }
        }
        s.Numero_Registros = gvApuListadoRubro.PageSize;
        gvApuListadoRubro.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoRubro.Pagina_Actual = s.Pagina_Actual;

    }  

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Nombre = null, Apu_Subtitulo_Codigo_Desde = null, Apu_Subtitulo_Codigo_Hasta = null, Apu_Subtitulo_Nombre = null;
        string Apu_Titulo_Codigo_Desde = null, Apu_Titulo_Codigo_Hasta = null, Apu_Titulo_Nombre = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();
        Apu_Subtitulo_Codigo_Desde = e.InputParameters["Apu_Subtitulo_Codigo_Desde"].ToString();        
        Apu_Subtitulo_Codigo_Hasta = e.InputParameters["Apu_Subtitulo_Codigo_Hasta"].ToString();
        Apu_Subtitulo_Nombre = e.InputParameters["Apu_Subtitulo_Nombre"].ToString();
        Apu_Titulo_Codigo_Desde = e.InputParameters["Apu_Titulo_Codigo_Desde"].ToString();
        Apu_Titulo_Codigo_Hasta = e.InputParameters["Apu_Titulo_Codigo_Hasta"].ToString();
        Apu_Titulo_Nombre = e.InputParameters["Apu_Titulo_Nombre"].ToString();        

        FEL.APU.BO_Apu_Proyecto boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto();
        FEL.APU.BO_Apu_Rubro boApuRubro = new BO_Apu_Rubro();
        Total_Paginas = boApuRubro.TotalPaginas(s,Codigo_Desde,Codigo_Hasta,Nombre,Apu_Subtitulo_Codigo_Desde,Apu_Subtitulo_Codigo_Hasta,
            Apu_Subtitulo_Nombre,Apu_Titulo_Codigo_Desde,Apu_Titulo_Codigo_Hasta,Apu_Titulo_Nombre);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    [KPropiedadPersistente("PageSize")]
    override protected GridView Gv
    {
        get { return gvApuListadoRubro; }
    }
  
    private void EtiquetarBotones()
    {
        btnApuListadoRubroTecnica.Text = GetLocalResourceObject("Btn_Apu_Listado_Rubro_TecnicaRecursoKCG.Text").ToString();
        btnApuListadoRubroTecnica.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Rubro_TecnicaRecursoKCG.ToolTip").ToString();
        btnApuListadoRubroNuevo.Text = GetLocalResourceObject("Btn_Apu_Listado_Rubro_NuevoRecursoKCG.Text").ToString();
        btnApuListadoRubroNuevo.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Rubro_NuevoRecursoKCG.ToolTip").ToString();
        Btn_Apu_Listado_Rubro_Reporte.Text = GetLocalResourceObject("Btn_Apu_Listado_Rubro_ReporteRecursoKCG.Text").ToString();
        Btn_Apu_Listado_Rubro_Reporte.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Rubro_ReporteRecursoKCG.ToolTip").ToString();
        Btn_Apu_Listado_Rubro_Rubro.Text = GetLocalResourceObject("Btn_Apu_Listado_Rubro_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Listado_Rubro_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Rubro_RubroRecursoKCG.ToolTip").ToString();
    }   

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuListadoRubro; }
    }

    [KPropiedadPersistente("ParametrosFiltro")] 
    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_RUBRO"; }
    }

    protected void btnApuListadoRubroTecnica_Click(object sender, EventArgs e)
    {
        string RubroId = gvApuListadoRubro.DataKeys[gvApuListadoRubro.SelectedIndex].Values["Id"].ToString();
        string RubroCodigo = gvApuListadoRubro.SelectedRow.Cells[1].Text;
        string RubroNombre = gvApuListadoRubro.SelectedRow.Cells[2].Text;
        string RubroUnidad = gvApuListadoRubro.SelectedRow.Cells[3].Text;
        string nombre = Server.UrlEncode(RubroNombre);
        Response.Redirect("~/APU/Apu_Rubro_Tecnica.aspx?Apu_Rubro_Id=" + RubroId + 
            "&Apu_Rubro_Codigo=" + RubroCodigo + 
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad + 
            "&Elem_PagActual=" + elem_PagActual.Text + 
            "&Elem_NumRegis=" + elem_NumRegis.Text + 
            "&Elem_Id=" + elem_Id.Text);
    }
    protected void Btn_Apu_Listado_Rubro_Reporte_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_RUBRO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s), "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Apu_Listado_Rubro_Rubro_Click(object sender, EventArgs e)
    {
        string RubroId = gvApuListadoRubro.DataKeys[gvApuListadoRubro.SelectedIndex].Values["Id"].ToString();
        Response.Redirect("~/APU/Apu_Rubro.aspx?Apu_Rubro_Id=" + RubroId +
            "&Elem_PagActual=" + elem_PagActual.Text +
            "&Elem_NumRegis=" + elem_NumRegis.Text +
            "&Elem_Id=" + elem_Id.Text);
    }

    protected void BtnReporteListadoApu_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_RUBRO_LISTADO.aspx" + Scope_Factory.Get_QueryString(s), "_blank", "scrollbars=yes, resizable=yes");
    }
}
