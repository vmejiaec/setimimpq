﻿using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;

public partial class PLA_Pla_Cta_Lista : PaginaBase
{
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    // Referencias a los objetos de pantalla
    #region Referencias a los objetos de pantalla
    protected override string Contenedor
    {
        get { return "Pla_Cta_Partida"; }
    }
    protected override GridView Gv
    {
        get { return gvPla_Partida; }
    }
    protected override FormView Fv
    {
        get { return fvPla_Pardida; }
    }
    protected override ObjectDataSource odsGv
    {
        get { return odsgvPla_Partida; }
    }
    protected override ObjectDataSource odsFv
    {
        get { return odsfvPla_Partida; }
    }
    protected override ObjectDataSource odsGvById
    {
        get { return odsgvPla_Partida_ById; }
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
                tbFiltro.Text = "";
                break;
            case "Codigo":
                Gv.DataSourceID = "odsgvPla_Partida_ByCodigo";
                break;
            case "Nombre":
                Gv.DataSourceID = "odsgvPla_Partida_ByNombre";
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
    protected void fvPla_Pardida_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
            Gv.DataSourceID = odsGvById.ID;
            Gv.DataBind();
            Gv.SelectedIndex = 0;
            tbFiltro.Text = "";
        }
    }
    protected void fvPla_Pardida_ItemDeleted(object sender, FormViewDeletedEventArgs e)
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
    protected void fvPla_Pardida_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
            Gv.DataSourceID = odsGvById.ID;
            Gv.DataBind();
            Gv.SelectedIndex = 0;
            tbFiltro.Text = "";
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
            AsignarMensaje("Registro Insertado.",bien);
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
}