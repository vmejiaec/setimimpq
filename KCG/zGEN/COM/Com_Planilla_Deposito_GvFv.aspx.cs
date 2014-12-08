using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class COM_Com_Planilla_Deposito_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Planilla_Deposito_GvFv"; }
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
                gvCom_Planilla_Deposito.DataSourceID = odsgvCom_Planilla_Deposito.ID;
                break;
			}
        gvCom_Planilla_Deposito.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Planilla_Deposito.Text = ":";
        lbFvMsgInfoCom_Planilla_Deposito.Text = "> Filtrado";
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
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
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
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Planilla_Deposito_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Deposito"] = DateTime.Parse((string)e.Values["Fecha_Deposito"]);
		e.Values["Valor"] = Decimal.Parse((string)e.Values["Valor"]);
		e.Values["Valor_Interes"] = Decimal.Parse((string)e.Values["Valor_Interes"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
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
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Planilla_Deposito_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Planilla_Deposito_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Planilla_Deposito.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Planilla_Deposito.Text = "Com_Planilla_Deposito Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
