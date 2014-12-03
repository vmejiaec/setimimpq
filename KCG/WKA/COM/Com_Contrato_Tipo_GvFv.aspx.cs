using System;
using FEL.COM;
using System.Web.UI.WebControls;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

public partial class COM_Com_Contrato_Tipo_GvFv : PaginaBase
{
    // Nombre del contenedor
    protected override string Contenedor
    {
        get { return "PLA_Com_Contrato_Tipo_GvFv"; }
    }
	// Inicializar controles al arranque de la página
    protected void Page_Init(object sender, EventArgs e)
    {
        // Inicializa el control 
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
                gvCom_Contrato_Tipo.DataSourceID = odsgvCom_Contrato_Tipo.ID;
                break;
			case "Nombre":
                gvCom_Contrato_Tipo.DataSourceID = odsgvCom_Contrato_Tipo_GetByLikeNombre.ID;
                break;
			}
        gvCom_Contrato_Tipo.DataBind();
        // Si existe algún error en el FormView lo borra
        lbFvMsgErrorCom_Contrato_Tipo.Text = ":";
        lbFvMsgInfoCom_Contrato_Tipo.Text = "> Filtrado";
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

	#region Eventos del GridView de Com_Contrato_Tipo
    // Evento se dispara cuando se selecciona una fila del GridView
    protected void gvCom_Contrato_Tipo_SelectedIndexChanged(object sender, EventArgs e)
    {
		// Si el usuario selecciona una fila, pone el FormView en ReadOnly
        if (fvCom_Contrato_Tipo.CurrentMode != FormViewMode.ReadOnly)
                fvCom_Contrato_Tipo.ChangeMode(FormViewMode.ReadOnly);
        // Mensaje
        lbFvMsgErrorCom_Contrato_Tipo.Text = ":";
        lbFvMsgInfoCom_Contrato_Tipo.Text = "> Com_Contrato_Tipo Seleccionado";
    }
	// Busca y selecciona la fila indicada en el GridView
    protected void SeleccionarFilaEnGVCom_Contrato_Tipo(GridView gv, string txtId)
    {
        int noPagina = 0;
        int noFila = 0;
        if (!String.IsNullOrEmpty(txtId))
        {
            int nFiltroId = Convert.ToInt32(txtId);
            var ods = (ObjectDataSource)gvCom_Contrato_Tipo.DataSourceObject;
            List<Com_Contrato_Tipo> lista = (List<Com_Contrato_Tipo>)ods.Select();
            int pos = lista.FindIndex(o => o.Id == nFiltroId);
            if (pos >= 0)
            {
                noPagina = pos / gvCom_Contrato_Tipo.PageSize;
                noFila = pos - noPagina * gvCom_Contrato_Tipo.PageSize;
            }
        }
        gvCom_Contrato_Tipo.PageIndex = noPagina;
        gvCom_Contrato_Tipo.SelectedIndex = noFila;
    }
	#endregion
	// Eventos para el FormView de Com_Contrato_Tipo
    #region Eventos el FormView de Com_Contrato_Tipo
    protected void fvCom_Contrato_Tipo_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
			if (lbFvMsgErrorCom_Contrato_Tipo.Text == ":") lbFvMsgErrorCom_Contrato_Tipo.Text = e.Exception.Message;
        }
        else
        {
            tbFiltroId.Text = (string)e.NewValues["Id"];
            SeleccionarFilaEnGVCom_Contrato_Tipo(gvCom_Contrato_Tipo, tbFiltroId.Text);
            gvCom_Contrato_Tipo.DataBind();
        }
    }
    protected void fvCom_Contrato_Tipo_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
			if (lbFvMsgErrorCom_Contrato_Tipo.Text == ":") lbFvMsgErrorCom_Contrato_Tipo.Text = e.Exception.Message;
        }
        else
        {
            Filtrar();
        }
    }
    protected void fvCom_Contrato_Tipo_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
			if (lbFvMsgErrorCom_Contrato_Tipo.Text == ":") lbFvMsgErrorCom_Contrato_Tipo.Text = e.Exception.Message;
        }
        else
        {
            SeleccionarFilaEnGVCom_Contrato_Tipo(gvCom_Contrato_Tipo, tbFiltroId.Text);
            gvCom_Contrato_Tipo.DataBind();
        }
    }
    protected void fvCom_Contrato_Tipo_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        // Gestión del archivo si se ha seleccionado
        string Dir_COM_Uploads = ConfigurationManager.AppSettings["Dir_COM_Uploads"];
        FileUpload ful = (FileUpload)fvCom_Contrato_Tipo.FindControl("fulSubirWord");
        if (ful.HasFile)
        {
            Regex reg = new Regex("[^a-zA-Z0-9. ]");
            string fileNameSinAcentos = reg.Replace(ful.FileName, "");
            string fileName = Server.HtmlEncode(fileNameSinAcentos);
            string fileNameNormalizado = fileName.Normalize(NormalizationForm.FormD);

            string extension = System.IO.Path.GetExtension(fileNameNormalizado);
            if ((extension == ".doc") || (extension == ".docx"))
            {
                string serverPath = Server.MapPath(Dir_COM_Uploads);
                string savePath = serverPath + fileNameNormalizado;
                ful.SaveAs(savePath);
                e.Values["URL_Plantilla_Word"] = fileNameNormalizado;
            }
        }
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }	
    protected void fvCom_Contrato_Tipo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        // Gestión del archivo si se ha seleccionado
        string Dir_COM_Uploads = ConfigurationManager.AppSettings["Dir_COM_Uploads"];
        FileUpload ful = (FileUpload)fvCom_Contrato_Tipo.FindControl("fulSubirWord");
        if (ful.HasFile)
        {
            Regex reg = new Regex("[^a-zA-Z0-9. ]");
            string fileNameSinAcentos = reg.Replace(ful.FileName, "");
            string fileName = Server.HtmlEncode(fileNameSinAcentos);
            string fileNameNormalizado = fileName.Normalize(NormalizationForm.FormD);

            string extension = System.IO.Path.GetExtension(fileNameNormalizado);
            if ((extension == ".doc") || (extension == ".docx"))
            {
                string serverPath = Server.MapPath(Dir_COM_Uploads);
                string savePath = serverPath + fileNameNormalizado;
                ful.SaveAs(savePath);
                e.NewValues["URL_Plantilla_Word"] = fileNameNormalizado;
            }
        }
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.NewValues["Id"], e.NewValues["Codigo"]) ;
    }
    protected void fvCom_Contrato_Tipo_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        // Cambio del formato de los campos que empiezan con Valor y Fecha
		// Guarda los datos del registro en memoria
        this.MemoriaRegistroActual = String.Format( "Id: {0} * Código: {1}.", e.Values["Id"], e.Values["Codigo"]) ;
    }
	// Inicializa los valores antes de que el FormView se dibuje en la página
    protected void fvCom_Contrato_Tipo_PreRender(object sender, EventArgs e)
    {
        switch (fvCom_Contrato_Tipo.CurrentMode)
        {
            case FormViewMode.Insert:			
                //((TextBox)fvPla_Poa.FindControl("CodigoTextBox")).Text = "1";
                //((TextBox)fvPla_Poa.FindControl("EstadoTextBox")).Text = "PEN";
                break;
            case FormViewMode.Edit:
                break;
            case FormViewMode.ReadOnly:
                break;
        }
    }
	// Si no hay filas en el GridView entonces el FormView cambia a modo Insert
    protected void fvCom_Contrato_Tipo_DataBound(object sender, EventArgs e)
    {
        if (gvCom_Contrato_Tipo.Rows.Count == 0)
            fvCom_Contrato_Tipo.ChangeMode(FormViewMode.Insert);

        if (fvCom_Contrato_Tipo.CurrentMode == FormViewMode.Edit)
        {
            Button UpdateButton = (Button)fvCom_Contrato_Tipo.FindControl("UpdateButton");
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(UpdateButton);
        }
        if (fvCom_Contrato_Tipo.CurrentMode == FormViewMode.Insert)
        {
            Button InsertButton = (Button)fvCom_Contrato_Tipo.FindControl("InsertButton");
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(InsertButton);
        }
        if (fvCom_Contrato_Tipo.CurrentMode == FormViewMode.ReadOnly)
        {
            Button btDescargar = (Button)fvCom_Contrato_Tipo.FindControl("btDescargar");
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(btDescargar);
        }
        
    }
	#endregion
	// Eventos para el ObjectDataSource
    #region Eventos para el ObjectDataSource
    protected void odsfvCom_Contrato_Tipo_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            tbFiltroId.Text = e.ReturnValue.ToString();
            lbFvMsgInfoCom_Contrato_Tipo.Text = "Com_Contrato_Tipo Registro Insertado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Insertado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Tipo_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Tipo.Text = "Com_Contrato_Tipo Registro Actualizado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Actualizado. " + this.MemoriaRegistroActual, bien);
        }
    }
    protected void odsfvCom_Contrato_Tipo_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;
            string errorResumen = ExtraeMensajeResumen(ex);
            lbFvMsgErrorCom_Contrato_Tipo.Text = errorResumen;
            AsignarMensaje(ex.Message, mal);
        }
        else
        {
            lbFvMsgInfoCom_Contrato_Tipo.Text = "Com_Contrato_Tipo Registro Borrado. " + this.MemoriaRegistroActual;
            AsignarMensaje("Registro Borrado. " + this.MemoriaRegistroActual, bien);
        }
    }	
	#endregion
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------



    protected void btDescargar_Click(object sender, EventArgs e)
    {
        TextBox URL_Plantilla_WordTextBox = (TextBox)fvCom_Contrato_Tipo.FindControl("URL_Plantilla_WordTextBox");
        string archivoNombre = URL_Plantilla_WordTextBox.Text;
        string Dir_COM_Uploads = ConfigurationManager.AppSettings["Dir_COM_Uploads"];
        string serverPath = Server.MapPath(Dir_COM_Uploads);
        string filepath = serverPath + archivoNombre;
        if (File.Exists(filepath))
        {
            HttpContext.Current.Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            HttpContext.Current.Response.ContentType = "application/octet-stream";
            HttpContext.Current.Response.AppendHeader("content-disposition", "attachment;filename=\"" + Path.GetFileName(filepath) + "\"");
            HttpContext.Current.Response.AppendHeader("content-length", new FileInfo(filepath).Length.ToString());

            HttpContext.Current.Response.WriteFile(filepath);

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.Close();
            Response.End();
        }

    }
}
