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

public partial class APU_APU_LISTADO_PROYECTO_RUBRO : PaginaBaseGridKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        gvApuListadoProyectoRubro.DataBound += new EventHandler(gvApuListadoProyectoRubro_DataBoundExiste);
        odsgvApuListadoProyectoRubro.Selecting += new ObjectDataSourceSelectingEventHandler(odsgvApuListadoProyectoRubro_Selecting);
        gvApuListadoProyectoRubro.SelectedIndexChanged += new EventHandler(gvApuListadoProyectoRubro_SelectedIndexChanged);
        gvApuListadoProyectoRubro.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoProyectoRubro_SelectedIndexChanging);
        gvApuListadoProyectoRubro.Sorting += new GridViewSortEventHandler(gvApuListadoProyectoRubro_Sorting);
    }

    void gvApuListadoProyectoRubro_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void gvApuListadoProyectoRubro_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoProyectoRubro.PageSize = NumPagina;
        gvApuListadoProyectoRubro.PageIndex = PageActual;
    }

    void gvApuListadoProyectoRubro_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
    }

    void odsgvApuListadoProyectoRubro_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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
        
        if (KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor.Length > 0)
        {
            string Apu_Rubro_Codigo = KftFiltro.ParametrosFiltro["Apu_Rubro_Codigo"].Valor[0].ToString();
            e.InputParameters["Apu_Rubro_Codigo"] = HER.Filtrado.NormalizarFiltrado(Apu_Rubro_Codigo, "[%]", "%");
        }
        else
        {
            string Apu_Rubro_Codigo = null;
            e.InputParameters["Apu_Rubro_Codigo"] = HER.Filtrado.NormalizarFiltrado(Apu_Rubro_Codigo, "[%]", "%");
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

        if (gvApuListadoProyectoRubro.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoProyectoRubro.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoProyectoRubro.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoProyectoRubro.PageSize;
            gvApuListadoProyectoRubro.Total_PaginasGruesa = PagGruesa;
            gvApuListadoProyectoRubro.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    void gvApuListadoProyectoRubro_DataBoundExiste(object sender, EventArgs e)
    {
        if (gvApuListadoProyectoRubro.Rows.Count > 0)
        {            
            Btn_Apu_Proyecto_Rubro_Proyecto.Enabled = true;
            Btn_Apu_Proyecto_Rubro_Rubro.Enabled = true;
        }
        else
        {
            Btn_Apu_Proyecto_Rubro_Proyecto.Enabled = false;
            Btn_Apu_Proyecto_Rubro_Rubro.Enabled = false;
        }
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Rubro_Proyecto.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_ProyectoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Proyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_ProyectoRecursoKCG.ToolTip").ToString();
        Btn_Apu_Proyecto_Rubro_Rubro.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_Rubro_RubroRecursoKCG.ToolTip").ToString();
    }

    protected void Btn_Apu_Proyecto_Rubro_Proyecto_Click(object sender, EventArgs e)
    {
        string val = gvApuListadoProyectoRubro.DataKeys[gvApuListadoProyectoRubro.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        //Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + val);
    }
    protected void Btn_Apu_Proyecto_Rubro_Rubro_Click(object sender, EventArgs e)
    {
        string ProyectoId = gvApuListadoProyectoRubro.DataKeys[gvApuListadoProyectoRubro.SelectedIndex].Values["Apu_Proyecto_Id"].ToString();
        string ProyectoEstado = gvApuListadoProyectoRubro.DataKeys[gvApuListadoProyectoRubro.SelectedIndex].Values["Estado"].ToString();
        string ProyectoCodigo = gvApuListadoProyectoRubro.SelectedRow.Cells[5].Text;
        string ProyectoNombre = gvApuListadoProyectoRubro.SelectedRow.Cells[6].Text;
        // Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Apu_Proyecto_Codigo=" + ProyectoCodigo + "&Apu_Proyecto_Nombre=" + ProyectoNombre);
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx?Apu_Proyecto_Id=" + ProyectoId + 
            "&Apu_Proyecto_Codigo=" + ProyectoCodigo + 
            "&Apu_Proyecto_Nombre=" + ProyectoNombre +
            "&Estado=" + ProyectoEstado);
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvApuListadoProyectoRubro.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoProyectoRubro.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoProyectoRubro.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoProyectoRubro.Indice_Navegacion;
            else
            {
                if (!selecciona)
                    s.Pagina_Actual = 1;
            }
        }
        s.Numero_Registros = gvApuListadoProyectoRubro.PageSize;
        gvApuListadoProyectoRubro.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoProyectoRubro.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Proyecto_Codigo = null, Apu_Proyecto_Nombre = null, Apu_Rubro_Codigo = null, Apu_Rubro_Nombre = null, Apu_Subtitulo_Nombre = null, Apu_Titulo_Nombre = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Apu_Proyecto_Codigo = e.InputParameters["Apu_Proyecto_Codigo"].ToString();
        Apu_Proyecto_Nombre = e.InputParameters["Apu_Proyecto_Nombre"].ToString();
        Apu_Rubro_Codigo = e.InputParameters["Apu_Rubro_Codigo"].ToString();
        Apu_Rubro_Nombre = e.InputParameters["Apu_Rubro_Nombre"].ToString();
        Apu_Subtitulo_Nombre = e.InputParameters["Apu_Subtitulo_Nombre"].ToString();
        Apu_Titulo_Nombre = e.InputParameters["Apu_Titulo_Nombre"].ToString();        

        FEL.APU.BO_Apu_Proyecto_Rubro boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto_Rubro();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, s.Int_Sucursal_Id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }


    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuListadoProyectoRubro; }
    }

    [KPropiedadPersistente("ParametrosFiltro")]
    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_PROYECTO_RUBRO"; }
    }

    protected override GridView Gv
    {
        get { return gvApuListadoProyectoRubro; }
    }    
}
