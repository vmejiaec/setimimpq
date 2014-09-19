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
using Koala.KoalaWebControls;
using FEL.APU;
using FEL.FIS;
using System.Collections.Generic;

public partial class FIS_FIS_PRESUPUESTO_PROYECTO : PaginaBaseGridKCG
{
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnl_Proyecto.DataBind();
        //txt_Proy.DataBind();        
        odsGv_Fis_Presupuesto_Proyecto.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Presupuesto_Proyecto_Selecting);
        Gv_Fis_Presupuesto_Proyecto.SelectedIndexChanged += new EventHandler(Gv_Fis_Presupuesto_Proyecto_SelectedIndexChanged);
        Gv_Fis_Presupuesto_Proyecto.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Presupuesto_Proyecto_SelectedIndexChanging);
        Gv_Fis_Presupuesto_Proyecto.Sorting += new GridViewSortEventHandler(Gv_Fis_Presupuesto_Proyecto_Sorting);
        Gv_Fis_Presupuesto_Proyecto.DataBound += new EventHandler(Gv_Fis_Presupuesto_Proyecto_DataBound);
    }

    void Gv_Fis_Presupuesto_Proyecto_DataBound(object sender, EventArgs e)
    {
        //pnl_Proyecto.DataBind();
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        decimal monto_ = 0;
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];

        if (!IsPostBack)
        {
            FEL.FIS.BO_Fis_Fiscalizacion boFisFiscalizacion = new BO_Fis_Fiscalizacion();
            List<Fis_Fiscalizacion> litFisFiscalizacion = boFisFiscalizacion.GetByFiscalizacion("", s, ApuPresupuestoId);
            if (litFisFiscalizacion.Count > 0)
            {
                txt_CodCosto.Text = litFisFiscalizacion[0].Apu_Origen_Codigo;
                txt_CodInts.Text = litFisFiscalizacion[0].Codigo_Institucion;
                txt_FechaI.Text = Convert.ToString(litFisFiscalizacion[0].Fecha_Ini_Contrato);
                txt_Plazo.Text = Convert.ToString(litFisFiscalizacion[0].Plazo_Contrato);
                txt_FechaF.Text = Convert.ToString(litFisFiscalizacion[0].Fecha_Fin_Contrato);
                txt_Estado.Text = litFisFiscalizacion[0].Estado_Nombre;
                txt_Proy.Text = litFisFiscalizacion[0].Apu_Origen_Nombre;
                monto_ = litFisFiscalizacion[0].Costo_Total;
                txt_Monto.Text = monto_.ToString("N2");
            }
        }
    }

    void Gv_Fis_Presupuesto_Proyecto_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void Gv_Fis_Presupuesto_Proyecto_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Presupuesto_Proyecto.PageSize = NumPagina;
        Gv_Fis_Presupuesto_Proyecto.PageIndex = PageActual;
    }

    void Gv_Fis_Presupuesto_Proyecto_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
    }

    void odsGv_Fis_Presupuesto_Proyecto_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
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

        if (KftFiltro.ParametrosFiltro["Apu_Rubro_Cantidad"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Rubro_Cantidad"].Valor.Length > 0)
        {
            string Apu_Rubro_Cantidad_Desde = KftFiltro.ParametrosFiltro["Apu_Rubro_Cantidad"].Valor[0].ToString();
            e.InputParameters["Apu_Rubro_Cantidad_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Cantidad_Desde, "Desde");

            string Apu_Rubro_Cantidad_Hasta = KftFiltro.ParametrosFiltro["Apu_Rubro_Cantidad"].Valor[1].ToString();
            e.InputParameters["Apu_Rubro_Cantidad_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Cantidad_Hasta, "Hasta");
        }
        else
        {
            string Apu_Rubro_Cantidad_Desde = null;
            e.InputParameters["Apu_Rubro_Cantidad_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Cantidad_Desde, "Desde");

            string Apu_Rubro_Cantidad_Hasta = null;
            e.InputParameters["Apu_Rubro_Cantidad_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Apu_Rubro_Cantidad_Hasta, "Hasta");
        }

        if (Gv_Fis_Presupuesto_Proyecto.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Presupuesto_Proyecto.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Presupuesto_Proyecto.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Presupuesto_Proyecto.PageSize;
            Gv_Fis_Presupuesto_Proyecto.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Presupuesto_Proyecto.Pagina_Actual = s.Pagina_Actual;
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
        if (Gv_Fis_Presupuesto_Proyecto.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Presupuesto_Proyecto.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Presupuesto_Proyecto.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Presupuesto_Proyecto.Indice_Navegacion;
            else
            {
                if (!selecciona)
                    s.Pagina_Actual = 1;
            }
        }
        s.Numero_Registros = Gv_Fis_Presupuesto_Proyecto.PageSize;
        Gv_Fis_Presupuesto_Proyecto.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Presupuesto_Proyecto.Pagina_Actual = s.Pagina_Actual;
    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Rubro_Codigo = null, Apu_Rubro_Nombre = null, Apu_Rubro_Cantidad_Desde = null, Apu_Rubro_Cantidad_Hasta = null, Estado = "DIS";
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];

        Apu_Rubro_Codigo = e.InputParameters["Apu_Rubro_Codigo"].ToString();
        Apu_Rubro_Nombre = e.InputParameters["Apu_Rubro_Nombre"].ToString();
        Apu_Rubro_Cantidad_Desde = e.InputParameters["Apu_Rubro_Cantidad_Desde"].ToString();
        Apu_Rubro_Cantidad_Hasta = e.InputParameters["Apu_Rubro_Cantidad_Hasta"].ToString();      

        FEL.APU.BO_Apu_Presupuesto_Rubro boApuTotalPaginas = new BO_Apu_Presupuesto_Rubro();
        
        Total_Paginas = boApuTotalPaginas.TotalPaginas(s, ApuPresupuestoId, Estado, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Convert.ToDecimal(Apu_Rubro_Cantidad_Desde), Convert.ToDecimal(Apu_Rubro_Cantidad_Hasta));

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }

    protected void Btn_Fis_Fiscalizacion_Click(object sender, EventArgs e)
    {
        string FisFisId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + FisFisId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Presupuesto_Formula_Click(object sender, EventArgs e)
    {
        string FisFisId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_FORMULA.aspx?Apu_Presupuesto_Id=" + FisFisId + "&Estado=" + "DIS" + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Presupuesto_Cuadrilla_Click(object sender, EventArgs e)
    {
        string FisFisId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_CUADRILLA.aspx?Apu_Presupuesto_Id=" + FisFisId + "&Estado=" + "DIS" + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Formula_Definitiva_Click(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_FORMULA.aspx?Apu_Presupuesto_Id=" + Presupuesto_Id + "&Estado=" + "REA" + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Cuadrilla_Definitiva_Click(object sender, EventArgs e)
    {
        string Presupuesto_Id = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/APU/APU_PRESUPUESTO_CUADRILLA.aspx?Apu_Presupuesto_Id=" + Presupuesto_Id + "&Estado=" + "REA" + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected override string Contenedor
    {
        get { return "FIS_PRESUPUESTO_PROYECTO"; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    //[KPropiedadPersistente("ParametrosFiltro")]
    protected override GridView Gv
    {
        get { return Gv_Fis_Presupuesto_Proyecto; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Presupuesto_Proyecto; }
    }
}
