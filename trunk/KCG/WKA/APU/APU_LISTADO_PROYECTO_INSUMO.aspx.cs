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


public partial class APU_APU_LISTADO_PROYECTO_INSUMO : PaginaBaseGridKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        gvApuListadoProyectoInsumo.DataBound += new EventHandler(gvApuListadoProyectoInsumo_DataBoundExiste);
        odsgvApuListadoProyectoInsumo.Selecting += new ObjectDataSourceSelectingEventHandler(odsgvApuListadoProyectoInsumo_Selecting);
        gvApuListadoProyectoInsumo.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoProyectoInsumo_SelectedIndexChanging);
        gvApuListadoProyectoInsumo.SelectedIndexChanged += new EventHandler(gvApuListadoProyectoInsumo_SelectedIndexChanged);
        gvApuListadoProyectoInsumo.Sorting += new GridViewSortEventHandler(gvApuListadoProyectoInsumo_Sorting);
    }

    void gvApuListadoProyectoInsumo_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoProyectoInsumo_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void gvApuListadoProyectoInsumo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoProyectoInsumo.PageSize = NumPagina;
        gvApuListadoProyectoInsumo.PageIndex = PageActual; 
    }

    void odsgvApuListadoProyectoInsumo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        if (gvApuListadoProyectoInsumo.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoProyectoInsumo.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoProyectoInsumo.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoProyectoInsumo.PageSize;
            gvApuListadoProyectoInsumo.Total_PaginasGruesa = PagGruesa;
            gvApuListadoProyectoInsumo.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    void gvApuListadoProyectoInsumo_DataBoundExiste(object sender, EventArgs e)
    {
        if (gvApuListadoProyectoInsumo.DataKeys.Count <= 0)
        {
            Btn_Apu_Proyecto_Insumo_Proyecto.Enabled = false;
            Btn_Apu_Proyecto_Insumo_Insumo.Enabled = false;
        }
        else
        {
            Btn_Apu_Proyecto_Insumo_Proyecto.Enabled = true;
            Btn_Apu_Proyecto_Insumo_Insumo.Enabled = true;
        }

    }
    
    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Insumo_Insumo.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Insumo_InsumoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Insumo_Insumo.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Insumo_InsumoRecursoKCG.ToolTip").ToString();
        Btn_Apu_Proyecto_Insumo_Proyecto.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Insumo_ProyectoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Insumo_Proyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Insumo_ProyectoRecursoKCG.ToolTip").ToString();
    }

    protected void Btn_Apu_Proyecto_Insumo_Insumo_Click(object sender, EventArgs e)
    {
        string tipo = gvApuListadoProyectoInsumo.DataKeys[gvApuListadoProyectoInsumo.SelectedIndex].Values["Tipo"].ToString();
        string ProyectoId = gvApuListadoProyectoInsumo.DataKeys[gvApuListadoProyectoInsumo.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        string ProyectoCodigo = gvApuListadoProyectoInsumo.SelectedRow.Cells[6].Text;
        string ProyectoNombre = gvApuListadoProyectoInsumo.SelectedRow.Cells[7].Text;
        string ProyectoEtapa = gvApuListadoProyectoInsumo.DataKeys[gvApuListadoProyectoInsumo.SelectedIndex].Values["Apu_Proyecto_Etapa"].ToString();

        switch (tipo)
        {
            case "MAT":
                Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre + "&Apu_Proyecto_Etapa=" + ProyectoEtapa);
                //Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre + "&Apu_Proyecto_Etapa=" + ProyectoEtapa);
                break;
            case "TRA":
                Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre + "&Apu_Proyecto_Etapa=" + ProyectoEtapa);
                break;
            case "MAN":
                Response.Redirect("~/APU/APU_PROYECTO_MANO_OBRA.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre + "&Apu_Proyecto_Etapa=" + ProyectoEtapa);
                break;
            case "EQU":
                Response.Redirect("~/APU/APU_PROYECTO_EQUIPO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre + "&Apu_Proyecto_Etapa=" + ProyectoEtapa);
                break;
        }
    }
    protected void Btn_Apu_Proyecto_Insumo_Proyecto_Click(object sender, EventArgs e)
    {
        string val = gvApuListadoProyectoInsumo.DataKeys[gvApuListadoProyectoInsumo.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        //Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvApuListadoProyectoInsumo.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoProyectoInsumo.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoProyectoInsumo.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoProyectoInsumo.Indice_Navegacion;
            else if (!seleccionado)
                s.Pagina_Actual = 1;
        }
        s.Numero_Registros = gvApuListadoProyectoInsumo.PageSize;
        gvApuListadoProyectoInsumo.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoProyectoInsumo.Pagina_Actual = s.Pagina_Actual;

    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Apu_Proyecto_Codigo = null, Apu_Proyecto_Nombre = null, Apu_Insumo_Nombre = null, Tipo = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Apu_Proyecto_Codigo = e.InputParameters["Apu_Proyecto_Codigo"].ToString();
        Apu_Proyecto_Nombre = e.InputParameters["Apu_Proyecto_Nombre"].ToString();
        Apu_Insumo_Nombre = e.InputParameters["Apu_Insumo_Nombre"].ToString();
        Tipo = e.InputParameters["Tipo"].ToString();        

        FEL.APU.BO_Apu_Proyecto_Insumo boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto_Insumo();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Apu_Proyecto_Codigo, 
            Apu_Proyecto_Nombre, Apu_Insumo_Nombre, Tipo);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;


    }

    protected override GridView Gv
    {
        get { return gvApuListadoProyectoInsumo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuListadoProyectoInsumo; }
    }

    [KPropiedadPersistente("ParametrosFiltro")]
    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_PROYECTO_INSUMO"; }
    }    

    
}
