using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Tarea_GvFv : PaginaBase
{
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Referencias a los objetos de pantalla
    #region Referencias a los objetos de pantalla
    protected override string Contenedor
    {
        get { return "PLA_Pla_Tarea_GvFv"; }
    }
    #endregion

    // Controles para el Filtrar
    #region Controles para el Filtrar
    protected void Filtrar()
    {
        string campo = ddlFiltro.SelectedValue;
        string filtro = tbFiltro.Text;
        switch (campo)
        {
            case "Todos":
                gvPla_Tarea.DataSourceID = odsgvPla_Tarea_GetByAnio.ID;
                break;
			case "Nombre":
                gvPla_Tarea.DataSourceID = "odsgvPla_Tarea_GetByAnioLikeNombre";
                break;
            case "Cuenta":
                gvPla_Tarea.DataSourceID = "odsgvPla_Tarea_GetByAnioLikePla_Cta_Codigo";
                break;
			}
        gvPla_Tarea.DataBind();
        gvPla_Tarea.SelectedIndex = 0;
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorTarea.Text = ":";
        lbFvMsgInfoTarea.Text = ">Filtrado";
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

    // Eventos para despues de FormView
    #region Eventos para despues de FormView
    protected void fvPla_Tarea_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGV(gvPla_Tarea, tbFiltroId.Text);
            gvPla_Tarea.DataBind();
        }
    }
    protected void fvPla_Tarea_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Tarea_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            SeleccionarFilaEnGV(gvPla_Tarea, tbFiltroId.Text);
            gvPla_Tarea.DataBind();
        }
    }
    #endregion
    // Eventos para despues del ObjectDataSource del FormView
    #region Eventos para despues del ObjectDataSource del FormView
    protected void odsfvPla_Tarea_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorTarea.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoTarea.Text = "Tarea Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Tarea_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorTarea.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoTarea.Text = "Tarea Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Tarea_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorTarea.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoTarea.Text = "Tarea Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    #endregion

    // WebServices para autocompletar campos del FormView de Tareas
    #region WebServices para autocompletar
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Cta_GetByAnioLikeCodigo_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Cta adp = new BO_Pla_Cta();
        var lista = adp.GetByAnioLikeCodigo(s, contextKey, prefixText);
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Codigo, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre + "||" + fila.Nivel  // 0 1 2 3
                    ));
        return items.ToArray();
    }
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Cta_GetByAnioLikeNombre_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Cta adp = new BO_Pla_Cta();
        var lista = adp.GetByAnioLikeNombre(s, contextKey, prefixText);
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Nombre, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre + "||" + fila.Nivel  // 0 1 2 3
                    ));
        return items.ToArray();
    }
    #endregion WebServices para autocompletar

    // Valores por defecto antes de enviar a insertar, actualizar o borrar.
    #region Valores por defecto
    protected void fvPla_Tarea_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id, Estado y Código
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
        e.Values ["Codigo"] = "0";
        // Cambio del formato de las fechas
        e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
        e.Values["Fecha_Fin"] = DateTime.Parse((string)e.Values["Fecha_Fin"]);
        // Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Cuenta: " + (string)e.Values["Pla_Cta_Codigo"] + " * " +
                                     "Nombre: " + (string)e.Values["Nombre"];
    }
    protected void fvPla_Tarea_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de las fechas
        e.NewValues["Fecha_Ini"] = DateTime.Parse((string)e.NewValues["Fecha_Ini"]);
        e.NewValues["Fecha_Fin"] = DateTime.Parse((string)e.NewValues["Fecha_Fin"]);
        e.OldValues["Fecha_Ini"] = DateTime.Parse((string)e.OldValues["Fecha_Ini"]);
        e.OldValues["Fecha_Fin"] = DateTime.Parse((string)e.OldValues["Fecha_Fin"]);
        // Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Cuenta: " + (string)e.NewValues["Pla_Cta_Codigo"] + " * " +
                                     "Nombre: " + (string)e.NewValues["Nombre"];
    }
    protected void fvPla_Tarea_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de las fechas
        e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
        e.Values["Fecha_Fin"] = DateTime.Parse((string)e.Values["Fecha_Fin"]);
        // Guarda los datos del registro a borrar en memoria
        this.MemoriaRegistroActual = "Codigo: " + (string)e.Values["Codigo"] + " * "+
                                     "Nombre: " + (string)e.Values["Nombre"];
    }
    #endregion

    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Tarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgErrorTarea.Text = ":";
        lbFvMsgInfoTarea.Text = "> Tarea Seleccionado";
        //fvPla_Tarea.ChangeMode(FormViewMode.ReadOnly);
    }
	// Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Tarea_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Tarea.Rows.Count == 0)
            fvPla_Tarea.ChangeMode(FormViewMode.Insert);
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGV(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gv.DataSourceObject;
            List<Pla_Tarea> lista = (List<Pla_Tarea>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gv.PageSize;
                noFila = pos - noPagina * gv.PageSize;
            }
        }
        gv.PageIndex = noPagina;
        gv.SelectedIndex = noFila;
    }

    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Tarea_PreRender(object sender, EventArgs e)
    {
        FormView fvSender = (FormView) sender;
        AjaxControlToolkit.AutoCompleteExtender acxPla_Cta_CodigoTextBox = new AjaxControlToolkit.AutoCompleteExtender();
        AjaxControlToolkit.AutoCompleteExtender acxPla_Cta_NombreTextBox = new AjaxControlToolkit.AutoCompleteExtender();
        switch (fvPla_Tarea.CurrentMode)
        {
            case FormViewMode.Insert:
                // Inicializa el campo código
                TextBox tbCodigo = (TextBox)fvSender.FindControl("CodigoTextBox");
                tbCodigo.Text = "0";
                // Inicializa las fechas con la fecha de hoy
                TextBox tbFecha_Ini = (TextBox)fvSender.FindControl("Fecha_IniTextBox");
                TextBox tbFecha_Fin = (TextBox)fvSender.FindControl("Fecha_FinTextBox");
                tbFecha_Ini.Text = DateTime.Today.ToShortDateString();
                tbFecha_Fin.Text = tbFecha_Ini.Text;
                // Pone el año en el autocompletar
                acxPla_Cta_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl("acxPla_Cta_CodigoTextBox");
                acxPla_Cta_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
                acxPla_Cta_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl("acxPla_Cta_NombreTextBox");
                acxPla_Cta_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
                break;
            case FormViewMode.Edit:
                // Pone el año en el autocompletar
                acxPla_Cta_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender) fvSender.FindControl("acxPla_Cta_CodigoTextBox");
                acxPla_Cta_CodigoTextBox.ContextKey = ddlCabecera.SelectedValue;
                acxPla_Cta_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvSender.FindControl("acxPla_Cta_NombreTextBox");
                acxPla_Cta_NombreTextBox.ContextKey = ddlCabecera.SelectedValue;
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }

    // Inicializar controles aumentar a la plantilla
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa el control del año en la cabecera
        odsDominioAnio.DataBind();
        var anios = odsDominioAnio.Select();
        foreach (Dic_Dominio anio in anios)
            ddlCabecera.Items.Add(new ListItem(anio.Nombre));
    }

    // Eventos del Grid View POA
    #region Eventos del GridView POA
    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Poa_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgErrorPOA.Text = ":";
        lbFvMsgInfoPOA.Text = "> POA Seleccionado";
        // Pone el formview en ReadOnly
        if (gvPla_Poa.SelectedIndex != -1)
            fvPla_Poa.ChangeMode(FormViewMode.ReadOnly);
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Poa(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Poa.DataSourceObject;
            List<Pla_Poa> lista = (List<Pla_Poa>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Poa.PageSize;
                noFila = pos - noPagina * gvPla_Poa.PageSize;
            }
        }
        gvPla_Poa.PageIndex = noPagina;
        gvPla_Poa.SelectedIndex = noFila;
    }
    #endregion

    // Eventos para el FormView POA
    #region Eventos el FormView POA
    protected void fvPla_Poa_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorPOA.Text == ":") lbFvMsgErrorPOA.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId_Poa.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Poa(gvPla_Poa, tbFiltroId_Poa.Text);
            gvPla_Poa.DataBind();
        }
    }
    protected void fvPla_Poa_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorPOA.Text == ":") lbFvMsgErrorPOA.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
            SeleccionarFilaEnGV(gvPla_Tarea, (string) e.Values["Pla_Tarea_Id"]) ;
        }
    }
    protected void fvPla_Poa_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorPOA.Text == ":") lbFvMsgErrorPOA.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Poa(gvPla_Poa, tbFiltroId_Poa.Text);
            gvPla_Poa.DataBind();
        }
    }
    protected void fvPla_Poa_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos de fechas y números
        e.Values["Valor_Inicial"] = Decimal.Parse((string)e.Values["Valor_Inicial"]);
        e.Values["Valor_Suma"] = Decimal.Parse((string)e.Values["Valor_Suma"]);
        // Coloca el Id de la tarea del formview Cabecera
        e.Values["Pla_Tarea_Id"] = (int)fvPla_Tarea.SelectedValue;
    }
    protected void fvPla_Poa_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de los valores
        e.NewValues["Valor_Inicial"] = Decimal.Parse((string)e.NewValues["Valor_Inicial"]);
        e.OldValues["Valor_Inicial"] = Decimal.Parse((string)e.OldValues["Valor_Inicial"]);

        e.NewValues["Valor_Suma"] = Decimal.Parse((string)e.NewValues["Valor_Suma"]);
        e.OldValues["Valor_Suma"] = Decimal.Parse((string)e.OldValues["Valor_Suma"]);
    }
    protected void fvPla_Poa_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Control de valores antes del borrado como fechas y números
        e.Values["Valor_Inicial"] = "0";
        e.Values["Valor_Suma"] = "0";
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Poa_PreRender(object sender, EventArgs e)
    {
        switch (fvPla_Poa.CurrentMode)
        {
            case FormViewMode.Insert:
                ((TextBox)fvPla_Poa.FindControl("CodigoTextBox")).Text = "1";
                ((TextBox)fvPla_Poa.FindControl("EstadoTextBox")).Text = "PEN";
                ((TextBox)fvPla_Poa.FindControl("Valor_SumaTextBox")).Text = "0,00";
                ((TextBox)fvPla_Poa.FindControl("Valor_InicialTextBox")).Text = "0,00";
                if (fvPla_Tarea.SelectedValue != null)
                    ((TextBox)fvPla_Poa.FindControl("Pla_Tarea_IdTextBox")).Text = (fvPla_Tarea.SelectedValue).ToString();
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Poa_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Poa.Rows.Count == 0)
            fvPla_Poa.ChangeMode(FormViewMode.Insert);
    }
    #endregion

    // Eventos para el ObjectDataSource POA
    #region Eventos para el ObjectDataSource POA
    protected void odsfvPla_Poa_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPOA.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId_Poa.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPOA.Text = "Registro POA Insertado.";
            AsignarMensaje("Registro Insertado.", bien);
        }
    }
    protected void odsfvPla_Poa_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPOA.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPOA.Text = "Registro POA Actualizado.";
            AsignarMensaje("Registro Actualizado.", bien);
        }
    }
    protected void odsfvPla_Poa_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPOA.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPOA.Text = "Registro POA Borrado.";
            AsignarMensaje("Registro Borrado.", bien);
        }
    }
    #endregion

    // WebServices para autocompletar campos del FormView de POA
    #region WebServices para autocompletar
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Partida_GetByLikeCodigo_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Partida adp = new BO_Pla_Partida();
        var lista = adp.GetByLikeCodigo(s, prefixText);
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Codigo, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre + "||" // 0 1 2
                    ));
        return items.ToArray();
    }
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Partida_GetByLikeNombre_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Partida adp = new BO_Pla_Partida();
        var lista = adp.GetByLikeNombre(s, prefixText);
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Nombre, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre + "||" // 0 1 2
                    ));
        return items.ToArray();
    }
    #endregion WebServices para autocompletar

    // Evantos para el ObjectDataSource del arbol de Cuentas
    protected void odsPla_Cta_Arbol_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        var o = e.InputParameters;
        o["p_Pla_Cta_Codigo"] = gvPla_Tarea.SelectedRow.Cells[3].Text; //"2.1.1.1.";                
    }
}
    