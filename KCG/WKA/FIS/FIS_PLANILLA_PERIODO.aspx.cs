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

public partial class FIS_FIS_PLANILLA_PERIODO : PaginaBaseGridKCG
{
    //Variables Globales
    public bool selecciona = false;
    public bool seleccion = false;
    int NumPagina = 20;
    int PageActual = 0;
    int PagGruesa = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Gv_Fis_Planilla_Periodo.PageSize = NumPagina;
            DateTime actual = DateTime.Today;
            string fecha_Inicio = Request.QueryString["Fecha_Inicial"];
            string fecha_Fin = Request.QueryString["Fecha_Final"];
            if (fecha_Inicio != "" && fecha_Fin != "" && fecha_Inicio != null && fecha_Fin != null)
            {
                Fecha_Inicial.Text = fecha_Inicio;
                Fecha_Final.Text = fecha_Fin;
            }
            else
            {
                DateTime fechaInicio = new DateTime(actual.Year, actual.Month, 01);
                DateTime fechaFin = new DateTime(actual.Year, actual.Month, DateTime.DaysInMonth(actual.Year, actual.Month));
                Fecha_Inicial.Text = fechaInicio.ToString("dd/MM/yyyy");
                Fecha_Final.Text = fechaFin.ToString("dd/MM/yyyy");
            }
        }           
        pnl_Filtros.DataBind();

        Gv_Fis_Planilla_Periodo.DataBound += new EventHandler(Gv_Fis_Planilla_Periodo_DataBound);
        odsGv_Fis_Planilla_Periodo.Selecting += new ObjectDataSourceSelectingEventHandler(odsGv_Fis_Planilla_Periodo_Selecting);
        Gv_Fis_Planilla_Periodo.SelectedIndexChanged += new EventHandler(Gv_Fis_Planilla_Periodo_SelectedIndexChanged);
        Gv_Fis_Planilla_Periodo.Sorting += new GridViewSortEventHandler(Gv_Fis_Planilla_Periodo_Sorting);
        Gv_Fis_Planilla_Periodo.SelectedIndexChanging += new GridViewSelectEventHandler(Gv_Fis_Planilla_Periodo_SelectedIndexChanging);
    }

    void Gv_Fis_Planilla_Periodo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        seleccion = true;
        NumPagina = Convert.ToInt32(NumRegistros.Text);
        Gv_Fis_Planilla_Periodo.PageSize = NumPagina;
        Gv_Fis_Planilla_Periodo.PageIndex = PageActual;
    }

    void Gv_Fis_Planilla_Periodo_SelectedIndexChanged(object sender, EventArgs e)
    {
        selecciona = true;
    }

    void Gv_Fis_Planilla_Periodo_Sorting(object sender, GridViewSortEventArgs e)
    {
        selecciona = true;
    }

    void Gv_Fis_Planilla_Periodo_DataBound(object sender, EventArgs e)
    {
        if (Gv_Fis_Planilla_Periodo.SelectedIndex > -1)
        {
            Btn_Proyecto.Enabled = true;
            Btn_Planilla_Proyecto.Enabled = true;
            Btn_Resumen_Planilla.Enabled = true;
        }
        else
        {
            Btn_Proyecto.Enabled = false;
            Btn_Planilla_Proyecto.Enabled = false;
            Btn_Resumen_Planilla.Enabled = false;
        }
    }

    void odsGv_Fis_Planilla_Periodo_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (KftFiltro.ParametrosFiltro["Apu_Presupuesto_Codigo_Institucional"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Presupuesto_Codigo_Institucional"].Valor.Length > 0)
        {
            string Apu_Presupuesto_Codigo_Institucional = KftFiltro.ParametrosFiltro["Apu_Presupuesto_Codigo_Institucional"].Valor[0].ToString();
            e.InputParameters["Apu_Presupuesto_Codigo_Institucional"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Codigo_Institucional, "[%]", "%");
        }
        else
        {
            string Apu_Presupuesto_Codigo_Institucional = null;
            e.InputParameters["Apu_Presupuesto_Codigo_Institucional"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Codigo_Institucional, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Apu_Presupuesto_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Apu_Presupuesto_Nombre"].Valor.Length > 0)
        {
            string Apu_Presupuesto_Nombre = KftFiltro.ParametrosFiltro["Apu_Presupuesto_Nombre"].Valor[0].ToString();
            e.InputParameters["Apu_Presupuesto_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Nombre, "[%]", "%");
        }
        else
        {
            string Apu_Presupuesto_Nombre = null;
            e.InputParameters["Apu_Presupuesto_Nombre"] = HER.Filtrado.NormalizarFiltrado(Apu_Presupuesto_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Contratista_Per_Personal_Nombre"].Valor != null && KftFiltro.ParametrosFiltro["Contratista_Per_Personal_Nombre"].Valor.Length > 0)
        {
            string Contratista_Per_Personal_Nombre = KftFiltro.ParametrosFiltro["Contratista_Per_Personal_Nombre"].Valor[0].ToString();
            e.InputParameters["Contratista_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Contratista_Per_Personal_Nombre, "[%]", "%");
        }
        else
        {
            string Contratista_Per_Personal_Nombre = null;
            e.InputParameters["Contratista_Per_Personal_Nombre"] = HER.Filtrado.NormalizarFiltrado(Contratista_Per_Personal_Nombre, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Numero_Planilla"].Valor != null && KftFiltro.ParametrosFiltro["Numero_Planilla"].Valor.Length > 0)
        {
            string Numero_Planilla_Desde = KftFiltro.ParametrosFiltro["Numero_Planilla"].Valor[0].ToString();
            e.InputParameters["Numero_Planilla_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Numero_Planilla_Desde, "Desde");

            string Numero_Planilla_Hasta = KftFiltro.ParametrosFiltro["Numero_Planilla"].Valor[1].ToString();
            e.InputParameters["Numero_Planilla_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Numero_Planilla_Hasta, "Hasta");
        }
        else
        {
            string Numero_Planilla_Desde = null;
            e.InputParameters["Numero_Planilla_Desde"] = HER.Filtrado.NormalizarFiltradoCodigo(Numero_Planilla_Desde, "Desde");

            string Numero_Planilla_Hasta = null;
            e.InputParameters["Numero_Planilla_Hasta"] = HER.Filtrado.NormalizarFiltradoCodigo(Numero_Planilla_Hasta, "Hasta");
        }

        //if (KftFiltro.ParametrosFiltro["Fecha_Inicial"].Valor != null && KftFiltro.ParametrosFiltro["Fecha_Inicial"].Valor.Length > 0)
        //{
        //    string Fecha_Inicial_Desde = KftFiltro.ParametrosFiltro["Fecha_Inicial"].Valor[0].ToString();
        //    e.InputParameters["Fecha_Inicial_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Inicial_Desde, "Desde");

        //    string Fecha_Final_Hasta = KftFiltro.ParametrosFiltro["Fecha_Inicial"].Valor[1].ToString();
        //    e.InputParameters["Fecha_Final_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Final_Hasta, "Hasta");
        //}
        //else
        //{
        //    string Fecha_Inicial_Desde = null;
        //    e.InputParameters["Fecha_Inicial_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Inicial_Desde, "Desde");

        //    string Fecha_Final_Hasta = null;
        //    e.InputParameters["Fecha_Final_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Final_Hasta, "Hasta");
        //}

        if (KftFiltro.ParametrosFiltro["Tipo_Planilla"].Valor != null && KftFiltro.ParametrosFiltro["Tipo_Planilla"].Valor.Length > 0)
        {
            string Tipo_Planilla = KftFiltro.ParametrosFiltro["Tipo_Planilla"].Valor[0].ToString();
            e.InputParameters["Tipo_Planilla"] = HER.Filtrado.NormalizarFiltrado(Tipo_Planilla, "[%]", "%");
        }
        else
        {
            string Tipo_Planilla = null;
            e.InputParameters["Tipo_Planilla"] = HER.Filtrado.NormalizarFiltrado(Tipo_Planilla, "[%]", "%");
        }

        if (KftFiltro.ParametrosFiltro["Total"].Valor != null && KftFiltro.ParametrosFiltro["Total"].Valor.Length > 0)
        {
            string Total_Desde = KftFiltro.ParametrosFiltro["Total"].Valor[0].ToString();
            e.InputParameters["Total_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Total_Desde, "Desde");

            string Total_Hasta = KftFiltro.ParametrosFiltro["Total"].Valor[1].ToString();
            e.InputParameters["Total_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Total_Hasta, "Hasta");
        }
        else
        {
            string Total_Desde = null;
            e.InputParameters["Total_Desde"] = HER.Filtrado.NormalizarFiltradoDecimal(Total_Desde, "Desde");

            string Total_Hasta = null;
            e.InputParameters["Total_Hasta"] = HER.Filtrado.NormalizarFiltradoDecimal(Total_Hasta, "Hasta");
        }

        if (KftFiltro.ParametrosFiltro["Fecha_Pago"].Valor != null && KftFiltro.ParametrosFiltro["Fecha_Pago"].Valor.Length > 0)
        {
            string Fecha_Pago_Desde = KftFiltro.ParametrosFiltro["Fecha_Pago"].Valor[0].ToString();
            e.InputParameters["Fecha_Pago_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Pago_Desde, "Desde");

            string Fecha_Pago_Hasta = KftFiltro.ParametrosFiltro["Fecha_Pago"].Valor[1].ToString();
            e.InputParameters["Fecha_Pago_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Pago_Hasta, "Hasta");
        }
        else
        {
            string Fecha_Pago_Desde = null;
            e.InputParameters["Fecha_Pago_Desde"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Pago_Desde, "Desde");

            string Fecha_Pago_Hasta = null;
            e.InputParameters["Fecha_Pago_Hasta"] = HER.Filtrado.NormalizarFiltradoFechas(Fecha_Pago_Hasta, "Hasta");
        }

        if (Gv_Fis_Planilla_Periodo.PageSize != NumPagina)
            seleccion = false;
        if (Gv_Fis_Planilla_Periodo.PageIndex != PageActual)
            seleccion = false;

        if (seleccion && Gv_Fis_Planilla_Periodo.Rows.Count > 0)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            PagGruesa = Convert.ToInt32(Pagina.Text);
            s.Numero_Registros = Gv_Fis_Planilla_Periodo.PageSize;
            Gv_Fis_Planilla_Periodo.Total_PaginasGruesa = PagGruesa;
            Gv_Fis_Planilla_Periodo.Pagina_Actual = s.Pagina_Actual;
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
        if (Gv_Fis_Planilla_Periodo.Campo_Edicion == 1)
            s.Pagina_Actual = Gv_Fis_Planilla_Periodo.Pagina_Actual;
        else
        {
            if (s.Pagina_Actual == 0) s.Pagina_Actual = 1;
            if (Gv_Fis_Planilla_Periodo.Indice_Navegacion != 0)
                s.Pagina_Actual = s.Pagina_Actual + Gv_Fis_Planilla_Periodo.Indice_Navegacion;
            else
            {
                if (!selecciona)
                    s.Pagina_Actual = 1;
            }
        }
        s.Numero_Registros = Gv_Fis_Planilla_Periodo.PageSize;
        Gv_Fis_Planilla_Periodo.Total_PaginasGruesa = GetTotalPaginas(e);
        Gv_Fis_Planilla_Periodo.Pagina_Actual = s.Pagina_Actual;

    }

    protected int GetTotalPaginas(ObjectDataSourceSelectingEventArgs e)
    {
        int Total_Paginas;
        string Apu_Presupuesto_Codigo_Institucional = null, Apu_Presupuesto_Nombre = null, Contratista_Per_Personal_Nombre = null, Numero_Planilla_Desde = null;
        string Numero_Planilla_Hasta = null, Tipo_Planilla = null, Fecha_Pago_Desde = null, Fecha_Pago_Hasta = null;
        string Total_Desde = null, Total_Hasta = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        Apu_Presupuesto_Codigo_Institucional = e.InputParameters["Apu_Presupuesto_Codigo_Institucional"].ToString();
        Apu_Presupuesto_Nombre = e.InputParameters["Apu_Presupuesto_Nombre"].ToString();
        Contratista_Per_Personal_Nombre = e.InputParameters["Contratista_Per_Personal_Nombre"].ToString();
        Numero_Planilla_Desde = e.InputParameters["Numero_Planilla_Desde"].ToString();
        Numero_Planilla_Hasta = e.InputParameters["Numero_Planilla_Hasta"].ToString();
        Tipo_Planilla = e.InputParameters["Tipo_Planilla"].ToString();
        Total_Desde = e.InputParameters["Total_Desde"].ToString();
        Total_Hasta = e.InputParameters["Total_Hasta"].ToString();
        Fecha_Pago_Desde = e.InputParameters["Fecha_Pago_Desde"].ToString();
        Fecha_Pago_Hasta = e.InputParameters["Fecha_Pago_Hasta"].ToString();

        FEL.FIS.BO_Fis_Planilla fisPlanilla = new BO_Fis_Planilla();
        Total_Paginas = fisPlanilla.TotalPaginas(s, Apu_Presupuesto_Codigo_Institucional, Apu_Presupuesto_Nombre, Contratista_Per_Personal_Nombre, Numero_Planilla_Desde,
            Numero_Planilla_Hasta, Convert.ToDateTime(Fecha_Inicial.Text), Convert.ToDateTime(Fecha_Final.Text), Tipo_Planilla, Convert.ToDecimal(Total_Desde),
            Convert.ToDecimal(Total_Hasta), Convert.ToDateTime(Fecha_Pago_Desde), Convert.ToDateTime(Fecha_Pago_Hasta));

        Pagina.Text = Total_Paginas.ToString();
        NumRegistros.Text = s.Numero_Registros.ToString();

        return Total_Paginas;
    }    

    protected void Btn_Proyecto_Click(object sender, EventArgs e)
    {        
        string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + 
            Presupuesto_Id +
            "&Fecha_I=" + Fecha_Inicial.Text +
            "&Fecha_F=" + Fecha_Final.Text);
    }

    protected void Btn_Planilla_Proyecto_Click(object sender, EventArgs e)
    {
        string Planilla_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Id"].ToString();
        string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        Response.Redirect("~/FIS/FIS_PLANILLA_DET.aspx?Fis_Planilla_Id=" + Planilla_Id + "&Fis_Fiscalizacion_Id=" + Presupuesto_Id + "&Fecha_Inicial=" + Fecha_Inicial.Text + "&Fecha_Final=" + Fecha_Final.Text);
    }

    protected void Btn_Resumen_Planilla_Click(object sender, EventArgs e)
    {
        string Planilla_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Id"].ToString();
        string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        Response.Redirect("~/FIS/FIS_PLANILLA_RESUMEN.aspx?Fis_Planilla_Id=" + 
            Planilla_Id + "&Fis_Fiscalizacion_Id=" + 
            Presupuesto_Id +
            "&Fecha_I=" + Fecha_Inicial.Text +
            "&Fecha_F=" + Fecha_Final.Text);
    }

    protected override string Contenedor
    {
        get { return "FIS_PLANILLA_PERIODO"; }
    }

    protected override KFiltro KftFiltro
    {
        get { return KFiltro; }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Planilla_Periodo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Planilla_Periodo; }
    }

    //protected void nav_Siguiente(object sender, EventArgs e)
    //{
    //    Gv_SelectedIndexChanged(sender, e);
    //}
}
