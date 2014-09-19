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

public partial class APU_APU_LISTADO_PROYECTO : PaginaBaseGridKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;
    string Apu_Proyecto_Id;

    protected void Page_Load(object sender, EventArgs e)
    {
        Seleccionar_PagFina();
        EtiquetarBotones();                
        Apu_Proyecto_Id = Request.QueryString["Apu_Proyecto_Id"];               
        
        gvApuListadoProyecto.DataBound += new EventHandler(gvApuListadoProyecto_DataBoundExiste);        
        gvApuListadoProyecto.SelectedIndexChanged += new EventHandler(gvApuListadoProyecto_SelectedIndexChanged);
        odsGvApuListadoProyecto.Selecting += new ObjectDataSourceSelectingEventHandler(odsGvApuListadoProyecto_Selecting);
        gvApuListadoProyecto.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuListadoProyecto_SelectedIndexChanging);
        gvApuListadoProyecto.Sorting += new GridViewSortEventHandler(gvApuListadoProyecto_Sorting);
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

    void gvApuListadoProyecto_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void gvApuListadoProyecto_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuListadoProyecto.PageSize = NumPagina;
        gvApuListadoProyecto.PageIndex = PageActual;
    }

    void gvApuListadoProyecto_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
        elem_Id.Text = Convert.ToString(gvApuListadoProyecto.SelectedIndex);//gvApuListadoProyecto.DataKeys[gvApuListadoProyecto.SelectedIndex].Values["Id"].ToString();
    }    

    void odsGvApuListadoProyecto_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        //Scope s = (Scope)Session["Scope"];

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

        if (KftFiltro.ParametrosFiltro["Coordinador_Per_Personal_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Coordinador_Per_Personal_Nombre"].Valor.Length > 0)
        {
            string Coordinador_Per_Personal_Nombre = KftFiltro.ParametrosFiltro["Coordinador_Per_Personal_Nombre"].Valor[0].ToString();
            e.InputParameters["Coordinador_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Coordinador_Per_Personal_Nombre, "[%]", "%");
        }
        else
        {
            string Coordinador_Per_Personal_Nombre = null;
            e.InputParameters["Coordinador_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Coordinador_Per_Personal_Nombre, "[%]", "%");
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

        if (gvApuListadoProyecto.PageSize != NumPagina)
            seleccion = false;
        if (gvApuListadoProyecto.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuListadoProyecto.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuListadoProyecto.PageSize;
            gvApuListadoProyecto.Total_PaginasGruesa = PagGruesa;
            gvApuListadoProyecto.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    
    void gvApuListadoProyecto_DataBoundExiste(object sender, EventArgs e)
    {

        if (gvApuListadoProyecto.DataKeys.Count <= 0)
        {            
            Btn_Apu_Listado_Proyecto_Proyecto.Enabled = false;
            //Btn_Clonar.Enabled = false;
            //Btn_Historico.Enabled = false;
        }
        else
       {                  
            Btn_Apu_Listado_Proyecto_Proyecto.Enabled = true;
            //Btn_Clonar.Enabled = true;
            //Btn_Historico.Enabled = true;
            Btn_Apu_Proyecto_Nuevo.Enabled = true;
        }

        elem_PagActual.Text = Convert.ToString(Scope.Pagina_Actual);
        elem_NumRegis.Text = NumRegistros.Text;
        if (gvApuListadoProyecto.SelectedIndex < gvApuListadoProyecto.Rows.Count)
        {
            if (!string.IsNullOrEmpty(elem_Id.Text))
                gvApuListadoProyecto.SelectedIndex = Convert.ToInt32(elem_Id.Text);
        }
        else
        {
            elem_Id.Text = "";
            elem_NumRegis.Text = "";
            elem_PagActual.Text = "";
        }
        //if(gvApuListadoProyecto.SelectedIndex == -1)
        //    gvApuListadoProyecto.SelectedIndex = 0; 

    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Nuevo.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_NuevoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Nuevo.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_NuevoRecursoKCG.ToolTip").ToString();
        //Btn_Clonar.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_ClonarRecursoKCG.Text").ToString();
        //Btn_Clonar.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_ClonarRecursoKCG.ToolTip").ToString();
        Btn_Apu_Listado_Proyecto_Proyecto.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_ProyectoRecursoKCG.Text").ToString();
        Btn_Apu_Listado_Proyecto_Proyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_ProyectoRecursoKCG.ToolTip").ToString();
        //Btn_Historico.Text = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_HistoricoRecursoKCG.Text").ToString();
        //Btn_Historico.ToolTip = GetLocalResourceObject("Btn_Apu_Listado_Proyecto_HistoricoRecursoKCG.ToolTip").ToString();                
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return gvApuListadoProyecto; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuListadoProyecto; }
    }

    [KPropiedadPersistente("ParametrosFiltro")]   
    protected override KFiltro KftFiltro
    {        
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_LISTADO_PROYECTO"; }
    }

    protected void Btn_Apu_Proyecto_Nuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO.aspx");
    }
    
    protected void Btn_Apu_Listado_Proyecto_Proyecto_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex < gvApuListadoProyecto.Rows.Count)
        {
            if (gvApuListadoProyecto.SelectedIndex > -1)
            {
                string ProyectoId = gvApuListadoProyecto.DataKeys[gvApuListadoProyecto.SelectedIndex].Values["Id"].ToString();
                Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId + "&Elem_PagActual=" + elem_PagActual.Text + "&Elem_NumRegis=" + elem_NumRegis.Text + "&Elem_Id=" + elem_Id.Text);
            }
        }
        selecciona = true;
    }

    protected void Btn_Clonar_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex < gvApuListadoProyecto.Rows.Count)
        {
            if (gvApuListadoProyecto.SelectedIndex > -1)
            {
                string ProyectoId = gvApuListadoProyecto.DataKeys[gvApuListadoProyecto.SelectedIndex].Values["Id"].ToString();
                Response.Redirect("~/APU/APU_CLONAR.aspx" +
                                    "?Dic_Objeto_Id=" + ProyectoId +
                                    "&Dic_Contenedor_Nombre=" + Contenedor + "&Elem_PagActual=" + elem_PagActual.Text + "&Elem_NumRegis=" + elem_NumRegis.Text + "&Elem_Id=" + elem_Id.Text);
            }
        }
    }

    protected void Btn_Historico_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex < gvApuListadoProyecto.Rows.Count)
        {
            if (gvApuListadoProyecto.SelectedIndex > -1)
            {
                string ProyectoId = gvApuListadoProyecto.DataKeys[gvApuListadoProyecto.SelectedIndex].Values["Id"].ToString();
                Response.Redirect("~/HIS/HIS_GENERAR_HISTORICO.aspx" +
                                    "?Dic_Objeto_Id=" + ProyectoId +
                                    "&Dic_Contenedor_Nombre=" + Contenedor + "&Elem_PagActual=" + elem_PagActual.Text + "&Elem_NumRegis=" + elem_NumRegis.Text + "&Elem_Id=" + elem_Id.Text);
            }
        }
    }
    protected void Btn_Reporte_Tecnica_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_RUBRO_TECNICA_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }
    protected void Btn_Reporte_Rubro_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_RUBRO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }
    protected void Btn_Reporte_Basico_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_RUBRO_BASICO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }
    protected void Btn_Reporte_Material_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_RUBRO_MATERIAL_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }
    protected void Btn_Reporte_Insumo_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_RUBRO_INSUMO_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }
    protected void Btn_Reporte_Memoria_Tecnica_Click(object sender, EventArgs e)
    {
        if (gvApuListadoProyecto.SelectedIndex > -1)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string ProyectoId = gvApuListadoProyecto.SelectedRow.Cells[2].Text;
            ResponseHelper.Redirect(servidor_reporte + "APU/APU_PROYECTO_INDICE_MEMORIA_REPORTE.aspx" + Scope_Factory.Get_QueryString(s) + "&Apu_Proyecto_Codigo=" + ProyectoId, "_blank", "scrollbars=yes, resizable=yes");
        }
    }


    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Estado = null, Nombre = null, Fecha_Creacion_Desde = null, Fecha_Creacion_Hasta = null;
        string Coordinador_Per_Personal_Nombre = null, Tecnico_Per_Personal_Nombre = null, Apu_Lugar_Nombre = null, Apu_Provincia_Nombre = null,  Apu_Presupuesto_Estado=null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
 
        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString(); 
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Estado = e.InputParameters["Estado"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();
        Fecha_Creacion_Desde = e.InputParameters["Fecha_Creacion_Desde"].ToString();
        Fecha_Creacion_Hasta = e.InputParameters["Fecha_Creacion_Hasta"].ToString();
        Coordinador_Per_Personal_Nombre = e.InputParameters["Coordinador_Per_Personal_Nombre"].ToString();
        Tecnico_Per_Personal_Nombre = e.InputParameters["Tecnico_Per_Personal_Nombre"].ToString();
        Apu_Lugar_Nombre = e.InputParameters["Apu_Lugar_Nombre"].ToString();
        Apu_Provincia_Nombre = e.InputParameters["Apu_Provincia_Nombre"].ToString();
        Apu_Presupuesto_Estado = e.InputParameters["Apu_Presupuesto_Estado"].ToString();

        FEL.APU.BO_Apu_Proyecto boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(
            s, 
            Codigo_Desde, 
            Codigo_Hasta, 
            Estado, 
            Nombre,
            Convert.ToDateTime(Fecha_Creacion_Desde), 
            Convert.ToDateTime(Fecha_Creacion_Hasta),
            Coordinador_Per_Personal_Nombre,
            Tecnico_Per_Personal_Nombre,
            Apu_Lugar_Nombre,
            Apu_Provincia_Nombre, 
            Apu_Presupuesto_Estado);

        Pagina.Text = Total_Paginas.ToString(); 
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;


    }

    protected void Tipo_Paginacion( ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvApuListadoProyecto.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuListadoProyecto.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuListadoProyecto.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuListadoProyecto.Indice_Navegacion;
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
        s.Numero_Registros = gvApuListadoProyecto.PageSize;
        gvApuListadoProyecto.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuListadoProyecto.Pagina_Actual = s.Pagina_Actual;

    }    
}
