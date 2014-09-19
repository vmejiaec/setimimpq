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

public partial class FIS_FIS_LISTADO_FISCALIZACION : PaginaBaseGridKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Seleccionar_PagFina();
        if (!IsPostBack)
        {
            Btn_Fis_Presupuesto.Enabled = false;
            //Gv_Fis_Fiscalizacion.PageSize = NumPagina;
        }
        Gv_Fis_Fiscalizacion.DataBound += new EventHandler(Gv_Fis_Fiscalizacion_DataBound);
        odsGv_Fis_Fiscalizacion.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Fiscalizacion_Selecting);
        Gv_Fis_Fiscalizacion.SelectedIndexChanged += new EventHandler(Gv_Fis_Fiscalizacion_SelectedIndexChanged);
        Gv_Fis_Fiscalizacion.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Fiscalizacion_SelectedIndexChanging);
        Gv_Fis_Fiscalizacion.Sorting += new GridViewSortEventHandler(Gv_Fis_Fiscalizacion_Sorting);
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

    void Gv_Fis_Fiscalizacion_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void Gv_Fis_Fiscalizacion_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Fiscalizacion.PageSize = NumPagina;
        Gv_Fis_Fiscalizacion.PageIndex = PageActual;
    }

    void Gv_Fis_Fiscalizacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
        elem_Id.Text = Convert.ToString(Gv_Fis_Fiscalizacion.SelectedIndex);//Gv_Fis_Fiscalizacion.DataKeys[Gv_Fis_Fiscalizacion.SelectedIndex].Values["Id"].ToString();
    }

    void odsGv_Fis_Fiscalizacion_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        if (KftFiltro.ParametrosFiltro["Codigo_Institucion"].Valor != null && KftFiltro.ParametrosFiltro["Codigo_Institucion"].Valor.Length > 0)
        {
            string Codigo_Institucion = KftFiltro.ParametrosFiltro["Codigo_Institucion"].Valor[0].ToString();
            e.InputParameters["Codigo_Institucion"] = HER.Filtrado.NormalizarFiltrado(Codigo_Institucion, "[%]", "%");
        }
        else
        {
            string Codigo_Institucion = null;
            e.InputParameters["Codigo_Institucion"] = HER.Filtrado.NormalizarFiltrado(Codigo_Institucion, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Origen_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Origen_Nombre"].Valor.Length > 0)
        {
            string Nombre_Proyecto = KftFiltro.ParametrosFiltro["Apu_Origen_Nombre"].Valor[0].ToString();
            e.InputParameters["Nombre_Proyecto"] = HER.Filtrado.NormalizarFiltrado(Nombre_Proyecto, "[%]", "%");
        }
        else
        {
            string Nombre_Proyecto = null;
            e.InputParameters["Nombre_Proyecto"] = HER.Filtrado.NormalizarFiltrado(Nombre_Proyecto, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Estado"].Valor != null && KftFiltro.ParametrosFiltro["Estado"].Valor.Length > 0)
        {
            string Estado_Nombre = KftFiltro.ParametrosFiltro["Estado"].Valor[0].ToString();
            e.InputParameters["Estado"] = HER.Filtrado.NormalizarFiltrado(Estado_Nombre, "[%]", "%");
        }
        else
        {
            string Estado_Nombre = null;
            e.InputParameters["Estado"] = HER.Filtrado.NormalizarFiltrado(Estado_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Contratista"].Valor != null && KftFiltro.ParametrosFiltro["Contratista"].Valor.Length > 0)
        {
            string Contratista = KftFiltro.ParametrosFiltro["Contratista"].Valor[0].ToString();
            e.InputParameters["Contratista"] = HER.Filtrado.NormalizarFiltrado(Contratista, "[%]", "%");
        }
        else
        {
            string Contratista = null;
            e.InputParameters["Contratista"] = HER.Filtrado.NormalizarFiltrado(Contratista, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Fiscalizador"].Valor != null && KftFiltro.ParametrosFiltro["Fiscalizador"].Valor.Length > 0)
        {
            string Fiscalizador = KftFiltro.ParametrosFiltro["Fiscalizador"].Valor[0].ToString();
            e.InputParameters["Fiscalizador"] = HER.Filtrado.NormalizarFiltrado(Fiscalizador, "[%]", "%");
        }
        else
        {
            string Fiscalizador = null;
            e.InputParameters["Fiscalizador"] = HER.Filtrado.NormalizarFiltrado(Fiscalizador, "[%]", "%");
        }

        if (Gv_Fis_Fiscalizacion.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Fiscalizacion.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Fiscalizacion.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Fiscalizacion.PageSize;
            Gv_Fis_Fiscalizacion.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Fiscalizacion.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Codigo_Institucion = null, Nombre_Proyecto = null, Estado = null;
        string Contratista = null, Fiscalizador = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Codigo_Institucion = e.InputParameters["Codigo_Institucion"].ToString();
        Nombre_Proyecto = e.InputParameters["Nombre_Proyecto"].ToString();
        Estado = e.InputParameters["Estado"].ToString();
        Contratista = e.InputParameters["Contratista"].ToString();
        Fiscalizador = e.InputParameters["Fiscalizador"].ToString();

        FEL.FIS.BO_Fis_Fiscalizacion boFisCalizacion = new BO_Fis_Fiscalizacion();
        Total_Paginas = boFisCalizacion.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, Nombre_Proyecto, Estado,
            Contratista, Fiscalizador);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (Gv_Fis_Fiscalizacion.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Fiscalizacion.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Fiscalizacion.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Fiscalizacion.Indice_Navegacion;
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
        s.Numero_Registros = Gv_Fis_Fiscalizacion.PageSize;
        Gv_Fis_Fiscalizacion.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Fiscalizacion.Pagina_Actual = s.Pagina_Actual;

    }  

    void Gv_Fis_Fiscalizacion_DataBound(object sender, EventArgs e)
    {
        if (Gv_Fis_Fiscalizacion.Rows.Count > 0)
            Btn_Fis_Presupuesto.Enabled = true;
        else
            Btn_Fis_Presupuesto.Enabled = false;

        elem_PagActual.Text = Convert.ToString(Scope.Pagina_Actual);
        elem_NumRegis.Text = NumRegistros.Text;
        if (Gv_Fis_Fiscalizacion.SelectedIndex < Gv_Fis_Fiscalizacion.Rows.Count)
        {
            if (!string.IsNullOrEmpty(elem_Id.Text))
                Gv_Fis_Fiscalizacion.SelectedIndex = Convert.ToInt32(elem_Id.Text);
        }
        else
        {
            elem_Id.Text = "";
            elem_NumRegis.Text = "";
            elem_PagActual.Text = "";
        }
    }

    protected void Btn_Fis_Presupuesto_Click(object sender, EventArgs e)
    {
        if (Gv_Fis_Fiscalizacion.SelectedIndex < Gv_Fis_Fiscalizacion.Rows.Count)
        {
            if (Gv_Fis_Fiscalizacion.SelectedIndex > -1)
            {
                string FisFisId = Gv_Fis_Fiscalizacion.DataKeys[Gv_Fis_Fiscalizacion.SelectedIndex].Values["Id"].ToString();
                Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + FisFisId + 
                    "&Elem_PagActual=" + elem_PagActual.Text + 
                    "&Elem_NumRegis=" + elem_NumRegis.Text + 
                    "&Elem_Id=" + elem_Id.Text);
            }
        }
    }

    protected void Btn_Reporte_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                     + "FIS/R_FIS_LISTADO_FISCALIZACION.aspx"
                                     + Scope_Factory.Get_QueryString(s),
                                     "_blank", "scrollbars=yes, resizable=yes");  
    }

    protected override string Contenedor
    {
        get { return "FIS_LISTADO_FISCALIZACION"; }
    }

    [KPropiedadPersistente("ParametrosFiltro")] 
    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return Gv_Fis_Fiscalizacion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Fiscalizacion; }
    }
}
