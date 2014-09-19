using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;
using FEL.PER;
using Koala.KoalaWebControls;


public partial class APU_APU_PROYECTO_COORDINADOR : PaginaBaseKCG
{
    //Variables globales
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string Apu_Proyecto_Id = Request.QueryString["Apu_Proyecto_Id"];
        if (Apu_Proyecto_Id != null)
        {
            AsignarParametrosDataSourceDeatailsView(Apu_Proyecto_Id);
            Fv.DefaultMode = FormViewMode.ReadOnly;            
        }
        fvApuProyecto.DataBound += new EventHandler(fvApuProyecto_DataBound);
        Btn_Apu_Proyecto_Coordinador_Rubro.Click += new EventHandler(Btn_Apu_Proyecto_Coordinador_Rubro_Click);
        odsGvApuProyecto.Selecting += new ObjectDataSourceSelectingEventHandler(odsGvApuProyecto_Selecting);
        gvApuProyecto.Sorting += new GridViewSortEventHandler(gvApuProyecto_Sorting);
        odsFvApuProyecto.Updated += new ObjectDataSourceStatusEventHandler(odsFvApuProyecto_Updated);
        fvApuProyecto.ModeChanging += new FormViewModeEventHandler(fvApuProyecto_ModeChanging);
        gvApuProyecto.SelectedIndexChanging += new GridViewSelectEventHandler(gvApuProyecto_SelectedIndexChanging);
        gvApuProyecto.SelectedIndexChanged += new EventHandler(gvApuProyecto_SelectedIndexChanged);
    }

    void gvApuProyecto_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
    }

    void gvApuProyecto_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        gvApuProyecto.PageSize = NumPagina;
        gvApuProyecto.PageIndex = PageActual;
    }

    void fvApuProyecto_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Edit)
        {
            selecciona = true;
        }
        else if (e.NewMode == FormViewMode.Insert)
        {
            selecciona = true;
        }
        else
        {
            selecciona = true;
        }
    }

    void odsFvApuProyecto_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        selecciona = true;
    }

    void gvApuProyecto_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }                    

    void odsGvApuProyecto_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        if (KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor != null && KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor.Length > 0)
        {
            string Codigo_Desde = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[0].ToString();
            e.InputParameters["Fecha_Creacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Codigo_Desde, "Desde");

            string Codigo_Hasta = KftFiltro.ParametrosFiltro["Fecha_Creacion"].Valor[1].ToString();
            e.InputParameters["Fecha_Creacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Codigo_Hasta, "Hasta");
        }
        else
        {
            string Codigo_Desde = null;
            e.InputParameters["Fecha_Creacion_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Codigo_Desde, "Desde");

            string Codigo_Hasta = null;
            e.InputParameters["Fecha_Creacion_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Codigo_Hasta, "Hasta");
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

        if ((KftFiltro.ParametrosFiltro["Apu_Lugar_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Lugar_Nombre"].Valor.Length > 0))
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

        if ((KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor.Length > 0))
        {
            string Apu_Presupuesto_Estado = KftFiltro.ParametrosFiltro["Apu_Presupuesto_Estado"].Valor[0].ToString();
            e.InputParameters["Apu_Presupuesto_Estado"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Estado, "[%]", "%");
        }
        else
        {
            string Apu_Presupuesto_Estado = null;
            e.InputParameters["Apu_Presupuesto_Estado"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Estado, "[%]", "%");
        }

        if (gvApuProyecto.PageSize != NumPagina)
            seleccion = false;
        if (gvApuProyecto.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && gvApuProyecto.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = gvApuProyecto.PageSize;
            gvApuProyecto.Total_PaginasGruesa = PagGruesa;
            gvApuProyecto.Pagina_Actual = s.Pagina_Actual;
        }
        else
        {
            Tipo_Paginacion(e);
        }
    }

    void EstablecerAccesoBotonProyectoRubro()
    {
        Btn_Apu_Proyecto_Coordinador_Rubro.Enabled = true;
        if (Fv.CurrentMode == FormViewMode.Insert)
            Btn_Apu_Proyecto_Coordinador_Rubro.Enabled = false;
    }

    void Btn_Apu_Proyecto_Coordinador_Rubro_Click(object sender, EventArgs e)
    {
       /* Response.Redirect("~/APU/APU_PROYECTO_RUBRO_COORDINADOR.aspx" +
            "?Apu_Proyecto_Id=" + fvApuProyecto.DataKey["Id"] +
            "&Apu_Proyecto_Codigo=" + fvApuProyecto.DataKey["Codigo"] +
            "&Apu_Proyecto_Nombre=" + fvApuProyecto.DataKey["Nombre"]);*/
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_COORDINADOR.aspx" +
            "?Apu_Proyecto_Id=" + fvApuProyecto.DataKey["Id"] +
            "&Apu_Proyecto_Codigo=" + fvApuProyecto.DataKey["Codigo"] +
            "&Apu_Proyecto_Nombre=" + fvApuProyecto.DataKey["Nombre"]);
    }

    void fvApuProyecto_DataBound(object sender, EventArgs e)
    {
        EstablecerDatosPredeterminados();
        EstablecerAccesoBotonProyectoRubro();
    }

    private void EstablecerDatosPredeterminados()
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope) Session["Scope"];
            
            // Valor predeterminado para Apu_Lugar
            AsignarTextATextBox("Apu_Lugar_id", ObtenerLugarPredeterminadoId(s) );

            // Valor predeterminado para Area
            AsignarTextATextBox("Area", "0");

            // valor predeterminado para Porcentaje_Costo_Indirecto
            AsignarTextATextBox("Porcentaje_Costo_Indirecto", ObtenerPorcentajeCostoIndirecto(s).ToString());

            // Valor predeterminado Porcentaje_Costo_Otros
            AsignarTextATextBox("Porcentaje_Costo_Otros", "0");

            //Valor predetermindo Coordinador_Per_Personal_Id
            AsignarTextATextBox("Coordinador_Per_Personal_Id", s.Per_Personal_Id);

            //Valor predeterminado Tecnico_Per_Personal_Id
            AsignarTextATextBox("Tecnico_Per_Personal_Id", ObtenerPerPersonalTecnicoId(s));
        }
    }

    private void AsignarTextATextBox(string idTextBox, string text)
    {
        if ( string.IsNullOrEmpty( text ) ) return;
        Control ctrTextBox = Fv.FindControl(idTextBox);
        ((TextBox)ctrTextBox).Text = text;
    }

    private string ObtenerLugarPredeterminadoId(Scope s)
    {
        BO_Apu_Lugar boApuLugar = new BO_Apu_Lugar();
        List<Apu_Lugar> lstApuLugar = null;
        try
        {
            lstApuLugar = boApuLugar.GetByPredeterminadaS("", s);
        }
        catch{}
        
        if (lstApuLugar != null)
            if (lstApuLugar.Count == 1)
                return lstApuLugar[0].Id;
        
        return null;
    }

    private decimal ObtenerPorcentajeCostoIndirecto(Scope s)
    {
        BO_Apu_Parametros boApuParametros = new BO_Apu_Parametros();
        List<Apu_Parametros> lstApuPrametros = null;
        try
        {
            lstApuPrametros = boApuParametros.GetBySucursal("", s);
        }
        catch {}
        
        if (lstApuPrametros != null)
            if (lstApuPrametros.Count == 1)
                return lstApuPrametros[0].Porcentaje_Costo_Indirecto;
        
        return 0;
    }

    private string ObtenerPerPersonalTecnicoId(Scope s)
    {
        FEL.PER.BO_Per_Personal boPerPersonal = new BO_Per_Personal();
        List<Per_Personal> lstPerPersonal = null;
        try
        {
            lstPerPersonal = boPerPersonal.GetByJefeCostos("", s);
        }
        catch {}

        if (lstPerPersonal != null)
            if (lstPerPersonal.Count == 1)
                return lstPerPersonal[0].Id;

        return null;
    }

    protected void Tipo_Paginacion(ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        if (gvApuProyecto.Campo_Edicion == 1)
            s.Pagina_Actual = gvApuProyecto.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (gvApuProyecto.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + gvApuProyecto.Indice_Navegacion;
            else
            {
                if (!selecciona)
                    s.Pagina_Actual = 1;
            }
        }
        s.Numero_Registros = gvApuProyecto.PageSize;
        gvApuProyecto.Total_PaginasGruesa = GetTotalPaginas(e);
        gvApuProyecto.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Codigo_Desde = null, Codigo_Hasta = null, Nombre = null, Estado = null, Fecha_Creacion_Desde = null, Fecha_Creacion_Hasta= null;
        string Coordinador_Per_Personal_Nombre = null, Tecnico_Per_Personal_Nombre = null, Apu_Lugar_Nombre = null, Apu_Provincia_Nombre = null, Apu_Presupuesto_Estado=null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Codigo_Desde = e.InputParameters["Codigo_Desde"].ToString();
        Codigo_Hasta = e.InputParameters["Codigo_Hasta"].ToString();
        Estado = e.InputParameters["Estado"].ToString();
        Nombre = e.InputParameters["Nombre"].ToString();
        Coordinador_Per_Personal_Nombre = e.InputParameters["Coordinador_Per_Personal_Nombre"].ToString();
        Fecha_Creacion_Desde = e.InputParameters["Fecha_Creacion_Desde"].ToString();
        Fecha_Creacion_Hasta = e.InputParameters["Fecha_Creacion_Hasta"].ToString();
        Tecnico_Per_Personal_Nombre = e.InputParameters["Tecnico_Per_Personal_Nombre"].ToString();
        Apu_Lugar_Nombre = e.InputParameters["Apu_Lugar_Nombre"].ToString();
        Apu_Provincia_Nombre = e.InputParameters["Apu_Provincia_Nombre"].ToString();
        Apu_Presupuesto_Estado = e.InputParameters["Apu_Presupuesto_Estado"].ToString();

        FEL.APU.BO_Apu_Proyecto boApuTotalPaginas = new FEL.APU.BO_Apu_Proyecto();
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre, 
            Convert.ToDateTime(Fecha_Creacion_Desde), Convert.ToDateTime(Fecha_Creacion_Hasta), 
            Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);

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
        get { return typeof(Apu_Proyecto); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyecto; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyecto; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuProyecto; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuProyecto; }
    }

    protected override Button BResponderZoom
    {
        get { return btnResponderZoom; }
    }

    protected override Button BRegreso
    {
        get { return btnRegresar; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_COORDINADOR"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
