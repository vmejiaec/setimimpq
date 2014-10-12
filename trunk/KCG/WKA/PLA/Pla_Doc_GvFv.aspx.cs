using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Doc_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Pla_Doc_GvFv"; }
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
                gvPla_Doc.DataSourceID = odsgvPla_Doc.ID;
                break;
			}
        gvPla_Doc.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorPla_Doc.Text = ":";
        lbFvMsgInfoPla_Doc.Text = "> Filtrado";
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

	#region Eventos del GridView de Pla_Doc
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvPla_Doc_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgErrorPla_Doc.Text = ":";
        lbFvMsgInfoPla_Doc.Text = "> Pla_Doc Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Doc(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Doc.DataSourceObject;
            List<Pla_Doc> lista = (List<Pla_Doc>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Doc.PageSize;
                noFila = pos - noPagina * gvPla_Doc.PageSize;
            }
        }
        gvPla_Doc.PageIndex = noPagina;
        gvPla_Doc.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Pla_Doc
    #region Eventos el FormView de Pla_Doc
    protected void fvPla_Doc_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorPla_Doc.Text == ":") lbFvMsgErrorPla_Doc.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Doc(gvPla_Doc, tbFiltroId.Text);
            gvPla_Doc.DataBind();
        }
    }
    protected void fvPla_Doc_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorPla_Doc.Text == ":") lbFvMsgErrorPla_Doc.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Doc_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorPla_Doc.Text == ":") lbFvMsgErrorPla_Doc.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Doc(gvPla_Doc, tbFiltroId.Text);
            gvPla_Doc.DataBind();
        }
    }
    protected void fvPla_Doc_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
		// Cambio del formato de los campos de fechas
		// e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
									 "Codigo: " + (string)e.Values["Codigo"] + " * " +
                                     "Nombre: " + (string)e.Values["Nombre"];
    }	
    protected void fvPla_Doc_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de las fechas
        // e.NewValues["Fecha_Ini"] = DateTime.Parse((string)e.NewValues["Fecha_Ini"]);
        // e.OldValues["Fecha_Ini"] = DateTime.Parse((string)e.OldValues["Fecha_Ini"]);
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
									 "Codigo: " + (string)e.Values["Codigo"] + " * " +
                                     "Nombre: " + (string)e.Values["Nombre"];
    }
    protected void fvPla_Doc_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Control de valores antes del borrado como fechas y números
        // e.Values["Valor_Inicial"] = "0";
        //e.Values["Valor_Suma"] = "0";
		
		// Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
									 "Codigo: " + (string)e.Values["Codigo"] + " * " +
                                     "Nombre: " + (string)e.Values["Nombre"];
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Doc_PreRender(object sender, EventArgs e)
    {
        switch (fvPla_Doc.CurrentMode)
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
    protected void fvPla_Doc_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Doc.Rows.Count == 0)
            fvPla_Doc.ChangeMode(FormViewMode.Insert);
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvPla_Doc_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Doc.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPla_Doc.Text = Pla_Doc + " Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Doc_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Doc.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Doc.Text = Pla_Doc + " Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Doc_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Doc.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Doc.Text = Pla_Doc + " Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



}
