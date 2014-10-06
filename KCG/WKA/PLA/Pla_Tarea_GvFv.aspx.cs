﻿using System;
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
                gvPla_Tarea.DataSourceID = odsgvPla_Tarea.ID;
                break;
			case "Nombre":
                gvPla_Tarea.DataSourceID = "odsgvPla_Tarea_GetByAnioLikeNombre";
                break;
			}
        gvPla_Tarea.DataBind();
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
    protected void odsfvPla_Tarea_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void odsfvPla_Tarea_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
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

    // Valores por defecto antes de enviar a insertar, actualizar o borrar.
    #region Valores por defecto
    protected void fvPla_Tarea_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
        // Cambio del formato de las fechas
        e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
        e.Values["Fecha_Fin"] = DateTime.Parse((string)e.Values["Fecha_Fin"]);
    }
    protected void fvPla_Tarea_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Controla el cambio del formato de las fechas
        e.NewValues["Fecha_Ini"] = DateTime.Parse((string)e.NewValues["Fecha_Ini"]);
        e.NewValues["Fecha_Fin"] = DateTime.Parse((string)e.NewValues["Fecha_Fin"]);
        e.OldValues["Fecha_Ini"] = DateTime.Parse((string)e.OldValues["Fecha_Ini"]);
        e.OldValues["Fecha_Fin"] = DateTime.Parse((string)e.OldValues["Fecha_Fin"]);
    }
    protected void fvPla_Tarea_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de las fechas
        e.Values["Fecha_Ini"] = DateTime.Parse((string)e.Values["Fecha_Ini"]);
        e.Values["Fecha_Fin"] = DateTime.Parse((string)e.Values["Fecha_Fin"]);
    }

    #endregion

    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Tarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgError.Text = ":";
        lbFvMsgInfo.Text = ">";
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
        switch (fvPla_Tarea.CurrentMode)
        {
            case FormViewMode.Insert:
                TextBox tbFecha_Ini = (TextBox) fvSender.FindControl("Fecha_IniTextBox");
                TextBox tbFecha_Fin = (TextBox)fvSender.FindControl("Fecha_FinTextBox");
                tbFecha_Ini.Text = DateTime.Today.ToShortDateString();
                tbFecha_Fin.Text = tbFecha_Ini.Text;
                break;
            case FormViewMode.Edit:
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

}
    