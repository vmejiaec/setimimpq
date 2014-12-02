using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class COM_Com_Contrato_Legal_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Contrato_Legal_GvFv"; }
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
                gvCom_Contrato_Legal.DataSourceID = odsgvCom_Contrato_Legal.ID;
                break;
			}
        gvCom_Contrato_Legal.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Contrato_Legal.Text = ":";
        lbFvMsgInfoCom_Contrato_Legal.Text = "> Filtrado";
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

	#region Eventos del GridView de Com_Contrato_Legal
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Contrato_Legal_SelectedIndexChanged(object sender, EventArgs e)
    {
		// Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Contrato_Legal.CurrentMode != FormViewMode.ReadOnly)
                fvCom_Contrato_Legal.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Contrato_Legal.Text = ":";
        lbFvMsgInfoCom_Contrato_Legal.Text = "> Com_Contrato_Legal Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Contrato_Legal(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Contrato_Legal.DataSourceObject;
            List<Com_Contrato_Legal> lista = (List<Com_Contrato_Legal>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Contrato_Legal.PageSize;
                noFila = pos - noPagina * gvCom_Contrato_Legal.PageSize;
            }
        }
        gvCom_Contrato_Legal.PageIndex = noPagina;
        gvCom_Contrato_Legal.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Com_Contrato_Legal
    #region Eventos el FormView de Com_Contrato_Legal
    protected void fvCom_Contrato_Legal_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorCom_Contrato_Legal.Text == ":") lbFvMsgErrorCom_Contrato_Legal.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Contrato_Legal(gvCom_Contrato_Legal, tbFiltroId.Text);
            gvCom_Contrato_Legal.DataBind();
        }
    }
    protected void fvCom_Contrato_Legal_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorCom_Contrato_Legal.Text == ":") lbFvMsgErrorCom_Contrato_Legal.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Contrato_Legal_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorCom_Contrato_Legal.Text == ":") lbFvMsgErrorCom_Contrato_Legal.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Contrato_Legal(gvCom_Contrato_Legal, tbFiltroId.Text);
            gvCom_Contrato_Legal.DataBind();
        }
    }
    protected void fvCom_Contrato_Legal_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
		// Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Firma_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Firma_Contrato"]);
		e.Values["Fecha_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Contrato"]);
		e.Values["Valor_Contrato"] = Decimal.Parse((string)e.Values["Valor_Contrato"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }	
    protected void fvCom_Contrato_Legal_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.NewValues["Fecha_Firma_Contrato"] = DateTime.Parse((string)e.NewValues["Fecha_Firma_Contrato"]);
		e.OldValues["Fecha_Firma_Contrato"] = DateTime.Parse((string)e.OldValues["Fecha_Firma_Contrato"]);			
		e.NewValues["Fecha_Contrato"] = DateTime.Parse((string)e.NewValues["Fecha_Contrato"]);
		e.OldValues["Fecha_Contrato"] = DateTime.Parse((string)e.OldValues["Fecha_Contrato"]);			
		e.NewValues["Valor_Contrato"] = Decimal.Parse((string)e.NewValues["Valor_Contrato"]);
		e.OldValues["Valor_Contrato"] = Decimal.Parse((string)e.OldValues["Valor_Contrato"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Contrato_Legal_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		e.Values["Fecha_Firma_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Firma_Contrato"]);
		e.Values["Fecha_Contrato"] = DateTime.Parse((string)e.Values["Fecha_Contrato"]);
		e.Values["Valor_Contrato"] = Decimal.Parse((string)e.Values["Valor_Contrato"]);
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Contrato_Legal_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Contrato_Legal.CurrentMode)
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
    protected void fvCom_Contrato_Legal_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Contrato_Legal.Rows.Count == 0)
            fvCom_Contrato_Legal.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Contrato_Legal_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Legal.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Contrato_Legal.Text = "Com_Contrato_Legal Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Legal_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Legal.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Legal.Text = "Com_Contrato_Legal Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Legal_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Legal.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Legal.Text = "Com_Contrato_Legal Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
