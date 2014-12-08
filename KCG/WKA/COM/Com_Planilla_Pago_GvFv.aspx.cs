using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class COM_Com_Planilla_Pago_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Planilla_Pago_GvFv"; }
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
                gvCom_Planilla_Pago.DataSourceID = odsgvCom_Planilla_Pago.ID;
                break;
			}
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
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
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
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Planilla_Pago_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Pago"] = DateTime.Parse((string)e.Values["Fecha_Pago"]);
		e.Values["Valor_Cta_X_Cobrar"] = Decimal.Parse((string)e.Values["Valor_Cta_X_Cobrar"]);
		e.Values["Fecha_Pago_Confirmada"] = DateTime.Parse((string)e.Values["Fecha_Pago_Confirmada"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Planilla_Pago_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Planilla_Pago.CurrentMode)
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
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Pago.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Planilla_Pago_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Pago.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Planilla_Pago_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Pago.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Pago.Text = "Com_Planilla_Pago Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
