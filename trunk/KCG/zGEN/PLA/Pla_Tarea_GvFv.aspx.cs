﻿using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;

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
    protected override GridView Gv
    {
        get { return gvPla_Tarea; }
    }
    protected override FormView Fv
    {
        get { return fvPla_Tarea; }
    }
    protected override ObjectDataSource odsGv
    {
        get { return odsgvPla_Tarea; }
    }
    protected override ObjectDataSource odsFv
    {
        get { return odsfvPla_Tarea; }
    }
    protected override ObjectDataSource odsGvById
    {
        get { return odsgvPla_Tarea_GetById; }
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
                Gv.DataSourceID = odsGv.ID;
                break;
			case "Nombre":
                Gv.DataSourceID = "odsgvPla_Tarea_GetByPla_Cta_IdLikeNombre";
                break;
			}
        Gv.DataBind();
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
            var fvs = (Koala.KoalaWebControls.FormViewSetim)sender;
            fvs.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGV(Gv, tbFiltroId.Text);
            Gv.DataBind();
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
            var fvs = (Koala.KoalaWebControls.FormViewSetim)sender;
            fvs.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            SeleccionarFilaEnGV(Gv, tbFiltroId.Text);
            Gv.DataBind();
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
        if (Gv.Rows.Count == 0)
            Fv.ChangeMode(FormViewMode.Insert);
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
                noPagina = pos / Gv.PageSize;
                noFila = pos - noPagina * Gv.PageSize;
            }
        }
        Gv.PageIndex = noPagina;
        Gv.SelectedIndex = noFila;
    }

    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Cta_PreRender(object sender, EventArgs e)
    {
        switch (Fv.CurrentMode)
        {
            case FormViewMode.Insert:
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
        // Inicializa el control 
    }
}
