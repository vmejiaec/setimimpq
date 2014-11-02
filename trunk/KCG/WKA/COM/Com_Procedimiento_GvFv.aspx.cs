using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class COM_Com_Procedimiento_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Procedimiento_GvFv"; }
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
                gvCom_Procedimiento.DataSourceID = odsgvCom_Procedimiento.ID;
                break;
			case "Nombre":
                gvCom_Procedimiento.DataSourceID = odsgvCom_Procedimiento_GetByLikeNombre.ID;
                break;
			case "Valor":
                gvCom_Procedimiento.DataSourceID = odsgvCom_Procedimiento_GetByLikeValor.ID;
                break;
			}
        gvCom_Procedimiento.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Procedimiento.Text = ":";
        lbFvMsgInfoCom_Procedimiento.Text = "> Filtrado";
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

	#region Eventos del GridView de Com_Procedimiento
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Procedimiento_SelectedIndexChanged(object sender, EventArgs e)
    {
		// Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Procedimiento.CurrentMode != FormViewMode.ReadOnly)
                fvCom_Procedimiento.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Procedimiento.Text = ":";
        lbFvMsgInfoCom_Procedimiento.Text = "> Com_Procedimiento Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Procedimiento(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Procedimiento.DataSourceObject;
            List<Com_Procedimiento> lista = (List<Com_Procedimiento>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Procedimiento.PageSize;
                noFila = pos - noPagina * gvCom_Procedimiento.PageSize;
            }
        }
        gvCom_Procedimiento.PageIndex = noPagina;
        gvCom_Procedimiento.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Com_Procedimiento
    #region Eventos el FormView de Com_Procedimiento
    protected void fvCom_Procedimiento_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorCom_Procedimiento.Text == ":") lbFvMsgErrorCom_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Procedimiento(gvCom_Procedimiento, tbFiltroId.Text);
            gvCom_Procedimiento.DataBind();
        }
    }
    protected void fvCom_Procedimiento_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorCom_Procedimiento.Text == ":") lbFvMsgErrorCom_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Procedimiento_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorCom_Procedimiento.Text == ":") lbFvMsgErrorCom_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Procedimiento(gvCom_Procedimiento, tbFiltroId.Text);
            gvCom_Procedimiento.DataBind();
        }
    }
    protected void fvCom_Procedimiento_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
		// Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Valor_Min"] = Decimal.Parse((string)e.Values["Valor_Min"]);
		e.Values["Valor_Max"] = Decimal.Parse((string)e.Values["Valor_Max"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }	
    protected void fvCom_Procedimiento_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.NewValues["Valor_Min"] = Decimal.Parse((string)e.NewValues["Valor_Min"]);
		e.OldValues["Valor_Min"] = Decimal.Parse((string)e.OldValues["Valor_Min"]);
		e.NewValues["Valor_Max"] = Decimal.Parse((string)e.NewValues["Valor_Max"]);
		e.OldValues["Valor_Max"] = Decimal.Parse((string)e.OldValues["Valor_Max"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Procedimiento_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Valor_Min"] = Decimal.Parse((string)e.Values["Valor_Min"]);
		e.Values["Valor_Max"] = Decimal.Parse((string)e.Values["Valor_Max"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Procedimiento_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Procedimiento.CurrentMode)
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
    protected void fvCom_Procedimiento_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Procedimiento.Rows.Count == 0)
            fvCom_Procedimiento.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Procedimiento_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Procedimiento.Text = "Com_Procedimiento Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Procedimiento_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Procedimiento.Text = "Com_Procedimiento Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Procedimiento_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Procedimiento.Text = "Com_Procedimiento Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
