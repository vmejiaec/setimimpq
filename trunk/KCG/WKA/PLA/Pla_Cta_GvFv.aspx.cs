// NUEVO aumentar plantilla nuevos usings
using System;
using FEL.PLA;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;

public partial class PLA_Pla_Cta_GvFv : PaginaBase
{
    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    // Referencias a los objetos de pantalla
    #region Referencias a los objetos de pantalla
    protected override string Contenedor
    {
        get { return "PLA_Pla_Cta_GvFv"; }
    }
    protected override GridView Gv
    {
        get { return gvPla_Cta; }
    }
    protected override FormView Fv
    {
        get { return fvPla_Cta; }
    }
    protected override ObjectDataSource odsGv
    {
        get { return odsgvPla_Cta_GetByAnio; }
    }
    protected override ObjectDataSource odsFv
    {
        get { return odsfvPla_Cta; }
    }
    protected override ObjectDataSource odsGvById
    {
        get { return odsgvPla_Cta_GetById; }
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
			case "Codigo":
                Gv.DataSourceID = "odsgvPla_Cta_GetByAnioLikeCodigo";
                break;
			case "Nombre":
                Gv.DataSourceID = "odsgvPla_Cta_GetByAnioLikeNombre";
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
    protected void fvPla_Cta_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void fvPla_Cta_ItemDeleted(object sender, FormViewDeletedEventArgs e)
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
    protected void fvPla_Cta_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void odsfvPla_Cta_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void odsfvPla_Cta_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void odsfvPla_Cta_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
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
    protected void fvPla_Cta_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        if (String.IsNullOrWhiteSpace((string)e.Values["Estado"])) e.Values["Estado"] = "PEN";
    }
    #endregion

    // Evento cuando se selecciona una fila del Grid
    protected void gvPla_Cta_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbFvMsgError.Text = ":";
        lbFvMsgInfo.Text = ">";
    }
    // Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvPla_Cta_DataBound(object sender, EventArgs e)
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
            List<Pla_Cta> lista = (List<Pla_Cta>)ods.Select();
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
    // NUEVO 
    // Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvPla_Cta_PreRender(object sender, EventArgs e)
    {
        switch (Fv.CurrentMode)
        {
            case FormViewMode.Insert:
                TextBox anio = (TextBox)Fv.FindControl("AnioTextBox");
                anio.Text = ddlFiltroAnio.SelectedValue;
                anio.ReadOnly = true;
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }

    // NUEVO inicializar controles aumentar a la plantilla
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa el control de Años
        FEL.DIC.BO_Dic_Dominio adpDom = new FEL.DIC.BO_Dic_Dominio();
        var anios = adpDom.GetByObjetoCampo("Nombre", Scope, "Pla_Cta", "Anio");
        foreach (var anio in anios)
            ddlFiltroAnio.Items.Add(new ListItem(anio.Nombre));
    }

}
