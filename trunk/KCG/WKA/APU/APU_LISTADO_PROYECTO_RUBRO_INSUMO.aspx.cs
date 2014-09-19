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

public partial class APU_APU_LISTADO_PROYECTO_RUBRO_INSUMO : PaginaBaseGridKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        gvApuListadoProyectoRubroInsumo.DataBound += new EventHandler(gvApuListadoProyectoRubroInsumo_DataBoundExiste);
        odsApuListadoProyectoRubroInsumo.Selecting += new ObjectDataSourceSelectingEventHandler(odsApuListadoProyectoRubroInsumo_Selecting);
        gvApuListadoProyectoRubroInsumo.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoProyectoRubroInsumo_SelectedIndexChanging);
        gvApuListadoProyectoRubroInsumo.SelectedIndexChanged += new EventHandler(gvApuListadoProyectoRubroInsumo_SelectedIndexChanged);
        gvApuListadoProyectoRubroInsumo.Sorting += new GridViewSortEventHandler(gvApuListadoProyectoRubroInsumo_Sorting);
    }

    void gvApuListadoProyectoRubroInsumo_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoProyectoRubroInsumo_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoProyectoRubroInsumo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoProyectoRubroInsumo.PageSize = NumPagina;
        gvApuListadoProyectoRubroInsumo.PageIndex = PageActual; 
    }

    void odsApuListadoProyectoRubroInsumo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Apu_Proyecto_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Proyecto_Codigo"].Valor.Length > 0)
        {
            string Apu_Proyecto_Codigo = KftFiltro.ParametrosFiltro["Apu_Proyecto_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Proyecto_Codigo"] = HER.Filtrado.NormalizarFiltrado(Apu_Proyecto_Codigo, "[%]", "%");
        }
        else
        {
            string Apu_Proyecto_Codigo = null;
            e.InputParameters["Apu_Proyecto_Codigo"] = HER.Filtrado.NormalizarFiltrado(Apu_Proyecto_Codigo, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Proyecto_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Proyecto_Nombre"].Valor.Length > 0)
        {
            string Apu_Proyecto_Nombre = KftFiltro.ParametrosFiltro["Apu_Proyecto_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Proyecto_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Proyecto_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Proyecto_Nombre = null;
            e.InputParameters["Apu_Proyecto_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Proyecto_Nombre, "[%]", "%");
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

        if (gvApuListadoProyectoRubroInsumo.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoProyectoRubroInsumo.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoProyectoRubroInsumo.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoProyectoRubroInsumo.PageSize;
            gvApuListadoProyectoRubroInsumo.Total_PaginasGruesa = PagGruesa;
            gvApuListadoProyectoRubroInsumo.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }
    
    void gvApuListadoProyectoRubroInsumo_DataBoundExiste(object sender, EventArgs e)
    {
        if (gvApuListadoProyectoRubroInsumo.DataKeys.Count <= 0)
        {
            Btn_Apu_Proyecto_Rubro_Insumo_Insumo.Enabled = false;
            Btn_Apu_Proyecto_Rubro_Insumo_Proyecto.Enabled = false;
            Btn_Apu_Proyecto_Rubro_Insumo_Rubro.Enabled = false;            
        }
        else
        {
            Btn_Apu_Proyecto_Rubro_Insumo_Insumo.Enabled = true;
            Btn_Apu_Proyecto_Rubro_Insumo_Proyecto.Enabled = true;
            Btn_Apu_Proyecto_Rubro_Insumo_Rubro.Enabled = true;            
        }
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Rubro_Insumo_Insumo.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_InsumoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Insumo_Insumo.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_InsumoRecursoKCG.ToolTip").ToString();
        Btn_Apu_Proyecto_Rubro_Insumo_Rubro.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Insumo_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_RubroRecursoKCG.ToolTip").ToString();
        Btn_Apu_Proyecto_Rubro_Insumo_Proyecto.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_ProyectoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Insumo_Proyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_Insumo_ProyectoRecursoKCG.ToolTip").ToString();
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsApuListadoProyectoRubroInsumo; }
    }

    [KPropiedadPersistente("ParametrosFiltro")]
    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_PROYECTO_RUBRO_INSUMO"; }
    }

    protected override GridView Gv
    {
        get { return gvApuListadoProyectoRubroInsumo; }
    }

    protected void Btn_Apu_Proyecto_Rubro_Insumo_Insumo_Click(object sender, EventArgs e)
    {
        string ProyectoId = gvApuListadoProyectoRubroInsumo.DataKeys[gvApuListadoProyectoRubroInsumo.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        string ProyectoCodigo = gvApuListadoProyectoRubroInsumo.SelectedRow.Cells[7].Text;
        string ProyectoNombre = gvApuListadoProyectoRubroInsumo.SelectedRow.Cells[8].Text;
        string tipo = gvApuListadoProyectoRubroInsumo.DataKeys[gvApuListadoProyectoRubroInsumo.SelectedIndex].Values["Tipo"].ToString();

        switch (tipo)
        {
            case "MAT":
                Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
                break;
            case "TRA":
                Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
                break;
            case "MAN":
                Response.Redirect("~/APU/APU_PROYECTO_MANO_OBRA.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
                break;
            case "EQU":
                Response.Redirect("~/APU/APU_PROYECTO_EQUIPO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
                break;
        }
    }
    protected void Btn_Apu_Proyecto_Rubro_Insumo_Rubro_Click(object sender, EventArgs e)
    {
        string ProyectoId = gvApuListadoProyectoRubroInsumo.DataKeys[gvApuListadoProyectoRubroInsumo.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        string ProyectoCodigo = gvApuListadoProyectoRubroInsumo.SelectedRow.Cells[7].Text;
        string ProyectoNombre = gvApuListadoProyectoRubroInsumo.SelectedRow.Cells[8].Text;
        //Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
    }
    protected void Btn_Apu_Proyecto_Rubro_Insumo_Proyecto_Click(object sender, EventArgs e)
    {
        string val = gvApuListadoProyectoRubroInsumo.DataKeys[gvApuListadoProyectoRubroInsumo.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        //Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Proyecto_Codigo = null, Apu_Proyecto_Nombre = null, Apu_Rubro_Nombre = null, Apu_Insumo_Nombre = null, Tipo = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Apu_Proyecto_Codigo = e.InputParameters["Apu_Proyecto_Codigo"].ToString();
        Apu_Proyecto_Nombre = e.InputParameters["Apu_Proyecto_Nombre"].ToString();
        Apu_Rubro_Nombre = e.InputParameters["Apu_Rubro_Nombre"].ToString();
        Apu_Insumo_Nombre = e.InputParameters["Apu_Insumo_Nombre"].ToString();
        Tipo = e.InputParameters["Tipo"].ToString();
        
        FEL.APU.BO_Apu_Proyecto_Rubro_Insumo boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto_Rubro_Insumo();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, s.Int_Sucursal_Id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Nombre, 
            Apu_Insumo_Nombre, Tipo);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        if (gvApuListadoProyectoRubroInsumo.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoProyectoRubroInsumo.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoProyectoRubroInsumo.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoProyectoRubroInsumo.Indice_Navegacion;
            else if (!seleccionado)
                s.Pagina_Actual = 1;
        }
        s.Numero_Registros = gvApuListadoProyectoRubroInsumo.PageSize;
        gvApuListadoProyectoRubroInsumo.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoProyectoRubroInsumo.Pagina_Actual = s.Pagina_Actual;

    }
}
