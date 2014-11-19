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
                gvCom_Contrato.DataSourceID = odsgvCom_Contrato.ID;
                break;
			case "Pla_Tarea_Nombre":
                gvCom_Contrato.DataSourceID = odsgvCom_Contrato_GetByLikePla_Tarea_Nombre.ID;
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
		e.Values["Fecha_Inicio_Elabora_Pliegos"] = DateTime.Parse((string)e.Values["Fecha_Inicio_Elabora_Pliegos"]);
		e.Values["Fecha_Publicacion_Portal"] = DateTime.Parse((string)e.Values["Fecha_Publicacion_Portal"]);
		e.Values["Fecha_Calificaciones"] = DateTime.Parse((string)e.Values["Fecha_Calificaciones"]);
		e.Values["Fecha_Estimada_Adjudicacion"] = DateTime.Parse((string)e.Values["Fecha_Estimada_Adjudicacion"]);
		e.Values["Fecha_Adjudicacion"] = DateTime.Parse((string)e.Values["Fecha_Adjudicacion"]);
		e.Values["Fecha_Juridico"] = DateTime.Parse((string)e.Values["Fecha_Juridico"]);
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
		e.NewValues["Fecha_Inicio_Elabora_Pliegos"] = DateTime.Parse((string)e.NewValues["Fecha_Inicio_Elabora_Pliegos"]);
		e.OldValues["Fecha_Inicio_Elabora_Pliegos"] = DateTime.Parse((string)e.OldValues["Fecha_Inicio_Elabora_Pliegos"]);			
		e.NewValues["Fecha_Publicacion_Portal"] = DateTime.Parse((string)e.NewValues["Fecha_Publicacion_Portal"]);
		e.OldValues["Fecha_Publicacion_Portal"] = DateTime.Parse((string)e.OldValues["Fecha_Publicacion_Portal"]);			
		e.NewValues["Fecha_Calificaciones"] = DateTime.Parse((string)e.NewValues["Fecha_Calificaciones"]);
		e.OldValues["Fecha_Calificaciones"] = DateTime.Parse((string)e.OldValues["Fecha_Calificaciones"]);			
		e.NewValues["Fecha_Estimada_Adjudicacion"] = DateTime.Parse((string)e.NewValues["Fecha_Estimada_Adjudicacion"]);
		e.OldValues["Fecha_Estimada_Adjudicacion"] = DateTime.Parse((string)e.OldValues["Fecha_Estimada_Adjudicacion"]);			
		e.NewValues["Fecha_Adjudicacion"] = DateTime.Parse((string)e.NewValues["Fecha_Adjudicacion"]);
		e.OldValues["Fecha_Adjudicacion"] = DateTime.Parse((string)e.OldValues["Fecha_Adjudicacion"]);			
		e.NewValues["Fecha_Juridico"] = DateTime.Parse((string)e.NewValues["Fecha_Juridico"]);
		e.OldValues["Fecha_Juridico"] = DateTime.Parse((string)e.OldValues["Fecha_Juridico"]);			
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
		e.Values["Fecha_Inicio_Elabora_Pliegos"] = DateTime.Parse((string)e.Values["Fecha_Inicio_Elabora_Pliegos"]);
		e.Values["Fecha_Publicacion_Portal"] = DateTime.Parse((string)e.Values["Fecha_Publicacion_Portal"]);
		e.Values["Fecha_Calificaciones"] = DateTime.Parse((string)e.Values["Fecha_Calificaciones"]);
		e.Values["Fecha_Estimada_Adjudicacion"] = DateTime.Parse((string)e.Values["Fecha_Estimada_Adjudicacion"]);
		e.Values["Fecha_Adjudicacion"] = DateTime.Parse((string)e.Values["Fecha_Adjudicacion"]);
		e.Values["Fecha_Juridico"] = DateTime.Parse((string)e.Values["Fecha_Juridico"]);
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
        if (gvCom_Contrato.Rows.Count == 0)
            fvCom_Contrato.ChangeMode(FormViewMode.Insert);
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



}
