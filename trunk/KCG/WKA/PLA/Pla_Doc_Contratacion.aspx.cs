using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Doc_Contratacion : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "Solicitudes Contratación"; }
    }
    // Inicializar controles al arranque de la página
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa los controles
        if (!IsPostBack)
        {
            // Inicializa la lista de areas
            ddlCabeceraArea.Items.Add(new ListItem("Todos"));
            FEL.VAR.BO_V_INT_Area adpArea = new FEL.VAR.BO_V_INT_Area();
            var listaAreas = adpArea.Get(Scope);
            foreach (var area in listaAreas)
            {
                ddlCabeceraArea.Items.Add(new ListItem(area.Nombre, area.Codigo));
            }
            // Poner los valores iniciales al filtro de rango de fechas desde el inicio del mes hasta hoy
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
        // si en la cabecera no está seleccionado ninguna área
        if (ddlCabeceraArea.SelectedValue == "Todos")
        {
            switch (campo)
            {
                case "Todos":
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_RangoFecha_Solicita.ID;
                    break;
                case "Descripcion":
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_RangoFecha_Solicita_LikeDescripcion.ID;
                    break;
                case "Codigo":
                    if (filtro.StartsWith("-20")) tbFiltro.Text = "";
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByCodigo.ID;
                    break;
            }
        }
        else
        {
            switch (campo)
            {
                case "Todos":
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita.ID;
                    break;
                case "Descripcion":
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_LikeDescripcion.ID;
                    break;
                case "Codigo":
                    gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_Codigo.ID;
                    break;
            }
        }
        gvPla_Doc.DataBind();
        // Si hay registros en el grid entonces selecciona el primero y pone la forma en estado read-only
        if (gvPla_Doc.Rows.Count > 0)
        {
            gvPla_Doc.SelectedIndex = 0;
            fvPla_Doc.ChangeMode(FormViewMode.ReadOnly);
        }
        else
        {

            fvPla_Doc.ChangeMode(FormViewMode.ReadOnly);
        }
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
    // Eventos para el GridView de Pla_Doc
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
    protected void fvPla_Doc_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Valida que el estado de planificación sea distinto a PEN
        string sEsta_Planifica = (string) e.OldValues["Esta_Planificada"];
        if (sEsta_Planifica != "PEN")
        {
            // Controla el cambio del formato de las fechas
            e.NewValues["Fecha_Solicita"] = DateTime.Parse((string)e.NewValues["Fecha_Solicita"]);
            e.OldValues["Fecha_Solicita"] = DateTime.Parse((string)e.OldValues["Fecha_Solicita"]);
            e.NewValues["Fecha_Contrata"] = DateTime.Parse((string)e.NewValues["Fecha_Contrata"]);
            e.OldValues["Fecha_Contrata"] = DateTime.Parse((string)e.OldValues["Fecha_Contrata"]);
            e.NewValues["Fecha_Planifica"] = DateTime.Parse((string)e.NewValues["Fecha_Planifica"]);
            e.OldValues["Fecha_Planifica"] = DateTime.Parse((string)e.OldValues["Fecha_Planifica"]);
            // Valores para los campos de personas
            e.NewValues["Per_Personal_Id_Modifica"] = Scope.Per_Personal_Id;
            // Cambio del formato del campo Valor
            e.NewValues["Valor_Solicita"] = Decimal.Parse((string)e.NewValues["Valor_Solicita"]);
            e.OldValues["Valor_Solicita"] = Decimal.Parse((string)e.OldValues["Valor_Solicita"]);
            e.NewValues["Valor_Suma_Movs"] = Decimal.Parse((string)e.NewValues["Valor_Suma_Movs"]);
            e.OldValues["Valor_Suma_Movs"] = Decimal.Parse((string)e.OldValues["Valor_Suma_Movs"]);
            // Controla los campos que se permiten ser NULL en la tabla
            string sPerContrataId = (string)e.OldValues["Per_Personal_Id_Contrata"];
            if (String.IsNullOrEmpty(sPerContrataId))
            {
                e.OldValues["Per_Personal_Id_Contrata"] = null;
            }
            // Guarda los datos del registro a borrar en memoria
            this.MemoriaRegistroActual = "Id: " + (string)e.NewValues["Id"] + " * " +
                                         "Codigo: " + (string)e.NewValues["Codigo"];
        }
        else // Si el estado de planificación es igual a PEN no puede hacer nada
        {
            e.Cancel = true;
            fvPla_Doc.HayErrorInsUpd = true;
            lbFvMsgErrorPla_Doc.Text = String.Format("Error, el campo Esta_Planifica debe ser diferente a PEN.");
        }
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
                ((TextBox)fvPla_Doc.FindControl("Per_Personal_Id_ContrataTextBox")).Text = Scope.Per_Personal_Id;
                ((TextBox)fvPla_Doc.FindControl("Per_Personal_Nombre_ContrataTextBox")).Text = Scope.Per_Personal_Nombre;
                ((TextBox)fvPla_Doc.FindControl("Fecha_ContrataTextBox")).Text = DateTime.Today.ToShortDateString();
                break;
            case FormViewMode.ReadOnly:
                //  Inicializa la diferencia entre lo planificado y lo solicitado
                var sesion = Session["Dif_Valor_Planificado_Solicitado"];
                if (sesion != null)
                {
                    var textboxDif = (TextBox)fvPla_Doc.FindControl("Valor_Dif_Planif_Solicit");
                    if (textboxDif != null)
                        textboxDif.Text = string.Format("{0:N2}", sesion);
                }
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Doc_DataBound(object sender, EventArgs e)
    {
        //if (gvPla_Doc.Rows.Count == 0)
        //    fvPla_Doc.ChangeMode(FormViewMode.Insert);
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
            lbFvMsgInfoPla_Doc.Text = "Pla_Doc Registro Insertado. " + this.MemoriaRegistroActual;
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
            lbFvMsgInfoPla_Doc.Text = "Pla_Doc Registro Actualizado. " + this.MemoriaRegistroActual;
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
            lbFvMsgInfoPla_Doc.Text = "Pla_Doc Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Doc_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        var lista = (List<Pla_Doc>)e.ReturnValue;
        if (lista.Count > 0)
        {
            var o = lista[0];
            Session["Dif_Valor_Planificado_Solicitado"] = o.Valor_Suma_Movs - o.Valor_Solicita;
        }
    }
    #endregion

    // Eventos para GridVeiw de Pla_Mov
    #region Eventos del GridView de Pla_Mov
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvPla_Mov_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgErrorPla_Mov.Text = ":";
        lbFvMsgInfoPla_Mov.Text = "> Pla_Mov Seleccionado";
        // Pone el formview en ReadOnly
        if (gvPla_Mov.SelectedIndex != -1)
            fvPla_Mov.ChangeMode(FormViewMode.ReadOnly);
    }
    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Mov(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Mov.DataSourceObject;
            List<Pla_Mov> lista = (List<Pla_Mov>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Mov.PageSize;
                noFila = pos - noPagina * gvPla_Mov.PageSize;
            }
        }
        gvPla_Mov.PageIndex = noPagina;
        gvPla_Mov.SelectedIndex = noFila;
    }
    #endregion
    // Eventos para el FormView de Pla_Mov
    #region Eventos el FormView de Pla_Mov

    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Mov_PreRender(object sender, EventArgs e)
    {
        string sPoaId;
        switch (fvPla_Mov.CurrentMode)
        {
            case FormViewMode.Insert:

                break;
            case FormViewMode.Edit:

                break;
            case FormViewMode.ReadOnly:
                // Poner los valores iniciales a los campos
                if (fvPla_Mov.FindControl("Pla_Poa_IdTextBox") != null)
                {
                    sPoaId = ((TextBox)fvPla_Mov.FindControl("Pla_Poa_IdTextBox")).Text;
                    if (!String.IsNullOrEmpty(sPoaId))
                    {
                        int xPoaId = Int32.Parse(sPoaId);
                        BO_Pla_Poa adpPoa = new BO_Pla_Poa();
                        var poa = adpPoa.GetById(Scope, xPoaId)[0];
                        ((TextBox)fvPla_Mov.FindControl("Valor_InicialTextBox")).Text = string.Format("{0:N2}", poa.Valor_Inicial);
                        ((TextBox)fvPla_Mov.FindControl("Valor_SumaTextBox")).Text = string.Format("{0:N2}", poa.Valor_Suma);
                    }
                }
                break;
        }
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Mov_DataBound(object sender, EventArgs e)
    {
        if (gvPla_Mov.Rows.Count == 0)
            fvPla_Mov.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource

    #endregion

    protected void gvPla_Doc_DataBound(object sender, EventArgs e)
    {
        var index = gvPla_Doc.SelectedIndex;
        if (index == -1)
            if (gvPla_Doc.Rows.Count > 0)
                gvPla_Doc.SelectedIndex = 0;
    }

    // Evantos para el ObjectDataSource del arbol de Cuentas
    protected void odsPla_Cta_Arbol_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        var o = e.InputParameters;
        // Obtiene el Pla_Tarea_Id
        var xMovId = (int)gvPla_Mov.SelectedValue;
        BO_Pla_Mov adpMov = new BO_Pla_Mov();
        var oMov = (adpMov.GetById(Scope, xMovId))[0];
        o["p_Pla_Tarea_Id"] = oMov.Pla_Tarea_Id;
    }

}