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

public partial class APU_APU_LISTADO_OFERTA : PaginaBaseGridKCG 
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Seleccionar_PagFina();
        cargarBotones();
        gvapu_listado_oferta.DataBound += new EventHandler(gvapu_listado_oferta_DataBoundExiste);
        odsgvapu_listado_oferta.Selecting += new ObjectDataSourceSelectingEventHandler(odsgvapu_listado_oferta_Selecting);
        gvapu_listado_oferta.SelectedIndexChanged += new EventHandler(gvapu_listado_oferta_SelectedIndexChanged);
        gvapu_listado_oferta.SelectedIndexChanging += new GridViewSelectEventHandler(gvapu_listado_oferta_SelectedIndexChanging);
        gvapu_listado_oferta.Sorting += new GridViewSortEventHandler(gvapu_listado_oferta_Sorting);
        string Apu_Oferta_Id = Request.QueryString["Apu_Oferta_Id"];
        if (!string.IsNullOrEmpty(Apu_Oferta_Id) && !IsPostBack)
        {
            SeleccionarItemGridView(Apu_Oferta_Id);
        }
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

    void gvapu_listado_oferta_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void gvapu_listado_oferta_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvapu_listado_oferta.PageSize = NumPagina;
        gvapu_listado_oferta.PageIndex = PageActual;
    }

    void gvapu_listado_oferta_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
        elem_Id.Text = Convert.ToString(gvapu_listado_oferta.SelectedIndex);//gvapu_listado_oferta.DataKeys[gvapu_listado_oferta.SelectedIndex].Values["Id"].ToString();
    }

    void odsgvapu_listado_oferta_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        if (KftFiltro.ParametrosFiltro["Estado"].Valor != null && KftFiltro.ParametrosFiltro["Estado"].Valor.Length > 0)
        {
            string Estado = KftFiltro.ParametrosFiltro["Estado"].Valor[0].ToString();
            e.InputParameters["Estado"] = HER.Filtrado.NormalizarFiltrado(Estado, "[%]", "%");
        }
        else
        {
            string Estado = null;
            e.InputParameters["Estado"] = HER.Filtrado.NormalizarFiltrado(Estado, "[%]", "%");
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

        if (KftFiltro.ParametrosFiltro["Tecnico_Per_Personal_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Tecnico_Per_Personal_Nombre"].Valor.Length > 0)
        {
            string Tecnico_Per_Personal_Nombre = KftFiltro.ParametrosFiltro["Tecnico_Per_Personal_Nombre"].Valor[0].ToString();
            e.InputParameters["Tecnico_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Tecnico_Per_Personal_Nombre, "[%]", "%");
        }
        else
        {
            string Tecnico_Per_Personal_Nombre = null;
            e.InputParameters["Tecnico_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Tecnico_Per_Personal_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Lugar_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Lugar_Nombre"].Valor.Length > 0)
        {
            string Apu_Lugar_Nombre = KftFiltro.ParametrosFiltro["Apu_Lugar_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Lugar_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Lugar_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Lugar_Nombre = null;
            e.InputParameters["Apu_Lugar_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Lugar_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Provincia_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Provincia_Nombre"].Valor.Length > 0)
        {
            string Apu_Provincia_Nombre = KftFiltro.ParametrosFiltro["Apu_Provincia_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Provincia_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Provincia_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Provincia_Nombre = null;
            e.InputParameters["Apu_Provincia_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Provincia_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor.Length > 0)
        {
            string Apu_Presupuesto_Estado = KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor[0].ToString();
            e.InputParameters["Apu_Presupuesto_Estado"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Estado, "[%]", "%");
        }
        else
        {
            string Apu_Presupuesto_Estado = null;
            e.InputParameters["Apu_Presupuesto_Estado"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Estado, "[%]", "%");
        }

        if (gvapu_listado_oferta.PageSize != NumPagina)
            seleccion = false;
        if (gvapu_listado_oferta.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvapu_listado_oferta.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvapu_listado_oferta.PageSize;
            gvapu_listado_oferta.Total_PaginasGruesa = PagGruesa;
            gvapu_listado_oferta.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    void gvapu_listado_oferta_DataBoundExiste(object sender, EventArgs e)
    {
        if (gvapu_listado_oferta.DataKeys.Count <= 0)
        {            
            BtnOferta.Enabled = false;
            Btn_Reporte_Basico.Enabled = false;
            Btn_Reporte_Insumo.Enabled = false;
            Btn_Reporte_Material.Enabled = false;
            Btn_Reporte_Rubro.Enabled = false;
        }
        else
        {           
            BtnOferta.Enabled = true;
            Btn_Reporte_Basico.Enabled = true;
            Btn_Reporte_Insumo.Enabled = true;
            Btn_Reporte_Material.Enabled = true;
            Btn_Reporte_Rubro.Enabled = true;
        }

        elem_PagActual.Text = Convert.ToString(Scope.Pagina_Actual);
        elem_NumRegis.Text = NumRegistros.Text;
        if (gvapu_listado_oferta.SelectedIndex < gvapu_listado_oferta.Rows.Count)
        {
            if (!string.IsNullOrEmpty(elem_Id.Text))
                gvapu_listado_oferta.SelectedIndex = Convert.ToInt32(elem_Id.Text);
        }
        else
        {
            elem_Id.Text = "";
            elem_NumRegis.Text = "";
            elem_PagActual.Text = "";
        }
    }

    private void cargarBotones()
    {
        Btn_Apu_Listado_Oferta_Nuevo.Text = GetLocalResourceObject("Btn_Apu_Listado_Oferta_NuevoRecursoKCG.Text").ToString();
        Btn_Apu_Listado_Oferta_Nuevo.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Oferta_NuevoRecursoKCG.ToolTip").ToString();       
        BtnOferta.Text = GetLocalResourceObject("Btn_Apu_Listado_Oferta_OfertaRecursoKCG.Text").ToString();
        BtnOferta.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Oferta_OfertaRecursoKCG.ToolTip").ToString();
        BtnClonarOferta.Text = "Clonar Oferta.";
        BtnClonarOferta.ToolTip = "Clona la oferta seleccionada.";
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvapu_listado_oferta.Campo_Edicion == 1)
            s.Pagina_Actual = gvapu_listado_oferta.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvapu_listado_oferta.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvapu_listado_oferta.Indice_Navegacion;
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
        s.Numero_Registros = gvapu_listado_oferta.PageSize;
        gvapu_listado_oferta.Total_PaginasGruesa = GetTotalPaginas(e);
        gvapu_listado_oferta.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Estado = null, Nombre = null, Contratista = null, Tecnico_Per_Personal_Nombre = null, Apu_Lugar_Nombre = null, Apu_Provincia_Nombre = null, Apu_Presupuesto_Estado=null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Estado = e.InputParameters["Estado"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();
        Contratista = e.InputParameters["Contratista"].ToString();
        Tecnico_Per_Personal_Nombre = e.InputParameters["Tecnico_Per_Personal_Nombre"].ToString();
        Apu_Lugar_Nombre = e.InputParameters["Apu_Lugar_Nombre"].ToString();
        Apu_Provincia_Nombre = e.InputParameters["Apu_Provincia_Nombre"].ToString();
        Apu_Presupuesto_Estado = e.InputParameters["Apu_Presupuesto_Estado"].ToString();

        FEL.APU.BO_Apu_Oferta boApuTotalPaginas = new BO_Apu_Oferta();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Contratista,Tecnico_Per_Personal_Nombre,Apu_Lugar_Nombre,Apu_Provincia_Nombre, Apu_Presupuesto_Estado);

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    [KPropiedadPersistente("PageSize")]
    override protected GridView Gv
    {
        get { return gvapu_listado_oferta; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_listado_oferta; }
    }

    [KPropiedadPersistente("ParametrosFiltro")] 
    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_LISTADO_OFERTA"; }
    }    

    #region BOTONES

    protected void Btn_Apu_Listado_Oferta_Nuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA.aspx");
    }    
    protected void Btn_Apu_Listado_Oferta_Historico_Click(object sender, EventArgs e)
    {
        string ListadoId = gvapu_listado_oferta.DataKeys[gvapu_listado_oferta.SelectedIndex].Values["Id"].ToString();

    }    
    protected void BtnOferta_Click(object sender, EventArgs e)
    {
        string ListadoId = gvapu_listado_oferta.DataKeys[gvapu_listado_oferta.SelectedIndex].Values["Id"].ToString();
        Response.Redirect("~/APU/APU_OFERTA.aspx?Apu_Oferta_Id=" + ListadoId + 
            "&Elem_PagActual=" + elem_PagActual.Text + 
            "&Elem_NumRegis=" + elem_NumRegis.Text + 
            "&Elem_Id=" + elem_Id.Text);
    }

    protected void BtnClonarOferta_Click(object sender, EventArgs e)
    {   
        string ListadoId = gvapu_listado_oferta.DataKeys[gvapu_listado_oferta.SelectedIndex].Values["Id"].ToString();
        FEL.APU.BO_Apu_Oferta adpOferta = new BO_Apu_Oferta();
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        adpOferta.Clonar(s, ListadoId);
        
    }

    protected void Btn_Reporte_Rubro_Click(object sender, EventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvapu_listado_oferta.PageSize = NumPagina;
        gvapu_listado_oferta.PageIndex = PageActual;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string OfertaId = gvapu_listado_oferta.SelectedRow.Cells[2].Text;
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_RUBRO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Oferta_Codigo=" + OfertaId, "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Reporte_Basico_Click(object sender, EventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvapu_listado_oferta.PageSize = NumPagina;
        gvapu_listado_oferta.PageIndex = PageActual;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string OfertaId = gvapu_listado_oferta.SelectedRow.Cells[2].Text;
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_RUBRO_BASICO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Oferta_Codigo=" + OfertaId, "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Reporte_Material_Click(object sender, EventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvapu_listado_oferta.PageSize = NumPagina;
        gvapu_listado_oferta.PageIndex = PageActual;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string OfertaId = gvapu_listado_oferta.SelectedRow.Cells[2].Text;
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_RUBRO_MATERIAL_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Oferta_Codigo=" + OfertaId, "_blank", "scrollbars=yes, resizable=yes");
    }
    protected void Btn_Reporte_Insumo_Click(object sender, EventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvapu_listado_oferta.PageSize = NumPagina;
        gvapu_listado_oferta.PageIndex = PageActual;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string OfertaId = gvapu_listado_oferta.SelectedRow.Cells[2].Text;
        ResponseHelper.Redirect(servidor_reporte + "APU/APU_OFERTA_RUBRO_INSUMO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Oferta_Codigo=" + OfertaId, "_blank", "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Reporte_Proyecto_Oferta_Click(object sender, EventArgs e)
    {
        seleccion = true;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        ResponseHelper.Redirect(servidor_reporte + "APU/Apu_Proyecto_Oferta_Rubro_Reporte.aspx" + Scope_Factory.Get_QueryString(s), "_blank", "scrollbars=yes, resizable=yes");
    }

    #endregion
    
}
