﻿using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Configuration;

public partial class PLA_Pla_Doc_Reasignacion : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "Rasignación POA"; }
    }
    // Inicializar controles al arranque de la página
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Obtengo el número de cédula de la persona, su área de trabajo
            FEL.PER.BO_Per_Personal adpPER = new FEL.PER.BO_Per_Personal();
            var perLista = adpPER.GetById("Nombre", Scope, Scope.Per_Personal_Id);
            string cedula = perLista[0].Par_Razon_Social_Numero;
            FEL.VAR.BO_V_INT_Funcionario_Area adpFun = new FEL.VAR.BO_V_INT_Funcionario_Area();
            var funLista = adpFun.GetByPersona_Codigo(Scope, cedula);
            if (funLista.Count > 0)
            {
                var funcionario = funLista[0];
                // Asigno a la cabecera
                lbCabecera_Area_Nombre.Text = funcionario.Area_Nombre;
                lbCabecera_Area_Codigo.Text = funcionario.Area_Codigo;
                lbCabecera_Persona_Nombre.Text = Scope.Per_Personal_Nombre;
                lbCabecera_Persona_Cargo.Text = funcionario.Persona_Cargo;
            }
            else
                lbCabecera_Area_Nombre.Text = "El usuario no tiene relacionado un funcionario";
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
        switch (campo)
        {
            case "Todos":
                gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita.ID;
                break;
            case "Codigo":
                gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_Codigo.ID;
                break;
            case "Descripcion":
                gvPla_Doc.DataSourceID = odsgvPla_Doc_GetByTipo_Area_Codigo_LikeDescripcion.ID;
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
        // Valor del tipo de documento de REP para reprogramación POA
        e.Values["Tipo"] = "REP";
        // Valor para el área del usuario
        e.Values["Area_Codigo_Solicita"] = lbCabecera_Area_Codigo.Text;
        // Cambio del formato de los campos de fechas
        e.Values["Fecha_Solicita"] = DateTime.Parse((string)e.Values["Fecha_Solicita"]);
        e.Values["Fecha_Contrata"] = e.Values["Fecha_Solicita"];
        e.Values["Fecha_Planifica"] = e.Values["Fecha_Solicita"];
        // Valores para los campos de personas
        e.Values["Per_Personal_Id_Solicita"] = Scope.Per_Personal_Id;
        e.Values["Per_Personal_Id_Crea"] = Scope.Per_Personal_Id;
        e.Values["Per_Personal_Id_Modifica"] = Scope.Per_Personal_Id;
        // La solicitud del director se crea con las personas de Planificación y Contratación
        // en NULL para que sea coherente
        e.Values["Per_Personal_Id_Planifica"] = null;
        e.Values["Per_Personal_Id_Contrata"] = null;
        // Los estados se ponen en PEN de pendiente
        e.Values["Esta_Planificada"] = "PEN";
        e.Values["Esta_Contratada"] = "PEN";
        // Cambio del formato del campo Valor
        e.Values["Valor_Solicita"] = Decimal.Parse((string)e.Values["Valor_Solicita"]);
    }
    protected void fvPla_Doc_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Validar que el DOC seleccionado tenga el estado Planifica = "PEN"
        var xEsta_Planificada = fvPla_Doc.FindControl("Esta_PlanificadaTextBox");
        string sEsta_Planificada = ((TextBox)xEsta_Planificada).Text;
        if (sEsta_Planificada == "PEN")
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
            // La solicitud del director se actualiza con las personas de Planificación y Contratación
            // en NULL para que sea coherente con el proceso
            if (String.IsNullOrEmpty((string)e.OldValues["Per_Personal_Id_Planifica"]))
            {
                e.OldValues["Per_Personal_Id_Planifica"] = null;
                e.NewValues["Per_Personal_Id_Planifica"] = null;
            }
            if (String.IsNullOrEmpty((string)e.OldValues["Per_Personal_Id_Contrata"]))
            {
                e.OldValues["Per_Personal_Id_Contrata"] = null;
                e.NewValues["Per_Personal_Id_Contrata"] = null;
            }
            // Cambio del formato del campo Valor
            e.NewValues["Valor_Solicita"] = Decimal.Parse((string)e.NewValues["Valor_Solicita"]);
            e.OldValues["Valor_Solicita"] = Decimal.Parse((string)e.OldValues["Valor_Solicita"]);
            // Guarda los datos del registro a borrar en memoria
            this.MemoriaRegistroActual = "Id: " + e.NewValues["Id"].ToString() + " * " +
                                         "Codigo: " + (string)e.NewValues["Codigo"];
        }
        else // Si el estado de planificación es igual a PEN no puede hacer nada
        {
            e.Cancel = true;
            fvPla_Doc.HayErrorInsUpd = true;
            lbFvMsgErrorPla_Doc.Text = String.Format("Error, el campo Esta_Planifica debe ser diferente a PEN.");
        }
    }
    protected void fvPla_Doc_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Validar que el DOC seleccionado tenga el estado Planifica = "PEN"
        var xEsta_Planificada = fvPla_Doc.FindControl("Esta_PlanificadaTextBox");
        string sEsta_Planificada = ((TextBox)xEsta_Planificada).Text;
        if (sEsta_Planificada == "PEN")
        {
            // Cambio del formato de los campos de fechas
            e.Values["Fecha_Solicita"] = DateTime.Parse((string)e.Values["Fecha_Solicita"]);
            e.Values["Fecha_Contrata"] = DateTime.Parse((string)e.Values["Fecha_Contrata"]);
            e.Values["Fecha_Planifica"] = DateTime.Parse((string)e.Values["Fecha_Planifica"]);
            // Cambio del formato del campo Valor
            e.Values["Valor_Solicita"] = Decimal.Parse("0");
            e.Values["Valor_Suma_Movs"] = Decimal.Parse( (string) e.Values["Valor_Suma_Movs"]);
            // La solicitud del director se actualiza con las personas de Planificación y Contratación
            // en NULL para que sea coherente con el proceso
            if (String.IsNullOrEmpty((string)e.Values["Per_Personal_Id_Planifica"]))
            {
                e.Values["Per_Personal_Id_Planifica"] = null;
            }
            if (String.IsNullOrEmpty((string)e.Values["Per_Personal_Id_Contrata"]))
            {
                e.Values["Per_Personal_Id_Contrata"] = null;
            }
            // Guarda los datos del registro a borrar en memoria
            this.MemoriaRegistroActual = //"Id: " + e.Values["Id"].ToString() + " * " +
                                         "Codigo: " + (string)e.Values["Codigo"];
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
                ((TextBox)fvPla_Doc.FindControl("IdTextBox")).Text = "-1";
                ((TextBox)fvPla_Doc.FindControl("CodigoTextBox")).Text = "1";
                ((TextBox)fvPla_Doc.FindControl("EstadoTextBox")).Text = "PEN";
                var hoy = DateTime.Today.ToShortDateString();
                ((TextBox)fvPla_Doc.FindControl("Fecha_SolicitaTextBox")).Text = hoy;
                ((TextBox)fvPla_Doc.FindControl("Valor_SolicitaTextBox")).Text = "0";
                ((TextBox)fvPla_Doc.FindControl("Per_Personal_Nombre_SolicitaTextBox")).Text = Scope.Per_Personal_Nombre;
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
        //if (gvPla_Doc.Rows.Count == 0)
        //    fvPla_Doc.ChangeMode(FormViewMode.Insert);
    }
    #endregion
    // Eventos para el ObjectDataSource de Pla_Doc
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
    protected void fvPla_Mov_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            fvPla_Mov.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgErrorPla_Mov.Text == ":") lbFvMsgErrorPla_Mov.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Mov(gvPla_Mov, tbFiltroId.Text);
            gvPla_Mov.DataBind();
        }
    }
    protected void fvPla_Mov_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgErrorPla_Mov.Text == ":") lbFvMsgErrorPla_Mov.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Mov_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            fvPla_Mov.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgErrorPla_Mov.Text == ":") lbFvMsgErrorPla_Mov.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Mov(gvPla_Mov, tbFiltroId.Text);
            gvPla_Mov.DataBind();
        }
    }
    protected void fvPla_Mov_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //Valida que el documento tenga Esta_Contrata = PEN
        var xEsta_ContratadaTextBox = fvPla_Doc.FindControl("Esta_ContratadaTextBox");
        if (xEsta_ContratadaTextBox != null)
        {
            // 
            string sEsta_Contratada = ((TextBox)xEsta_ContratadaTextBox).Text;
            if (sEsta_Contratada == "PEN")
            {
                // Valor por defecto del Id y Orden
                e.Values["Id"] = -1;
                if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
                e.Values["Orden"] = 0;
                e.Values["Pla_Partida_Id"] = 0;
                // Cambio del formato de los campos de Valor para asegurarse que siempre sea negativo
                e.Values["Valor"] = Decimal.Parse((string)e.Values["Valor"]);
                // Pone el Tipo del Movimiento en DEB
                //e.Values["Tipo"] = "DEB";
                // VALIDA si el valor ingresado supera el saldo permitido
                string sTipoMov = (string) e.Values["Tipo"];
                string sValor_Suma = ((TextBox)fvPla_Mov.FindControl("Valor_SumaTextBox")).Text;
                Decimal dValor_Suma = Decimal.Parse(sValor_Suma);
                Decimal dValor_f = (Decimal)e.Values["Valor"];
                if (dValor_f > dValor_Suma && sTipoMov == "DEB")
                {
                    e.Cancel = true;
                    fvPla_Mov.HayErrorInsUpd = true;
                    lbFvMsgErrorPla_Mov.Text = String.Format("El valor {0:N2} no puede superar al saldo.", dValor_f);
                }
                else
                {
                    lbFvMsgErrorPla_Mov.Text = ":";
                }
                // Guarda los datos del registro a borrar en memoria
                this.MemoriaRegistroActual = "Codigo: " + (string)e.Values["Codigo"];
            }
            else // Si el Estado_Contrata es diferente de PEN
            {
                e.Cancel = true;
                fvPla_Mov.HayErrorInsUpd = true;
                lbFvMsgErrorPla_Mov.Text = "Error, la solicitud debe tener el Estado_Contrata en PEN.";
            }
        }
        else // En caso que no haya seleccionado nada en la grilla de DOC
        {
            e.Cancel = true;
            fvPla_Mov.HayErrorInsUpd = true;
            lbFvMsgErrorPla_Mov.Text = "Primero debe seleccionar una solicitud de la lista.";
        }
    }
    protected void fvPla_Mov_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Valida si ha seleccionado una fila en DOC
        var xEsta_ContratadaTextBox = fvPla_Doc.FindControl("Esta_ContratadaTextBox");
        if (xEsta_ContratadaTextBox != null)
        {
            // Valida que el documento tenga Esta_Contrata = PEN
            string sEsta_Contratada = ((TextBox)xEsta_ContratadaTextBox).Text;
            if (sEsta_Contratada == "PEN")
            {
                // Controla el cambio del formato de las fechas
                e.NewValues["Pla_Doc_Fecha"] = DateTime.Parse((string)e.NewValues["Pla_Doc_Fecha"]);
                e.OldValues["Pla_Doc_Fecha"] = DateTime.Parse((string)e.OldValues["Pla_Doc_Fecha"]);
                // Cambio del formato de los campos de Valor 
                e.NewValues["Valor"] = Decimal.Parse((string)e.NewValues["Valor"]);
                e.OldValues["Valor"] = Decimal.Parse((string)e.OldValues["Valor"]);
                // Pone el Tipo del Movimiento en DEB
                //e.NewValues["Tipo"] = "DEB";
                //e.OldValues["Tipo"] = "DEB";
                // VALIDA si el valor ingresado supera el saldo permitido
                string sValor_Suma = ((TextBox)fvPla_Mov.FindControl("Valor_SumaTextBox")).Text;
                Decimal dValor_Suma = Decimal.Parse(sValor_Suma);
                Decimal dValor_o = (Decimal)e.OldValues["Valor"];
                Decimal dValor_f = (Decimal)e.NewValues["Valor"];
                if (dValor_f > dValor_o + dValor_Suma)
                {
                    e.Cancel = true;
                    fvPla_Mov.HayErrorInsUpd = true;
                    lbFvMsgErrorPla_Mov.Text = String.Format("El valor de {0:N2} causará un saldo negativo.", dValor_f);
                }
                else
                {
                    lbFvMsgErrorPla_Mov.Text = ":";
                }
                // Guarda los datos del registro a borrar en memoria
                this.MemoriaRegistroActual = "Id: " + (string)e.NewValues["Id"] + " * " +
                                             "Codigo: " + (string)e.NewValues["Codigo"];
            }
            else // Si el Estado_Contrata es diferente de PEN
            {
                e.Cancel = true;
                fvPla_Mov.HayErrorInsUpd = true;
                lbFvMsgErrorPla_Mov.Text = "Error, la solicitud debe tener el Estado_Contrata en PEN.";
            }
        }
        else // En caso que no haya seleccionado nada en la grilla de DOC
        {
            e.Cancel = true;
            fvPla_Mov.HayErrorInsUpd = true;
            lbFvMsgErrorPla_Mov.Text = "Primero debe seleccionar una solicitud de la lista.";
        }
    }
    protected void fvPla_Mov_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Control de valores antes del borrado de fechas 
        e.Values["Pla_Doc_Fecha"] = DateTime.Parse((string)e.Values["Pla_Doc_Fecha"]);
        // Valores
        e.Values["Valor"] = Decimal.Parse((string)e.Values["Valor"]);
        // Guarda los datos del registro a borrar en memoria
        // Valida si ha seleccionado una fila en DOC
        var xEsta_ContratadaTextBox = fvPla_Doc.FindControl("Esta_ContratadaTextBox");
        if (xEsta_ContratadaTextBox != null)
        {
            // Valida que el documento tenga Esta_Contrata = PEN
            string sEsta_Contratada = ((TextBox)xEsta_ContratadaTextBox).Text;
            if (sEsta_Contratada == "PEN")
            {
                // VALIDA si el valor ingresado supera el saldo permitido
                string sTipoMov = (string)e.Values["Tipo"];
                string sValor_Suma = ((TextBox)fvPla_Mov.FindControl("Valor_SumaTextBox")).Text;
                Decimal dValor_Suma = Decimal.Parse(sValor_Suma);
                Decimal dValor_f = (Decimal)e.Values["Valor"];
                if (dValor_f > dValor_Suma && sTipoMov == "CRE")
                {
                    e.Cancel = true;
                    fvPla_Mov.HayErrorInsUpd = true;
                    lbFvMsgErrorPla_Mov.Text = String.Format("El valor {0:N2} no puede superar al saldo.", dValor_f);
                }
                else
                {
                    this.MemoriaRegistroActual = "Id: " + (string)e.Values["Id"] + " * " +
                                                 "Codigo: " + (string)e.Values["Codigo"];
                }
            }
            else // Si el Estado_Contrata es diferente de PEN
            {
                e.Cancel = true;
                fvPla_Mov.HayErrorInsUpd = true;
                lbFvMsgErrorPla_Mov.Text = "Error, la solicitud debe tener el Estado_Contrata en PEN.";
            }
        }
        else // En caso que no haya seleccionado nada en la grilla de DOC
        {
            e.Cancel = true;
            fvPla_Mov.HayErrorInsUpd = true;
            lbFvMsgErrorPla_Mov.Text = "Primero debe seleccionar una solicitud de la lista.";
        }
    }
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Mov_PreRender(object sender, EventArgs e)
    {
        AjaxControlToolkit.AutoCompleteExtender acxPla_Cta_CodigoTextBox = new AjaxControlToolkit.AutoCompleteExtender();
        AjaxControlToolkit.AutoCompleteExtender acxPla_Cta_NombreTextBox = new AjaxControlToolkit.AutoCompleteExtender();
        string sPoaId;
        switch (fvPla_Mov.CurrentMode)
        {
            case FormViewMode.Insert:
                // La orden será por defecto 0 pero en el SP se calcula el verdadero
                ((TextBox)fvPla_Mov.FindControl("OrdenTextBox")).Text = "0";
                // El valor por defecto del movimiento será 0
                ((TextBox)fvPla_Mov.FindControl("ValorTextBox")).Text = "0";
                // Pla_Doc_Id viene del seleccionado en el Grid
                if (gvPla_Doc.SelectedValue != null)
                    ((TextBox)fvPla_Mov.FindControl("Pla_Doc_IdTextBox")).Text = gvPla_Doc.SelectedValue.ToString();
                // Pone el año en el autocompletar
                acxPla_Cta_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvPla_Mov.FindControl("acxPla_Cta_CodigoTextBox");
                acxPla_Cta_CodigoTextBox.ContextKey = ((DropDownList)fvPla_Mov.FindControl("ddlAnio")).SelectedValue;
                acxPla_Cta_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvPla_Mov.FindControl("acxPla_Cta_NombreTextBox");
                acxPla_Cta_NombreTextBox.ContextKey = ((DropDownList)fvPla_Mov.FindControl("ddlAnio")).SelectedValue;
                // Si NO es la primera vez que se insertan registros el Grid estará con al menos una fila
                if (gvPla_Mov.Rows.Count > 0)
                {
                    // Ponemos por defecto los datos del registro anterior
                    if (gvPla_Mov.SelectedIndex != -1)
                    {
                        // EN CONSTRUCCION.
                    }
                }
                break;
            case FormViewMode.Edit:
                // Pone el año en el autocompletar
                acxPla_Cta_CodigoTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvPla_Mov.FindControl("acxPla_Cta_CodigoTextBox");
                acxPla_Cta_CodigoTextBox.ContextKey = ((DropDownList)fvPla_Mov.FindControl("ddlAnio")).SelectedValue;
                acxPla_Cta_NombreTextBox = (AjaxControlToolkit.AutoCompleteExtender)fvPla_Mov.FindControl("acxPla_Cta_NombreTextBox");
                acxPla_Cta_NombreTextBox.ContextKey = ((DropDownList)fvPla_Mov.FindControl("ddlAnio")).SelectedValue;
                // Poner los valores iniciales a los campos
                sPoaId = ((TextBox)fvPla_Mov.FindControl("Pla_Poa_IdTextBox")).Text;
                if (!String.IsNullOrEmpty(sPoaId))
                {
                    int xPoaId = Int32.Parse(sPoaId);
                    BO_Pla_Poa adpPoa = new BO_Pla_Poa();
                    var poa = adpPoa.GetById(Scope, xPoaId)[0];
                    ((TextBox)fvPla_Mov.FindControl("Pla_Cta_CodigoTextBox")).Text = poa.Pla_Cta_Codigo;
                    ((TextBox)fvPla_Mov.FindControl("Pla_Cta_NivelTextBox")).Text = "";
                    ((TextBox)fvPla_Mov.FindControl("Pla_Cta_NombreTextBox")).Text = poa.Pla_Cta_Nombre;
                    ((TextBox)fvPla_Mov.FindControl("Pla_Tarea_NombreTextBox")).Text = poa.Pla_Tarea_Nombre;
                    ((TextBox)fvPla_Mov.FindControl("Pla_Partida_CodigoTextBox")).Text = poa.Pla_Partida_Codigo;
                    ((TextBox)fvPla_Mov.FindControl("Pla_Partida_NombreTextBox")).Text = poa.Pla_Partida_Nombre;
                    ((TextBox)fvPla_Mov.FindControl("Valor_InicialTextBox")).Text = string.Format("{0:N2}", poa.Valor_Inicial);
                    ((TextBox)fvPla_Mov.FindControl("Valor_SumaTextBox")).Text = string.Format("{0:N2}", poa.Valor_Suma);
                }
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
    // Eventos para el ObjectDataSource de Pla_Mov
    #region Eventos para el ObjectDataSource
    protected void odsfvPla_Mov_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Mov.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoPla_Mov.Text = "Pla_Mov Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Mov_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Mov.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Mov.Text = "Pla_Mov Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvPla_Mov_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorPla_Mov.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoPla_Mov.Text = "Pla_Mov Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }
    #endregion

    // WebServices para autocompletar campos del FormView de Movimientos
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
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Tarea_GetByPla_Cta_IdLikeNombre_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Tarea adp = new BO_Pla_Tarea();
        var lista = adp.GetByPla_Cta_IdLikeNombre(s, Int32.Parse(contextKey), prefixText);
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Nombre, fila.Id + "||" + fila.Codigo + "||" + fila.Nombre // 0 1 2
                    ));
        return items.ToArray();
    }
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxPla_Partida_GetByLikeCodigo_List(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PLA.BO_Pla_Poa adp = new BO_Pla_Poa();
        var lista = adp.GetByPla_Tarea_Id(s, Int32.Parse(contextKey));
        //

        List<string> items = new List<string>();
        foreach (var fila in lista)
        {
            string valor = string.Format("{0}||{1}||{2}||{3:N2}||{4:N2}",
                fila.Id,
                fila.Pla_Partida_Codigo,
                fila.Pla_Partida_Nombre,
                fila.Valor_Inicial,
                fila.Valor_Suma);
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(fila.Pla_Partida_Codigo, valor));
        }
        return items.ToArray();
    }
    #endregion WebServices para autocompletar

    // Eventos para el ObjectDataSource del arbol de Cuentas
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