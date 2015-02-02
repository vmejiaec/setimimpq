using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Lote_Tipo_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Pla_Lote_Tipo_GvFv"; }
    }
	// Inicializar controles al arranque de la página
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa el control 
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
                gvPla_Lote_Tipo.DataSourceID = odsgvPla_Lote_Tipo.ID;
                break;
			}
        gvPla_Lote_Tipo.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorPla_Lote_Tipo.Text = ":";
        lbFvMsgInfoPla_Lote_Tipo.Text = "> Filtrado";
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

	#region Eventos del GridView de Pla_Lote_Tipo
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvPla_Lote_Tipo_SelectedIndexChanged(object sender, EventArgs e)
    {
		// Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvPla_Lote_Tipo.CurrentMode != FormViewMode.ReadOnly)
                fvPla_Lote_Tipo.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorPla_Lote_Tipo.Text = ":";
        lbFvMsgInfoPla_Lote_Tipo.Text = "> Pla_Lote_Tipo Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Lote_Tipo(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Lote_Tipo.DataSourceObject;
            List<Pla_Lote_Tipo> lista = (List<Pla_Lote_Tipo>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Lote_Tipo.PageSize;
                noFila = pos - noPagina * gvPla_Lote_Tipo.PageSize;
            }
        }
        gvPla_Lote_Tipo.PageIndex = noPagina;
        gvPla_Lote_Tipo.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Pla_Lote_Tipo
    #region Eventos el FormView de Pla_Lote_Tipo
    protected void fvPla_Lote_Tipo_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorPla_Lote_Tipo.Text == ":") lbFvMsgErrorPla_Lote_Tipo.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Lote_Tipo(gvPla_Lote_Tipo, tbFiltroId.Text);
            gvPla_Lote_Tipo.DataBind();
        }
    }
    protected void fvPla_Lote_Tipo_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorPla_Lote_Tipo.Text == ":") lbFvMsgErrorPla_Lote_Tipo.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Lote_Tipo_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorPla_Lote_Tipo.Text == ":") lbFvMsgErrorPla_Lote_Tipo.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Lote_Tipo(gvPla_Lote_Tipo, tbFiltroId.Text);
            gvPla_Lote_Tipo.DataBind();
        }
    }
    protected void fvPla_Lote_Tipo_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
		// Cambio del formato de los campos que empiezan con Valor y Fecha
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }	
    protected void fvPla_Lote_Tipo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvPla_Lote_Tipo_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Lote_Tipo_PreRender(object sender, EventArgs e)
    {
        switch (fvPla_Lote_Tipo.CurrentMode)
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
    protected void fvPla_Lote_Tipo_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Lote_Tipo.Rows.Count == 0)
            fvPla_Lote_Tipo.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvPla_Lote_Tipo_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPla_Lote_Tipo.Text = "Pla_Lote_Tipo Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Lote_Tipo_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Lote_Tipo.Text = "Pla_Lote_Tipo Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Lote_Tipo_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Lote_Tipo.Text = "Pla_Lote_Tipo Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion

    #region Eventos del GridView de Pla_Lote
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvPla_Lote_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvPla_Lote.CurrentMode != FormViewMode.ReadOnly)
            fvPla_Lote.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorPla_Lote.Text = ":";
        lbFvMsgInfoPla_Lote.Text = "> Pla_Lote Seleccionado";
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Lote(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Lote.DataSourceObject;
            List<Pla_Lote> lista = (List<Pla_Lote>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Lote.PageSize;
                noFila = pos - noPagina * gvPla_Lote.PageSize;
            }
        }
        gvPla_Lote.PageIndex = noPagina;
        gvPla_Lote.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Pla_Lote
    #region Eventos el FormView de Pla_Lote
    protected void fvPla_Lote_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorPla_Lote.Text == ":") lbFvMsgErrorPla_Lote.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Lote(gvPla_Lote, tbFiltroId.Text);
            gvPla_Lote.DataBind();
        }
    }
    protected void fvPla_Lote_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorPla_Lote.Text == ":") lbFvMsgErrorPla_Lote.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Lote_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorPla_Lote.Text == ":") lbFvMsgErrorPla_Lote.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Lote(gvPla_Lote, tbFiltroId.Text);
            gvPla_Lote.DataBind();
        }
    }
    protected void fvPla_Lote_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    protected void fvPla_Lote_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]);
    }
    protected void fvPla_Lote_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
        // Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format("Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]);
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Lote_PreRender(object sender, EventArgs e)
    {
        switch (fvPla_Lote.CurrentMode)
        {
            case FormViewMode.Insert:
                // Asigna el Id del padre
                if (gvPla_Lote_Tipo.SelectedValue == null) return;
                string sLote_Tipo_Id =  gvPla_Lote_Tipo.SelectedValue.ToString();
                ((TextBox)fvPla_Lote.FindControl("Pla_Lote_Tipo_IdTextBox")).Text = sLote_Tipo_Id;
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Lote_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Lote.Rows.Count == 0)
            fvPla_Lote.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvPla_Lote_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPla_Lote.Text = "Pla_Lote Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Lote_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Lote.Text = "Pla_Lote Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Lote_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Lote.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Lote.Text = "Pla_Lote Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    #endregion
	
	// -----------------------------------------------------------------------------------------------------------------------



}
