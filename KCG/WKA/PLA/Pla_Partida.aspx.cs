﻿using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Configuration;

public partial class PLA_Pla_Partida : PaginaBase
{
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Referencias a los objetos de pantalla
    #region Referencias a los objetos de pantalla
    protected override string Contenedor
    {
        get { return "Partidas Presup."; }
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
                gvPla_Partida.DataSourceID = odsgvPla_Partida.ID;
                tbFiltro.Text = "";
                break;
            case "Codigo":
                gvPla_Partida.DataSourceID = "odsgvPla_Partida_ByCodigo";
                break;
            case "Nombre":
                gvPla_Partida.DataSourceID = "odsgvPla_Partida_ByNombre";
                break;
        }
        gvPla_Partida.DataBind();
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

    // Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVPla_Doc(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvPla_Partida.DataSourceObject;
            List<Pla_Partida> lista = (List<Pla_Partida>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvPla_Partida.PageSize;
                noFila = pos - noPagina * gvPla_Partida.PageSize;
            }
        }
        gvPla_Partida.PageIndex = noPagina;
        gvPla_Partida.SelectedIndex = noFila;
    }

    // Eventos para despues de FormView
    #region Eventos para despues de FormView
    protected void fvPla_Pardida_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            fvPla_Pardida.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
            if (lbFvMsgError.Text == ":") lbFiltro.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVPla_Doc(gvPla_Partida, tbFiltroId.Text);
            gvPla_Partida.DataBind();
        }
    }
    protected void fvPla_Pardida_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            if (lbFvMsgError.Text == ":") lbFiltro.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvPla_Pardida_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            fvPla_Pardida.HayErrorInsUpd = true;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            if (lbFvMsgError.Text == ":") lbFiltro.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVPla_Doc(gvPla_Partida, tbFiltroId.Text);
            gvPla_Partida.DataBind();
        }
    }
    #endregion
    // Eventos para despues del ObjectDataSource del FormView
    #region Eventos para despues del ObjectDataSource del FormView
    protected void odsfvPla_Partida_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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
            AsignarMensaje("Registro Insertado.", bien);
        }
    }
    protected void odsfvPla_Partida_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void odsfvPla_Partida_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void fvPla_Pardida_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
    }
    #endregion

    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Partida_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgError.Text = ":";
        lbFvMsgInfo.Text = ">";
    }
    protected void btReporte_Click(object sender, EventArgs e)
    {
        string sAnio = ddlFiltroAnio.SelectedValue;
        if (Session["Scope"] == null) Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                + "PLA/PLA_Poa_Partidas.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&v_Anio={0}", sAnio),
                                "_blank", "scrollbars=yes, resizable=yes");      
    }
}