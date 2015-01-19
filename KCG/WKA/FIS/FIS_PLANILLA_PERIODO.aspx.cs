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
using System.Web.Services.Protocols;
using System.Collections.Generic;

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
        //string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        string Presupuesto_Id = "00106011285181209";
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + 
            Presupuesto_Id +
            "&Fecha_I=" + Fecha_Inicial.Text +
            "&Fecha_F=" + Fecha_Final.Text);
    }

    protected void Btn_Planilla_Proyecto_Click(object sender, EventArgs e)
    {
        string Planilla_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Id"].ToString();
        //string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        //00106011285181209
        string Presupuesto_Id = "00106011285181209";
        Response.Redirect("~/FIS/FIS_PLANILLA_DET.aspx?Fis_Planilla_Id=" + Planilla_Id + "&Fis_Fiscalizacion_Id=" + Presupuesto_Id + "&Fecha_Inicial=" + Fecha_Inicial.Text + "&Fecha_Final=" + Fecha_Final.Text);
    }

    protected void Btn_Resumen_Planilla_Click(object sender, EventArgs e)
    {
        string Planilla_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Id"].ToString();
        //string Presupuesto_Id = Gv_Fis_Planilla_Periodo.DataKeys[Gv_Fis_Planilla_Periodo.SelectedIndex].Values["Apu_Presupuesto_Id"].ToString();
        string Presupuesto_Id = "00106011285181209";
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

    // Controles para el Filtrar
    #region Controles para el Filtrar
    protected void Filtrar()
    {
        gvCom_Planilla_Pago.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Planilla_Pago.Text = ":";
        lbFvMsgInfoCom_Planilla_Pago.Text = "> Filtrado";
    }
    protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filtrar();
    }
    protected void btFiltrar_Click(object sender, EventArgs e)
    {
        Filtrar();
    }
    #endregion

    #region Eventos del GridView de Com_Planilla_Pago
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Planilla_Pago_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Planilla_Pago.CurrentMode != FormViewMode.ReadOnly)
            fvCom_Planilla_Pago.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Planilla_Pago.Text = ":";
        lbFvMsgInfoCom_Planilla_Pago.Text = "> Com_Planilla_Pago Seleccionado";
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Planilla_Pago(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Planilla_Pago.DataSourceObject;
            List<Com_Planilla_Pago> lista = (List<Com_Planilla_Pago>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Planilla_Pago.PageSize;
                noFila = pos - noPagina * gvCom_Planilla_Pago.PageSize;
            }
        }
        gvCom_Planilla_Pago.PageIndex = noPagina;
        gvCom_Planilla_Pago.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Com_Planilla_Pago
    #region Eventos el FormView de Com_Planilla_Pago
    protected void fvCom_Planilla_Pago_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorCom_Planilla_Pago.Text == ":") lbFvMsgErrorCom_Planilla_Pago.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Planilla_Pago(gvCom_Planilla_Pago, tbFiltroId.Text);
            gvCom_Planilla_Pago.DataBind();
        }
    }
    protected void fvCom_Planilla_Pago_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorCom_Planilla_Pago.Text == ":") lbFvMsgErrorCom_Planilla_Pago.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Planilla_Pago_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorCom_Planilla_Pago.Text == ":") lbFvMsgErrorCom_Planilla_Pago.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Planilla_Pago(gvCom_Planilla_Pago, tbFiltroId.Text);
            gvCom_Planilla_Pago.DataBind();
        }
    }
    protected void fvCom_Planilla_Pago_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Pago"] = DateTime.Parse((string)e.Values["Fecha_Pago"]);
        e.Values["Valor_Cta_X_Cobrar"] = Decimal.Parse((string)e.Values["Valor_Cta_X_Cobrar"]);
        e.Values["Fecha_Pago_Confirmada"] = DateTime.Parse((string)e.Values["Fecha_Pago_Confirmada"]);
        // Guarda los datos del registro en memoria
        
    }
    protected void fvCom_Planilla_Pago_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.NewValues["Fecha_Pago"] = DateTime.Parse((string)e.NewValues["Fecha_Pago"]);
        e.OldValues["Fecha_Pago"] = DateTime.Parse((string)e.OldValues["Fecha_Pago"]);
        e.NewValues["Valor_Cta_X_Cobrar"] = Decimal.Parse((string)e.NewValues["Valor_Cta_X_Cobrar"]);
        e.OldValues["Valor_Cta_X_Cobrar"] = Decimal.Parse((string)e.OldValues["Valor_Cta_X_Cobrar"]);
        e.NewValues["Fecha_Pago_Confirmada"] = DateTime.Parse((string)e.NewValues["Fecha_Pago_Confirmada"]);
        e.OldValues["Fecha_Pago_Confirmada"] = DateTime.Parse((string)e.OldValues["Fecha_Pago_Confirmada"]);
        // Guarda los datos del registro en memoria
        
    }
    protected void fvCom_Planilla_Pago_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Pago"] = DateTime.Parse((string)e.Values["Fecha_Pago"]);
        e.Values["Valor_Cta_X_Cobrar"] = Decimal.Parse((string)e.Values["Valor_Cta_X_Cobrar"]);
        e.Values["Fecha_Pago_Confirmada"] = DateTime.Parse((string)e.Values["Fecha_Pago_Confirmada"]);
        // Guarda los datos del registro en memoria
        
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Planilla_Pago_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Planilla_Pago.CurrentMode)
        {
            case FormViewMode.Insert:
                //((TextBox)fvPla_Poa.FindControl("CodigoTextBox")).Text = "1";
                //((TextBox)fvPla_Poa.FindControl("EstadoTextBox")).Text = "PEN";
                // Pongo el Id del padre en la lista hija
                if (Gv_Fis_Planilla_Periodo.SelectedIndex != -1)
                {
                    string Planilla_Id = (string) Gv_Fis_Planilla_Periodo.SelectedValue;
                    ((TextBox)fvCom_Planilla_Pago.FindControl("Fis_Planilla_IdTextBox")).Text = Planilla_Id;
                }
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvCom_Planilla_Pago_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Planilla_Pago.Rows.Count == 0)
            fvCom_Planilla_Pago.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Planilla_Pago_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            
            lbFvMsgErrorCom_Planilla_Pago.Text = "Error.";
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Insertado. " ;
            AsignarMensaje("Registro Insertado. " , bien);
        }
    }
    protected void odsfvCom_Planilla_Pago_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            
            lbFvMsgErrorCom_Planilla_Pago.Text = "Error.";
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Actualizado. " ;
            AsignarMensaje("Registro Actualizado. " , bien);
        }
    }
    protected void odsfvCom_Planilla_Pago_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
           
            lbFvMsgErrorCom_Planilla_Pago.Text = "Error.";
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Borrado. " ;
            AsignarMensaje("Registro Borrado. " , bien);
        }
    }
    #endregion

    #region Eventos del GridView de Com_Planilla_Deposito
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Planilla_Deposito_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Planilla_Deposito.CurrentMode != FormViewMode.ReadOnly)
            fvCom_Planilla_Deposito.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Planilla_Deposito.Text = ":";
        lbFvMsgInfoCom_Planilla_Deposito.Text = "> Com_Planilla_Deposito Seleccionado";
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Planilla_Deposito(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Planilla_Deposito.DataSourceObject;
            List<Com_Planilla_Deposito> lista = (List<Com_Planilla_Deposito>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Planilla_Deposito.PageSize;
                noFila = pos - noPagina * gvCom_Planilla_Deposito.PageSize;
            }
        }
        gvCom_Planilla_Deposito.PageIndex = noPagina;
        gvCom_Planilla_Deposito.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Com_Planilla_Deposito
    #region Eventos el FormView de Com_Planilla_Deposito
    protected void fvCom_Planilla_Deposito_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorCom_Planilla_Deposito.Text == ":") lbFvMsgErrorCom_Planilla_Deposito.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Planilla_Deposito(gvCom_Planilla_Deposito, tbFiltroId.Text);
            gvCom_Planilla_Deposito.DataBind();
        }
    }
    protected void fvCom_Planilla_Deposito_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorCom_Planilla_Deposito.Text == ":") lbFvMsgErrorCom_Planilla_Deposito.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Planilla_Deposito_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorCom_Planilla_Deposito.Text == ":") lbFvMsgErrorCom_Planilla_Deposito.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Planilla_Deposito(gvCom_Planilla_Deposito, tbFiltroId.Text);
            gvCom_Planilla_Deposito.DataBind();
        }
    }
    protected void fvCom_Planilla_Deposito_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Deposito"] = DateTime.Parse((string)e.Values["Fecha_Deposito"]);
        e.Values["Valor"] = Decimal.Parse((string)e.Values["Valor"]);
        e.Values["Valor_Interes"] = Decimal.Parse((string)e.Values["Valor_Interes"]);
        
    }
    protected void fvCom_Planilla_Deposito_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.NewValues["Fecha_Deposito"] = DateTime.Parse((string)e.NewValues["Fecha_Deposito"]);
        e.OldValues["Fecha_Deposito"] = DateTime.Parse((string)e.OldValues["Fecha_Deposito"]);
        e.NewValues["Valor"] = Decimal.Parse((string)e.NewValues["Valor"]);
        e.OldValues["Valor"] = Decimal.Parse((string)e.OldValues["Valor"]);
        e.NewValues["Valor_Interes"] = Decimal.Parse((string)e.NewValues["Valor_Interes"]);
        e.OldValues["Valor_Interes"] = Decimal.Parse((string)e.OldValues["Valor_Interes"]);
        
    }
    protected void fvCom_Planilla_Deposito_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Deposito"] = DateTime.Parse((string)e.Values["Fecha_Deposito"]);
        e.Values["Valor"] = Decimal.Parse((string)e.Values["Valor"]);
        e.Values["Valor_Interes"] = Decimal.Parse((string)e.Values["Valor_Interes"]);
        
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Planilla_Deposito_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Planilla_Deposito.CurrentMode)
        {
            case FormViewMode.Insert:
                //((TextBox)fvPla_Poa.FindControl("CodigoTextBox")).Text = "1";
                //((TextBox)fvPla_Poa.FindControl("EstadoTextBox")).Text = "PEN";
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvCom_Planilla_Deposito_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Planilla_Deposito.Rows.Count == 0)
            fvCom_Planilla_Deposito.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Planilla_Deposito_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = "Error";
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Insertado. ";
            AsignarMensaje("Registro Insertado. " , bien);
        }
    }
    protected void odsfvCom_Planilla_Deposito_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = "Error";
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Actualizado. " ;
            AsignarMensaje("Registro Actualizado. " , bien);
        }
    }
    protected void odsfvCom_Planilla_Deposito_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = "Error";
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Borrado. " ;
            AsignarMensaje("Registro Borrado. " , bien);
        }
    }
    #endregion
}
