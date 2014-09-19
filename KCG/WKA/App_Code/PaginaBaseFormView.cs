using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Reflection;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using HER;


public abstract class PaginaBaseFormView : KPagina
{
    #region Atributos

    protected Color bien = Color.WhiteSmoke;
    protected Color mal = Color.WhiteSmoke;
    private bool redirecionado = false;
    private int filasAfectadas;  // Para almacenar el número de registros actualizados o borrados

    protected ZoomManager zoomManager;

    protected abstract Type TipoObjeto { get; }
    protected abstract FormView Fv { get; }
    protected abstract ObjectDataSource OdsDv { get; }
    protected abstract string Contenedor { get; }

    //private Dictionary<string, string> parametros = new Dictionary<string, string>();
    List<DictionaryEntry> paramInsertNoRealizado = new List<DictionaryEntry>();
    List<DictionaryEntry> paramUpdateNoRealizado = new List<DictionaryEntry>();
    List<DictionaryEntry> paramFijosDeInsercion = new List<DictionaryEntry>(); 
    
    /*protected Dictionary<string, string> Parametros
    {
        get{return parametros;}
    }*/

    #endregion

    #region Inicializa página
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (Session["Scope"] == null)
    //        Response.Redirect("~/PAS/PAR_ACCESO.aspx");
    //    Scope s = (Scope)Session["Scope"];
    //    VerificarModoZoom();
    //    if (!IsPostBack)
    //    {
    //        AsignarContenedorAScope();
    //        s.Dic_Contenedor_Nombre = this.Contenedor;
    //    }
    //}

    protected override void OnLoad(EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        VerificarModoZoom();
        if (!IsPostBack)
        {
            AsignarContenedorAScope();
        }
        base.OnLoad(e);
    }
    protected override void OnInit(EventArgs e)
    {
        OdsDv.Updating += OdsDv_Updating;
        OdsDv.Inserting += OdsDv_Inserting;
        OdsDv.Deleting += OdsDv_Deleting;
        OdsDv.Inserted += OdsDv_Inserted;
        OdsDv.Deleted += OdsDv_Deleted;
        OdsDv.Updated += OdsDv_Updated;

        Fv.ItemCommand += Fv_ItemCommand;
        Fv.DataBound += Fv_DataBound;
        Fv.ItemUpdated += Fv_ItemUpdated;
        Fv.ItemInserted += Fv_ItemInserted;
        Fv.ModeChanged += Fv_ModeChanged;

        base.OnInit(e);
    }
    protected override void InitializeCulture()
    {
        if (Session["lenguaje"] != null)
        {
            UICulture = (string)Session["lenguaje"];
        }
        base.InitializeCulture();
    }
    #endregion

    #region FormView
    private void Fv_ModeChanged(object sender, EventArgs e)
    {
        //VerificarCbInsertarMemoria();
    }
    private void Fv_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        /*if (e.Exception != null)
        {
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();
            e.KeepInEditMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.NewValues.Count];
            e.NewValues.CopyTo(parametros, 0);
            paramUpdateNoRealizado.AddRange(parametros);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(e.NewValues["Id"].ToString());
            string mensaje;
            if (filasAfectadas == 0) // Controla que se haya actualizado el registro.
            {
                e.KeepInEditMode = true;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ100RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
            }
            else
            {
                Fv.DefaultMode = FormViewMode.ReadOnly;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);             
            }
        }*/
        if (e.Exception != null)
        {
            // Copia los valores que no se actualizaron 
            e.KeepInEditMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.NewValues.Count];
            e.NewValues.CopyTo(parametros, 0);
            paramUpdateNoRealizado.AddRange(parametros);
            // Mensaje de error
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(e.NewValues["Id"].ToString());
            string mensaje;
            if (filasAfectadas == 0) // Controla que se haya actualizado el registro.
            {
                e.KeepInEditMode = true;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ100RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
            }
            else
            {
                Fv.DefaultMode = FormViewMode.ReadOnly;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
                //Invalida cahe de los listados del objeto
                //InvalidarCache();
            }
        }
    }
    void Fv_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        /*if (e.Exception != null)
        {
            SoapException ex = (SoapException)e.Exception.InnerException;

            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);

            e.KeepInInsertMode = true;

            DictionaryEntry[] parametros = new DictionaryEntry[e.Values.Count];
            e.Values.CopyTo(parametros, 0);
            paramInsertNoRealizado.AddRange(parametros);

            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }*/
        if (e.Exception != null)
        {
            // Copia los valores no insertados a los campos
            e.KeepInInsertMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.Values.Count];
            e.Values.CopyTo(parametros, 0);
            paramInsertNoRealizado.AddRange(parametros);
            // Mensaje de error
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
    }
    private void Fv_DataBound(object sender, EventArgs e)
    {
        if (redirecionado)
        {
            return;
        }

        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DefinirParametrosFijosDeInsercion(paramFijosDeInsercion);
            if (paramFijosDeInsercion.Count > 0)
                PegarValoresEnControlesOrigen(Fv, paramFijosDeInsercion);
        }

        if (paramUpdateNoRealizado.Count > 0)
        {
            PegarValoresEnControlesOrigen(Fv, paramUpdateNoRealizado);
        }

        if (paramInsertNoRealizado.Count > 0)
        {
            PegarValoresEnControlesOrigen(Fv, paramInsertNoRealizado);
        }



        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            if (Fv.CurrentMode == FormViewMode.Insert &&
                Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath + Request.Url.Query) == FormViewMode.Insert)
            {
                if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria == false
                    || Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).Parametros.Count > 0)
                {
                    PegarValoresEnControlesOrigen(Fv, Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query));
                    if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria == true)
                    {
                        //if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).ParametrosInsertarConMemoria.Count > 1 )
                        Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).Parametros.Clear();
                    }
                }
                else
                {
                    PegarValoresEnControlesOrigen(Fv,
                                                  Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).
                                                      ParametrosInsertarConMemoria);
                    //return;
                }
            }

            else if (Fv.CurrentMode == FormViewMode.Edit &&
                     Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath + Request.Url.Query) == FormViewMode.Edit)
            {
                PegarValoresEnControlesOrigen(Fv, Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query));
            }

            if (!Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria)
                Zoom.RemoverRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
        }


    }
    private void Fv_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Zoom")
        {
            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
                Zoom.RemoverRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
            Zoom.AgregarRequerimiento(AppRelativeVirtualPath + Request.Url.Query, 
                                      Fv.CurrentMode, 
                                      e.CommandArgument.ToString());
            switch (Fv.CurrentMode)
            {
                case FormViewMode.Insert:
                    Fv.InsertItem(false);
                    AsignarParametrosDataSourceDeatailsView(null);
                    break;
                case FormViewMode.Edit:
                    Fv.UpdateItem(false);
                    break;
                case FormViewMode.ReadOnly:
                    List<DictionaryEntry> parametros = 
                        Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
                    Dictionary<string, string> param =
                        ZoomManager.ObtenerParametros(e.CommandArgument.ToString(), new char[] {';', ':'}, true);
                    parametros.Add(
                        new DictionaryEntry(param["FILTRO"],
                                            Navegacion.ObtenerValorControl(Fv.FindControl(param["FILTRO"]))));
                    parametros.Add(new DictionaryEntry("Id", Navegacion.ObtenerValorControl(Fv.FindControl("Id"))));
                    break;
            }
            string rutaDestino = Zoom.ObtenerRutaDestino(AppRelativeVirtualPath + Request.Url.Query);
            redirecionado = true;
            Response.Redirect(rutaDestino);
        }
    }    
    #endregion

    #region Object Data Source
    private void OdsDv_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            filasAfectadas = 0;
        else
            filasAfectadas = (int)e.ReturnValue;

        if (e.Exception != null)
        {
            //string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();

            ////AsignarMensaje(e.Exception.InnerException.Message, mal);
            //AsignarMensaje(mensaje, mal);
            //e.ExceptionHandled = true;
            //esto cambio
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            Fv.ChangeMode(FormViewMode.Insert);
            //Gv.SelectedIndex = -1;
            Fv.DefaultMode = FormViewMode.Insert;
            if (filasAfectadas == 0)
            {
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ100RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
            }
            else
            {
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
                InvalidarCache();
            }
        }
    }
    private void OdsDv_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
        e.InputParameters.CopyTo(parametros, 0);
        List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
        parametrosList.AddRange(parametros);
        e.InputParameters.Clear();
        //cambio
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        e.InputParameters.Add("s", Session["Scope"]);
        e.InputParameters.Add("parametros", parametrosList);
    }
    private void OdsDv_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            /*string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ14RecursoKCG.Text").ToString();
            //AsignarMensaje(e.Exception.InnerException.Message, mal);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;*/
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(Convert.ToString(e.ReturnValue));
            //SeleccionarItemGridView(e.ReturnValue);
            Fv.DefaultMode = FormViewMode.ReadOnly;
            Fv.ChangeMode(FormViewMode.ReadOnly);
            //VerificarBotonResponderZoom();
            //VerificarCbInsertarMemoria();
            string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
            AsignarMensaje(mensaje, bien);
            InvalidarCache();
        }
    }
    private void OdsDv_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
        e.InputParameters.CopyTo(parametros, 0);
        e.InputParameters.Clear();

        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria
                && Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).ParametrosInsertarConMemoria.Count > 0)
            {
                List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
                parametrosList.AddRange(parametros);
                e.InputParameters.Add("parametros", parametrosList);
                //cambio
                if (Session["Scope"] == null)
                    Response.Redirect("~/PAS/PAR_ACCESO.aspx");
                e.InputParameters.Add("s", Session["Scope"]);
            }
            else
            {
                List<DictionaryEntry> parametrosList =
                    Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
                parametrosList.AddRange(parametros);
                e.Cancel = true;
            }
        }
        else
        {
            List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
            parametrosList.AddRange(parametros);
            e.InputParameters.Add("parametros", parametrosList);
            //cambio
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            e.InputParameters.Add("s", Session["Scope"]);
        }
    }
    protected void OdsDv_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
            e.InputParameters.CopyTo(parametros, 0);
            e.InputParameters.Clear();
            List<DictionaryEntry> parametrosList = Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
            parametrosList.AddRange(parametros);

            for (int i = 0; i < parametrosList.Count; i++)
            {
                string nombreParametro = "";
                nombreParametro = parametrosList[i].Key.ToString();
                if (nombreParametro.Contains("original"))
                {
                    parametrosList.RemoveAt(i);
                    i--;
                }
            }

            e.Cancel = true;
        }
        else
        {
            DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
            e.InputParameters.CopyTo(parametros, 0);
            e.InputParameters.Clear();
            List<DictionaryEntry> parametrosList = new List<DictionaryEntry>();
            parametrosList.AddRange(parametros);
            //cambio
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            e.InputParameters.Add("s", Session["Scope"]);
            e.InputParameters.Add("parametros", parametrosList);
        }
        Fv.DefaultMode = FormViewMode.Edit;
    }
    private void OdsDv_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            filasAfectadas = 0;
        else
            filasAfectadas = (int)e.ReturnValue;
    }
    #endregion

    #region Utilitarios
    protected ZoomManager Zoom
    {
        get
        {
            if (zoomManager == null && Session["Zoom"] == null)
            {
                zoomManager = new ZoomManager();
                Session["Zoom"] = zoomManager;
            }

            else if (zoomManager == null && Session["Zoom"] != null)
            {
                zoomManager = (ZoomManager)Session["Zoom"];
            }

            else if (zoomManager != null && Session["Zoom"] == null)
            {
                Session["Zoom"] = zoomManager;
            }

            return zoomManager;
        }
    }
    protected void VerificarModoZoom()
    {
        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            switch (Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath + Request.Url.Query))
            {
                case FormViewMode.Insert:
                    Fv.ChangeMode(FormViewMode.Insert);
                    break;
                case FormViewMode.Edit:
                    Fv.ChangeMode(FormViewMode.Edit);
                    AsignarParametrosDataSourceDeatailsView(Zoom.ObtenerIdDeParametros(AppRelativeVirtualPath + Request.Url.Query));
                    break;
                case FormViewMode.ReadOnly:
                    Fv.ChangeMode(FormViewMode.ReadOnly);
                    AsignarParametrosDataSourceDeatailsView(Zoom.ObtenerIdDeParametros(AppRelativeVirtualPath + Request.Url.Query));
                    break;
            }
        }
    }
    string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
        }
        string pre_mensaje =
            HttpContext.
                GetLocalResourceObject("~/KOALA.master",
                                        CodigoError + "RecursoKCG.Text").ToString();
        pre_mensaje = string.Format(pre_mensaje, MensajeError);
        return pre_mensaje;
    }
    protected virtual void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {

    }
    private void PegarValoresEnControlesOrigen(Control contenedor, List<DictionaryEntry> parametros)
    {
        for (int i = 0; i < parametros.Count; i++)
        {
            if (parametros[i].Value != null)
            {
                Navegacion.AsignarValorDeControl(
                    contenedor.FindControl(parametros[i].Key.ToString()),
                    parametros[i].Value.ToString());
            }
        }
    }
    
    private List<DictionaryEntry> CopiarValoresDeControles(Control contenedor, Type tipoObjeto)
    {
        PropertyInfo[] propiedades = tipoObjeto.GetProperties();
        List<DictionaryEntry> parametros = new List<DictionaryEntry>(propiedades.Length);
        foreach (PropertyInfo propiedad in propiedades)
        {
            string valor = Navegacion.ObtenerValorControl(contenedor.FindControl(propiedad.Name));
            parametros.Add(new DictionaryEntry(propiedad.Name, valor));
        }
        return parametros;
    }
    
    //adicional
    protected void CopiarValoresDeControles_Insert(Control contenedor, Type tipoObjeto)
    {
        PropertyInfo[] propiedades = tipoObjeto.GetProperties();
        List<DictionaryEntry> parametros = new List<DictionaryEntry>(propiedades.Length);
        foreach (PropertyInfo propiedad in propiedades)
        {
            string valor = Navegacion.ObtenerValorControl(contenedor.FindControl(propiedad.Name));
            parametros.Add(new DictionaryEntry(propiedad.Name, valor));
        }
        paramFijosDeInsercion = parametros;
    }

    protected void AsignarContenedorAScope()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        s.Dic_Contenedor_Nombre = Contenedor;
    }
    protected void AsignarMensaje(string mensaje, Color color)
    {
        ((Label)Master.FindControl("LabelError")).Text = mensaje;
        ((Label)Master.FindControl("LabelError")).Visible = true;
        ((Label)Master.FindControl("LabelError")).ForeColor = color;
    }
    virtual protected void AsignarParametrosDataSourceDeatailsView(string id)
    {
        OdsDv.SelectParameters["Id"].DefaultValue = id;
    }

    virtual protected void InvalidarCache()
    {
        if (Cache[TipoObjeto.Name] != null)
        {
            Cache[TipoObjeto.Name] = new object();
        }
    }

    protected void SeleccionarItemEnCarga(string indiceSeleccionQuery)
    {
        if (!IsPostBack)
        {
            string idSeleccion = null;
            if (!string.IsNullOrEmpty(indiceSeleccionQuery))
                idSeleccion = Request.QueryString[indiceSeleccionQuery];

            if (!string.IsNullOrEmpty(idSeleccion))
            {
                AsignarParametrosDataSourceDeatailsView(idSeleccion);
                Fv.DefaultMode = FormViewMode.ReadOnly;
            }
        }
    }

    #endregion
}
