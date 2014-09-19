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
using System.Globalization;
using FEL.APU;

public partial class APU_APU_MATERIAL : PaginaBaseKCG
{
    public bool seleccion = false;
    public bool seleccionado = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            gvApuMaterial.PageSize = NumPagina;  
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuMaterial);
        odsgvApuMaterial.Selecting += new ObjectDataSourceSelectingEventHandler(odsgvApuMaterial_Selecting);
        gvApuMaterial.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuMaterial_SelectedIndexChanging);
        gvApuMaterial.SelectedIndexChanged += new EventHandler(gvApuMaterial_SelectedIndexChanged);
        odsfvApuMaterial.Updated += new ObjectDataSourceStatusEventHandler(odsfvApuMaterial_Updated);
        fvApuMaterial.ModeChanging += new FormViewModeEventHandler(fvApuMaterial_ModeChanging);
        gvApuMaterial.Sorting += new GridViewSortEventHandler(gvApuMaterial_Sorting);
    }

    void gvApuMaterial_Sorting(object sender, GridViewSortEventArgs e)
    {
        seleccionado = true;
    }

    void fvApuMaterial_ModeChanging(object sender, FormViewModeEventArgs e)
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

    void odsfvApuMaterial_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        seleccionado = true;
    }

    void gvApuMaterial_SelectedIndexChanged(object sender, EventArgs e)
    {
        seleccionado = true;
    }

    void gvApuMaterial_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuMaterial.PageSize = NumPagina;
        gvApuMaterial.PageIndex = PageActual; 
    }

    void odsgvApuMaterial_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        if (KftFiltro.ParametrosFiltro["Unidad"].Valor != null && KftFiltro.ParametrosFiltro["Unidad"].Valor.Length > 0)
        {
            string Unidad = KftFiltro.ParametrosFiltro["Unidad"].Valor[0].ToString();
            e.InputParameters["Unidad"] = HER.Filtrado.NormalizarFiltrado(Unidad, "[%]", "%");
        }
        else
        {
            string Unidad = null;
            e.InputParameters["Unidad"] = HER.Filtrado.NormalizarFiltrado(Unidad, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Costo_Total"].Valor != null && KftFiltro.ParametrosFiltro["Costo_Total"].Valor.Length > 0)
        {
            string Codigo_Desde = KftFiltro.ParametrosFiltro["Costo_Total"].Valor[0].ToString();
            e.InputParameters["Costo_Total_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Desde, "Desde");

            string Codigo_Hasta = KftFiltro.ParametrosFiltro["Costo_Total"].Valor[1].ToString();
            e.InputParameters["Costo_Total_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Hasta, "Hasta");
        }
        else
        {
            string Codigo_Desde = null;
            e.InputParameters["Costo_Total_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Desde, "Desde");

            string Codigo_Hasta = null;
            e.InputParameters["Costo_Total_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Codigo_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Disponible"].Valor != null && KftFiltro.ParametrosFiltro["Disponible"].Valor.Length > 0)
        {
            string Disponible = KftFiltro.ParametrosFiltro["Disponible"].Valor[0].ToString();
            e.InputParameters["Disponible"] = HER.Filtrado.NormalizarFiltrado(Disponible, "[%]", "%");
        }
        else
        {
            string Disponible = null;
            e.InputParameters["Disponible"] = HER.Filtrado.NormalizarFiltrado(Disponible, "[%]", "%");
        }

        if (gvApuMaterial.PageSize != NumPagina)
            seleccion = false;
        if (gvApuMaterial.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuMaterial.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuMaterial.PageSize;
            gvApuMaterial.Total_PaginasGruesa = PagGruesa;
            gvApuMaterial.Pagina_Actual = s.Pagina_Actual;           
        }
        else
        {
            Tipo_Paginacion(e);
        }
        
    }
    void Fv_DataBoundApuMaterial(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox parcial = (TextBox)Fv.FindControl("Costo_Parcial");
            parcial.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_otros= (TextBox)Fv.FindControl("Costo_Otros");
            costo_otros.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox costo_transporte = (TextBox)Fv.FindControl("Costo_Transporte");
            costo_transporte.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Total = (TextBox)Fv.FindControl("Costo_Total");
            Costo_Total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Total_Costo_Transporte = (TextBox)Fv.FindControl("Costo_Total_Costo_Transporte");
            Costo_Total_Costo_Transporte.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            
        }
    }

    private void cargarBotones()
    {
        Btn_Clonar_Material.Text = GetLocalResourceObject("Btn_Clonar_MaterialRecursoKCG.Text").ToString();
        Btn_Clonar_Material.ToolTip = GetLocalResourceObject("Btn_Clonar_MaterialRecursoKCG.ToolTip").ToString();
        Btn_Historico_Material.Text = GetLocalResourceObject("Btn_Historico_MaterialRecursoKCG.Text").ToString();
        Btn_Historico_Material.ToolTip = GetLocalResourceObject("Btn_Historico_MaterialRecursoKCG.ToolTip").ToString();
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvApuMaterial.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuMaterial.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuMaterial.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuMaterial.Indice_Navegacion;
            else if (!seleccionado)
                s.Pagina_Actual = 1;
        }
        s.Numero_Registros = gvApuMaterial.PageSize;
        gvApuMaterial.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuMaterial.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, 
            Codigo_Hasta = null, 
            Nombre = null, 
            Unidad = null, 
            Costo_Total_Desde = null, 
            Costo_Total_Hasta = null, 
            Disponible = null;

        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();
        Unidad = e.InputParameters["Unidad"].ToString();
        Costo_Total_Desde = e.InputParameters["Costo_Total_Desde"].ToString();
        Costo_Total_Hasta = e.InputParameters["Costo_Total_Hasta"].ToString();
        Disponible = e.InputParameters["Disponible"].ToString();        

        FEL.APU.BO_Apu_Material boApuTotalPaginas = new BO_Apu_Material();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, 
                s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, 
                Convert.ToDecimal(Costo_Total_Desde), Convert.ToDecimal(Costo_Total_Hasta), 
                Disponible);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Material); }
    }

    protected override GridView Gv
    {
        get { return gvApuMaterial; }
    }

    protected override FormView Fv
    {
        get { return fvApuMaterial; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuMaterial; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuMaterial; }
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
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_MATERIAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Disponible_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList listaDisponoble = (DropDownList)sender;
            listaDisponoble.SelectedValue = "S";
        }
    }

    protected void Btn_Clonar_Material_Click(object sender, EventArgs e)
    {

        TextBox MaterialId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_CLONAR.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + MaterialId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);

    }

    protected void Btn_Historico_Material_Click(object sender, EventArgs e)
    {

        TextBox MaterialId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/HIS/HIS_GENERAR_HISTORICO.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + MaterialId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);

    }
}
