using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class COM_Com_Contrato_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Contrato_GvFv"; }
    }
	// Inicializar controles al arranque de la página
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa los filtros de las fechas desde y hasta
        if (!IsPostBack)
        {
            var hoy = DateTime.Today;
            var mes = hoy.Month;
            var anio = hoy.Year;
            var primeroDelMes = new DateTime(anio, mes, 1);
            tbFechaIni.Text = primeroDelMes.ToShortDateString();
            tbFechaFin.Text = hoy.ToShortDateString();
        }
    }
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    // Controles para el Filtrar
    #region Controles para el Filtrar
    protected void Filtrar()
    {
        string campo = ddlFiltro.SelectedValue;
        string filtro = tbFiltro.Text;
        switch (campo)
        {
            case "Todos":
                gvCom_Contrato.DataSourceID = odsgvCom_Contrato_GetByRangoFecha_Crea.ID;
                break;
			case "Pla_Tarea_Nombre":
                gvCom_Contrato.DataSourceID = odsgvCom_Contrato_GetByLikePla_Tarea_Nombre.ID;
                break;
            case "Codigo_Sercop":
                gvCom_Contrato.DataSourceID = odsgvCom_Contrato_GetByCodigo_Sercop.ID;
                break;
		}
        gvCom_Contrato.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Contrato.Text = ":";
        lbFvMsgInfoCom_Contrato.Text = "> Filtrado";
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

	#region Eventos del GridView de Com_Contrato
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Contrato_SelectedIndexChanged(object sender, EventArgs e)
    {
		// Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Contrato.CurrentMode != FormViewMode.ReadOnly)
                fvCom_Contrato.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Contrato.Text = ":";
        lbFvMsgInfoCom_Contrato.Text = "> Com_Contrato Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Contrato(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Contrato.DataSourceObject;
            List<Com_Contrato> lista = (List<Com_Contrato>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Contrato.PageSize;
                noFila = pos - noPagina * gvCom_Contrato.PageSize;
            }
        }
        gvCom_Contrato.PageIndex = noPagina;
        gvCom_Contrato.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Com_Contrato
    #region Eventos el FormView de Com_Contrato
    protected void fvCom_Contrato_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorCom_Contrato.Text == ":") lbFvMsgErrorCom_Contrato.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Contrato(gvCom_Contrato, tbFiltroId.Text);
            gvCom_Contrato.DataBind();
        }
    }
    protected void fvCom_Contrato_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorCom_Contrato.Text == ":") lbFvMsgErrorCom_Contrato.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Contrato_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorCom_Contrato.Text == ":") lbFvMsgErrorCom_Contrato.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Contrato(gvCom_Contrato, tbFiltroId.Text);
            gvCom_Contrato.DataBind();
        }
    }
    protected void fvCom_Contrato_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
		// Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Cierre_Rec_Ofertas"] = DateTime.Parse((string)e.Values["Fecha_Cierre_Rec_Ofertas"]);
		e.Values["Valor_Contrato"] = Decimal.Parse((string)e.Values["Valor_Contrato"]);
		e.Values["Fecha_Inicio_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Inicio_Contrato"]);
		e.Values["Fecha_Crea"] = DateTime.Parse((string)e.Values["Fecha_Crea"]);
		e.Values["Valor_Suma_Movs"] = Decimal.Parse((string)e.Values["Valor_Suma_Movs"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }	
    protected void fvCom_Contrato_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.NewValues["Fecha_Cierre_Rec_Ofertas"] = DateTime.Parse((string)e.NewValues["Fecha_Cierre_Rec_Ofertas"]);
		e.OldValues["Fecha_Cierre_Rec_Ofertas"] = DateTime.Parse((string)e.OldValues["Fecha_Cierre_Rec_Ofertas"]);			
		e.NewValues["Valor_Contrato"] = Decimal.Parse((string)e.NewValues["Valor_Contrato"]);
		e.OldValues["Valor_Contrato"] = Decimal.Parse((string)e.OldValues["Valor_Contrato"]);
		e.NewValues["Fecha_Inicio_Contrato"] = DateTime.Parse((string)e.NewValues["Fecha_Inicio_Contrato"]);
		e.OldValues["Fecha_Inicio_Contrato"] = DateTime.Parse((string)e.OldValues["Fecha_Inicio_Contrato"]);			
		e.NewValues["Fecha_Crea"] = DateTime.Parse((string)e.NewValues["Fecha_Crea"]);
		e.OldValues["Fecha_Crea"] = DateTime.Parse((string)e.OldValues["Fecha_Crea"]);			
		e.NewValues["Valor_Suma_Movs"] = Decimal.Parse((string)e.NewValues["Valor_Suma_Movs"]);
		e.OldValues["Valor_Suma_Movs"] = Decimal.Parse((string)e.OldValues["Valor_Suma_Movs"]);
        e.NewValues["Porcentaje_Anticipo_Ref"] = Decimal.Parse((string)e.NewValues["Porcentaje_Anticipo_Ref"]);
        e.OldValues["Porcentaje_Anticipo_Ref"] = Decimal.Parse((string)e.OldValues["Porcentaje_Anticipo_Ref"]);
        e.NewValues["Porcentaje_Anticipo_Contrato"] = Decimal.Parse((string)e.NewValues["Porcentaje_Anticipo_Contrato"]);
        e.OldValues["Porcentaje_Anticipo_Contrato"] = Decimal.Parse((string)e.OldValues["Porcentaje_Anticipo_Contrato"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Contrato_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Cierre_Rec_Ofertas"] = DateTime.Parse((string)e.Values["Fecha_Cierre_Rec_Ofertas"]);
		e.Values["Valor_Contrato"] = Decimal.Parse((string)e.Values["Valor_Contrato"]);
		e.Values["Fecha_Inicio_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Inicio_Contrato"]);
		e.Values["Fecha_Crea"] = DateTime.Parse((string)e.Values["Fecha_Crea"]);
		e.Values["Valor_Suma_Movs"] = Decimal.Parse((string)e.Values["Valor_Suma_Movs"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Contrato_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Contrato.CurrentMode)
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
    protected void fvCom_Contrato_DataBound(object sender, EventArgs e)
    {
        //if (gvCom_Contrato.Rows.Count == 0)
        //    fvCom_Contrato.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Contrato_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Contrato.Text = "Com_Contrato Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato.Text = "Com_Contrato Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato.Text = "Com_Contrato Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	// -----------------------------------------------------------------------------------------------------------------------

    #region Eventos del GridView de Com_Contrato_DocTec
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Contrato_DocTec_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Contrato_DocTec.CurrentMode != FormViewMode.ReadOnly)
            fvCom_Contrato_DocTec.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Contrato_DocTec.Text = ":";
        lbFvMsgInfoCom_Contrato_DocTec.Text = "> Com_Contrato_DocTec Seleccionado";
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Contrato_DocTec(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Contrato_DocTec.DataSourceObject;
            List<Com_Contrato_DocTec> lista = (List<Com_Contrato_DocTec>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Contrato_DocTec.PageSize;
                noFila = pos - noPagina * gvCom_Contrato_DocTec.PageSize;
            }
        }
        gvCom_Contrato_DocTec.PageIndex = noPagina;
        gvCom_Contrato_DocTec.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Com_Contrato_DocTec
    #region Eventos el FormView de Com_Contrato_DocTec
    protected void fvCom_Contrato_DocTec_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorCom_Contrato_DocTec.Text == ":") lbFvMsgErrorCom_Contrato_DocTec.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Contrato_DocTec(gvCom_Contrato_DocTec, tbFiltroId.Text);
            gvCom_Contrato_DocTec.DataBind();
        }
    }
    protected void fvCom_Contrato_DocTec_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorCom_Contrato_DocTec.Text == ":") lbFvMsgErrorCom_Contrato_DocTec.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Contrato_DocTec_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorCom_Contrato_DocTec.Text == ":") lbFvMsgErrorCom_Contrato_DocTec.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Contrato_DocTec(gvCom_Contrato_DocTec, tbFiltroId.Text);
            gvCom_Contrato_DocTec.DataBind();
        }
    }
    protected void fvCom_Contrato_DocTec_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    protected void fvCom_Contrato_DocTec_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]);
    }
    protected void fvCom_Contrato_DocTec_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Contrato_DocTec_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Contrato_DocTec.CurrentMode)
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
    protected void fvCom_Contrato_DocTec_DataBound(object sender, EventArgs e)
    {
        //if (gvCom_Contrato_DocTec.Rows.Count == 0)
        //    fvCom_Contrato_DocTec.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Contrato_DocTec_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_DocTec.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Contrato_DocTec.Text = "Com_Contrato_DocTec Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_DocTec_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_DocTec.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_DocTec.Text = "Com_Contrato_DocTec Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_DocTec_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_DocTec.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_DocTec.Text = "Com_Contrato_DocTec Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    #endregion

    #region Eventos del GridView de Com_Contrato_Oferente
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Contrato_Oferente_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Contrato_Oferente.CurrentMode != FormViewMode.ReadOnly)
            fvCom_Contrato_Oferente.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Contrato_Oferente.Text = ":";
        lbFvMsgInfoCom_Contrato_Oferente.Text = "> Com_Contrato_Oferente Seleccionado";
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Contrato_Oferente(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Contrato_Oferente.DataSourceObject;
            List<Com_Contrato_Oferente> lista = (List<Com_Contrato_Oferente>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Contrato_Oferente.PageSize;
                noFila = pos - noPagina * gvCom_Contrato_Oferente.PageSize;
            }
        }
        gvCom_Contrato_Oferente.PageIndex = noPagina;
        gvCom_Contrato_Oferente.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Com_Contrato_Oferente
    #region Eventos el FormView de Com_Contrato_Oferente
    protected void fvCom_Contrato_Oferente_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorCom_Contrato_Oferente.Text == ":") lbFvMsgErrorCom_Contrato_Oferente.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Contrato_Oferente(gvCom_Contrato_Oferente, tbFiltroId.Text);
            gvCom_Contrato_Oferente.DataBind();
        }
    }
    protected void fvCom_Contrato_Oferente_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorCom_Contrato_Oferente.Text == ":") lbFvMsgErrorCom_Contrato_Oferente.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Contrato_Oferente_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorCom_Contrato_Oferente.Text == ":") lbFvMsgErrorCom_Contrato_Oferente.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Contrato_Oferente(gvCom_Contrato_Oferente, tbFiltroId.Text);
            gvCom_Contrato_Oferente.DataBind();
        }
    }
    protected void fvCom_Contrato_Oferente_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Recepcion"] = DateTime.Parse((string)e.Values["Fecha_Recepcion"]);
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    protected void fvCom_Contrato_Oferente_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.NewValues["Fecha_Recepcion"] = DateTime.Parse((string)e.NewValues["Fecha_Recepcion"]);
        e.OldValues["Fecha_Recepcion"] = DateTime.Parse((string)e.OldValues["Fecha_Recepcion"]);
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]);
    }
    protected void fvCom_Contrato_Oferente_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        e.Values["Fecha_Recepcion"] = DateTime.Parse((string)e.Values["Fecha_Recepcion"]);
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Contrato_Oferente_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Contrato_Oferente.CurrentMode)
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
    protected void fvCom_Contrato_Oferente_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Contrato_Oferente.Rows.Count == 0)
            fvCom_Contrato_Oferente.ChangeMode(FormViewMode.Insert);
        else
        {
            if (gvCom_Contrato_Oferente.SelectedIndex == -1)
            {
                gvCom_Contrato_Oferente.SelectedIndex = 0;
                fvCom_Contrato_Oferente.ChangeMode(FormViewMode.ReadOnly);
            }
        }
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Contrato_Oferente_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Oferente.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Contrato_Oferente.Text = "Com_Contrato_Oferente Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Oferente_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Oferente.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Oferente.Text = "Com_Contrato_Oferente Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Oferente_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Oferente.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Oferente.Text = "Com_Contrato_Oferente Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    #endregion
}
