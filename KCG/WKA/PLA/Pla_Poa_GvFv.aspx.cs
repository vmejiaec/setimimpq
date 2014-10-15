﻿using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Poa_GvFv : PaginaBase
{
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Pla_Poa_GvFv"; }
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
                gvPla_Poa.DataSourceID = odsgvPla_Poa.ID;
                break;
			}
        gvPla_Poa.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgError.Text = ":";
        lbFvMsgInfo.Text = ">";
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

    // Eventos del Grid View POA
    #region Eventos del GridView POA
    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Poa_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgError.Text = ":";
        lbFvMsgInfo.Text = ">";
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
			if (lbFvMsgError.Text == ":") lbFvMsgError.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Poa(gvPla_Poa, tbFiltroId.Text);
            gvPla_Poa.DataBind();
        }
    }
    protected void fvPla_Poa_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgError.Text == ":") lbFvMsgError.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Poa_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgError.Text == ":") lbFvMsgError.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Poa(gvPla_Poa, tbFiltroId.Text);
            gvPla_Poa.DataBind();
        }
    }    
    protected void fvPla_Poa_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Cambio del formato de los campos de fechas y números
        e.Values["Valor_Inicial"] = "0";
        e.Values["Valor_Suma"] = "0";
    }
    protected void fvPla_Poa_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de las fechas
        // e.NewValues["Fecha_Ini"] = DateTime.Parse((string)e.NewValues["Fecha_Ini"]);
        // e.OldValues["Fecha_Ini"] = DateTime.Parse((string)e.OldValues["Fecha_Ini"]);        
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
            lbFvMsgError.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfo.Text = "Registro Insertado.";
            AsignarMensaje("Registro Insertado.",bien);
        }
    }
    protected void odsfvPla_Poa_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgError.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfo.Text = "Registro Actualizado.";
            AsignarMensaje("Registro Actualizado.", bien);
        }
    }
    protected void odsfvPla_Poa_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgError.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfo.Text = "Registro Borrado.";
            AsignarMensaje("Registro Borrado.", bien);
        }
    }
    #endregion

    // Inicializar controles aumentar a la plantilla
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa el control 
    }

}