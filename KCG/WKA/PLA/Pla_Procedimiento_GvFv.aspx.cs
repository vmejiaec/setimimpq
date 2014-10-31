using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Procedimiento_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Pla_Procedimiento_GvFv"; }
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
                gvPla_Procedimiento.DataSourceID = odsgvPla_Procedimiento.ID;
                break;
			case "Nombre":
                gvPla_Procedimiento.DataSourceID = odsgvPla_Procedimiento_GetByLikeNombre.ID;
                break;
			}
        gvPla_Procedimiento.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorPla_Procedimiento.Text = ":";
        lbFvMsgInfoPla_Procedimiento.Text = "> Filtrado";
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

	#region Eventos del GridView de Pla_Procedimiento
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvPla_Procedimiento_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgErrorPla_Procedimiento.Text = ":";
        lbFvMsgInfoPla_Procedimiento.Text = "> Pla_Procedimiento Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Procedimiento(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Procedimiento.DataSourceObject;
            List<Pla_Procedimiento> lista = (List<Pla_Procedimiento>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Procedimiento.PageSize;
                noFila = pos - noPagina * gvPla_Procedimiento.PageSize;
            }
        }
        gvPla_Procedimiento.PageIndex = noPagina;
        gvPla_Procedimiento.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Pla_Procedimiento
    #region Eventos el FormView de Pla_Procedimiento
    protected void fvPla_Procedimiento_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorPla_Procedimiento.Text == ":") lbFvMsgErrorPla_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Procedimiento(gvPla_Procedimiento, tbFiltroId.Text);
            gvPla_Procedimiento.DataBind();
        }
    }
    protected void fvPla_Procedimiento_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorPla_Procedimiento.Text == ":") lbFvMsgErrorPla_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Procedimiento_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorPla_Procedimiento.Text == ":") lbFvMsgErrorPla_Procedimiento.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Procedimiento(gvPla_Procedimiento, tbFiltroId.Text);
            gvPla_Procedimiento.DataBind();
        }
    }
    protected void fvPla_Procedimiento_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
		// Cambio del formato de los campos de fechas
		// e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
									 "Codigo: " + (string)e.Values["Codigo"] ;
    }	
    protected void fvPla_Procedimiento_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de las fechas
        // e.NewValues["Fecha_Ini"] = DateTime.Parse((string)e.NewValues["Fecha_Ini"]);
        // e.OldValues["Fecha_Ini"] = DateTime.Parse((string)e.OldValues["Fecha_Ini"]);
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.NewValues["Id"] + " * " +
									 "Codigo: " + (string)e.NewValues["Codigo"] ;
    }
    protected void fvPla_Procedimiento_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Control de valores antes del borrado como fechas y números
        // e.Values["Valor_Inicial"] = "0";
        //e.Values["Valor_Suma"] = "0";
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
									 "Codigo: " + (string)e.Values["Codigo"] ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Procedimiento_PreRender(object sender, EventArgs e)
    {
        switch (fvPla_Procedimiento.CurrentMode)
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
    protected void fvPla_Procedimiento_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Procedimiento.Rows.Count == 0)
            fvPla_Procedimiento.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvPla_Procedimiento_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPla_Procedimiento.Text = "Pla_Procedimiento Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Procedimiento_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Procedimiento.Text = "Pla_Procedimiento Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Procedimiento_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Procedimiento.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Procedimiento.Text = "Pla_Procedimiento Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
