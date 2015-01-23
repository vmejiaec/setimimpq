using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Configuration;

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
            lbFvMsgErrorPla_Doc.Text = String.Format("Error, el campo Esta_POA debe ser diferente a PEN.");
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
            Session["Dif_Valor_Planificado_Solicitado"] = - o.Valor_Suma_Movs - o.Valor_Solicita;
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

    // Reporte del Formulario de Inicio de proceso
    protected void btReporteFormulario_Click(object sender, EventArgs e)
    {
        // Tomo el Id seleccionado de la lista
        if (gvPla_Doc.SelectedValue != null)
        {
            int xPla_Doc_Id = (int)gvPla_Doc.SelectedValue;
            if (Session["Scope"] == null) Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            HER.ResponseHelper.Redirect(servidor_reporte
                                    + "PLA/PLA_Formulario_Inicio_Proceso.aspx"
                                    + Scope_Factory.Get_QueryString(s)
                                    + string.Format("&v_Pla_Doc_Id={0}", xPla_Doc_Id),
                                    "_blank", "scrollbars=yes, resizable=yes");
        }
    }

    protected void fvPla_Doc_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        // Verifica que el estado_proceso esté en pendiente
        if (e.NewMode == FormViewMode.Edit)
        {
            string sEstado_Proceso = ((TextBox)fvPla_Doc.FindControl("Estado_ProcesoTextBox")).Text;
            if (sEstado_Proceso != "Pendiente")
            {
                e.Cancel = true;
                lbFvMsgErrorPla_Doc.Text = "El formulario ya tiene un proceso de contratación.";
            }
        }
    }
    protected void btCrearProcesoContratacion_Click(object sender, EventArgs e)
    {
        string mensaje = "";        
        //Verificar que está seleccionado un registro del Grid
        var vPla_Doc_Id = gvPla_Doc.SelectedValue;
        if (vPla_Doc_Id == null)
        {
            mensaje = "Error, no se ha seleccionado un registro de la lista superior.";
            goto Alerta;
        }        
        int iPla_Doc_Id = (int)vPla_Doc_Id;
        FEL.PLA.BO_Pla_Doc adpDoc = new BO_Pla_Doc();
        var listaDocs = adpDoc.GetById(Scope, iPla_Doc_Id);
        var oDoc = listaDocs[0];
        //Verificar que el registro seleccionado tenga SIP y SIC
        if (oDoc.Esta_Planificada != "SIP" || oDoc.Esta_Contratada != "SIC")
        {
            mensaje = "Error, Esta_Planificada debe ser SIP y Esta_Contratada debe ser SIC.";
            goto Alerta;
        }
        // Verifica que el estado del proceso se pendiente
        if (listaDocs[0].Estado_Proceso != "Pendiente")
        {
            mensaje = "Error, el registro ya tiene un proceso.";
            goto Alerta;
        }            
        // Consulto el tipo de procedimiento NIN 
        FEL.COM.BO_Com_Procedimiento adpProc = new FEL.COM.BO_Com_Procedimiento();
        List<Com_Procedimiento> listaProc = adpProc.Get(Scope);
        Com_Procedimiento oProcNinguno = listaProc.Find(o => o.Tipo == "NIN");
        // Verifica que exista el tipo de procedimiento NIN
        if (oProcNinguno == null)
        {
            mensaje = "Error, no existe un procedimiento tipo NIN.";
            goto Alerta;
        }
        //Construir el objeto Com_Contrato con valores por defecto
        Com_Contrato oContrato = new Com_Contrato();
        oContrato.Pla_Doc_Id = iPla_Doc_Id;
        oContrato.Codigo_Sercop = "";
        oContrato.Com_Procedimiento_Id = oProcNinguno.Id;
        oContrato.Com_Procedimiento_Desc = "";
        // Responsables y contratista
        oContrato.Per_Personal_Resp_Exp = null;
        oContrato.Par_Razon_Social_Id_Contratista = null;
        oContrato.Per_Personal_Id_Admin = null;
        // Referencial
        oContrato.Plazo_Ref = 0;
        oContrato.Porcentaje_Anticipo_Ref = 0.0m;
        // Contrato
        oContrato.Valor_Contrato = 0.0m;
        oContrato.Plazo_Contrato = 0;
        oContrato.Porcentaje_Anticipo_Contrato = 0.0m;
        oContrato.Desc_Contrata = "";
        // Estados
        oContrato.Estado = "PEN";
        oContrato.Estado_Portal = "POR"; // Estado Portal: Por subir
        oContrato.Estado_Contratacion = "";
        // Fechas
        DateTime dtFechaHoy = DateTime.Today;
        oContrato.Fecha_Cierre_Rec_Ofertas = dtFechaHoy;
        oContrato.Fecha_Inicio_Contrato = dtFechaHoy;
        oContrato.Fecha_Crea = dtFechaHoy;
        oContrato.Fecha_Inicio_Elabora_Pliegos = dtFechaHoy;
        oContrato.Fecha_Publicacion_Portal = dtFechaHoy;
        oContrato.Fecha_Calificaciones = dtFechaHoy;
        oContrato.Fecha_Estimada_Adjudicacion = dtFechaHoy;
        oContrato.Fecha_Adjudicacion = dtFechaHoy;
        oContrato.Fecha_Juridico = dtFechaHoy;
        //Intentar insertar el objeto Com_Contrato
        FEL.COM.BO_Com_Contrato adpCon = new FEL.COM.BO_Com_Contrato();
        int resConId = adpCon.InsertINT(oContrato);
        //Verificar que el objeto Com_Contrato se haya insertado
        if (resConId <= 0)
        {
            mensaje = "Error al insertar el inicio del proceso.";
            goto Alerta;
        }
        //Cargar los documentos técnicos por defecto
        FEL.COM.BO_Com_Contrato_DocTec adpConDocTec = new FEL.COM.BO_Com_Contrato_DocTec();
        FEL.COM.BO_Com_DocTec adpTec = new FEL.COM.BO_Com_DocTec();
        var listaTecs = adpTec.Get(Scope, "Nombre");
        foreach (var Tec in listaTecs)
        {
            Com_Contrato_DocTec oConDocTec = new Com_Contrato_DocTec();
            oConDocTec.Com_Contrato_Id = resConId;
            oConDocTec.Nombre = Tec.Nombre;
            oConDocTec.Tiene = ".."; // Esta pendiente del SI o NO del usaurio en compras
            int resTec = adpConDocTec.InsertINT(oConDocTec);
        }
        // Presenta la alerta que el inicio del proceso se ha creado con éxito
        mensaje = string.Format("El proceso {0} se ha creado con éxito. Ir a la pantalla de 'Proceso Contrato'", oDoc.Codigo);
        // Publica el mesanje si existe alguna alerta
        Alerta:
        if (!string.IsNullOrEmpty(mensaje))
        {
            lbMensajeAlerta.Text = mensaje;
            mpeAlerta.Show();
        }
    }
}