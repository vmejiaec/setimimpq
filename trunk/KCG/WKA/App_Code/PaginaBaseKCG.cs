/*
KOALA SOLUTION 
 
PaginaBaseKCG     - Página base de pantallas Grid + FormView
ver 2.0

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: KoalaFramework Asp.Net              
							
NOTAS DE DISEÑO
 * Versiones anteriores
   - 
 * Version 2.0
   - Las pantallas que en Dic_Contenedor tengan el campo
     Filtro = "S" deben presentar el filtro sin hacer la consulta
     Get del Grid.
   - Si un ods para grid se configura cache, debe ponerse la propiedad
     CacheKeyDependency.
   - La actualización de cache se maneja por el clic de un boton
     y de su indice en Cache (CacheKeyDependency).
  
HISTORIA     					 
 * Versiones anteriores
   - 
 * Version 2.0
   - Presentación de filtro en el inicio (Dic_Contenedor, Filtro = "S")
   - Manejo de cache.
   - Manejo de [%] como simbolo para filtrado de Zoom.
   - Se quito propiedad "parametros" por obsolteta.

TRABAJO FUTURO
   - 

ÚLTIMA FECHA DE MODIFICACIÓN
03-07-2008 15H33

*/
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using FEL.DIC;
using HER;
using Koala.KoalaWebControls;
using System.Collections.Specialized;

public abstract class PaginaBaseKCG : KPagina
{
    #region Atributos
    protected Color bien = Color.WhiteSmoke;
    //private bool CbInsertarMemoriaChecked;
    private int filasAfectadas;  // Para almacenar el número de registros actualizados o borrados
    protected Color mal = Color.WhiteSmoke;
    //private bool redirecionado = false;
    protected ZoomManager zoomManager;
    protected bool aplicarFiltrosFijos;

    protected abstract CheckBox CbInsertarMemoria { get; }
    protected abstract Type TipoObjeto { get; }
    protected abstract GridView Gv { get; }
    protected abstract FormView Fv { get; }
    protected abstract ObjectDataSource OdsGv { get; }
    protected abstract ObjectDataSource OdsDv { get; }
    protected abstract Button BResponderZoom { get; }
    protected abstract Button BRegreso { get; }
    protected abstract KFiltro KftFiltro { get; }
    protected abstract string Contenedor { get; }

    //private Dictionary<string, string> parametros = new Dictionary<string, string>();
    List<DictionaryEntry> paramFijosDeInsercion = new List<DictionaryEntry>();
    List<DictionaryEntry> paramInsertNoRealizado = new List<DictionaryEntry>();
    List<DictionaryEntry> paramUpdateNoRealizado = new List<DictionaryEntry>();
    /*protected Dictionary<string, string> Parametros
        {get{return parametros;}}*/

    protected virtual Button RefrescarCache
    {
        get { return null; }
    }

    public bool MostrarFiltro
    {
        get { return ConsultarMostrarFiltro(); }
    }

    #endregion

    #region Funciones para manejar eventos de KFiltro
        #region KftFiltro_MedatosConsultados
        void KftFiltro_MedatosConsultados(object sender, KControlEventArgs e)
        {
            if (e.Excepcion != null)
            {
                e.ExcepcionManejada = true;
            }
        }
        #endregion
        #region KftFiltro_ErrorEncontrado
        // V 1.7
        // Función para manejar el error al insertar
        // en Par_Filtro dentro del objeto KFiltro
        void KftFiltro_ErrorEncontrado(object sender, KControlEventArgs e)
        {
            if (e.Excepcion != null)
            {
                SoapException ex = (SoapException)e.Excepcion;
                string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
                AsignarMensaje(mensaje, mal);
                Exception exe = new Exception(mensaje);
                throw exe;
            }
        }
        #endregion
    #endregion

    #region Inicializa página
    protected override void OnLoad(EventArgs e) //Page_Load(object sender, EventArgs e)
    {
        //Scope s = (Scope)Session["Scope"];

        VerificarModoZoom();

        if (KftFiltro != null)
        {
            VerificarFiltroZoom();
            PrecisarValoresDeFiltradoFijo(KftFiltro.ParametrosFiltro);
            KftFiltro.AplicarFiltro();
            if (MostrarFiltro)
            {
                KftFiltro.Mostrar();
            }
        }

        VerificarBotonRegreso();
        VerificarBotonResponderZoom();
        VerificarCbInsertarMemoria();
        AsignarTextosBotones();

        if (!IsPostBack)
        {
            AsignarContenedorAScope();
            EtiquetarBotonRefrescarCache();
        }
        IniciarCache();
        base.OnLoad(e);
    }

    protected void IniciarCache()
    {
        if (!string.IsNullOrEmpty(OdsGv.CacheKeyDependency))
        {
            if (Cache[OdsGv.CacheKeyDependency] == null)
            {
                Cache[OdsGv.CacheKeyDependency] = new object();
            }
        }
    }
    protected override void OnInit(EventArgs e)
    {
        Gv.SelectedIndexChanged += Gv_SelectedIndexChanged;
        Gv.Sorted += Gv_Sorted;
        Gv.DataBound += new EventHandler(Gv_DataBound);

        OdsDv.Updating += OdsDv_Updating;
        OdsDv.Inserting += OdsDv_Inserting;
        OdsDv.Deleting += OdsDv_Deleting;
        OdsDv.Inserted += OdsDv_Inserted;
        OdsDv.Deleted += OdsDv_Deleted;
        OdsDv.Updated += OdsDv_Updated;

        OdsGv.Selecting += new ObjectDataSourceSelectingEventHandler(OdsGv_Selecting);

        if (BResponderZoom != null)
            BResponderZoom.Click += BResponderZoom_Click;

        if (BRegreso != null)
            BRegreso.Click += BRegreso_Click;

        Fv.ItemCommand += Fv_ItemCommand;
        Fv.DataBound += Fv_DataBound;
        Fv.ItemUpdated += Fv_ItemUpdated;
        Fv.ItemInserted += Fv_ItemInserted;
        Fv.ModeChanged += Fv_ModeChanged;

        if (CbInsertarMemoria != null)
            CbInsertarMemoria.CheckedChanged += CbInsertarMemoria_CheckedChanged;

        if (KftFiltro != null)
        {
            KftFiltro.MedatosConsultados += KftFiltro_MedatosConsultados;
            // V 1.6
            // Registro el manejador para tratar el error al insertar 
            // en Par_Filtro dentro del objeto KFiltro
            KftFiltro.ErrorEncontrado += KftFiltro_ErrorEncontrado;
        }

        if (RefrescarCache != null)
        {
            RefrescarCache.Click += new EventHandler(RefrescarCache_Click);
        }

        base.OnInit(e);
    }

    bool _zoomRequeriminetoOrigen = false;

    void Gv_DataBound(object sender, EventArgs e)
    {
        if (!_zoomRequeriminetoOrigen &&
            Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query))
        {
            if (Gv.Rows.Count > 0 && !IsPostBack && Fv.CurrentMode == FormViewMode.Insert)
            {
                Gv.SelectedIndex = 0;
                Fv.ChangeMode(FormViewMode.ReadOnly);
                AsignarParametrosDataSourceDeatailsView(Gv.DataKeys[0].Values["Id"].ToString());
                if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query) &&
                Zoom.ObtenerModoDeRequerimiento(Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query)) != FormViewMode.ReadOnly)
                {
                    BResponderZoom.Visible = true;
                }
            }
        }
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

    #region Form View

    private void Fv_ModeChanged(object sender, EventArgs e)
    {
        VerificarCbInsertarMemoria();
    }

    private void Fv_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            // Coloca los valores no actualizados en la pantalla
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
            SeleccionarItemGridView(e.NewValues["Id"]);
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
        }
    }

    private void Fv_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            // Coloca los valores no insertados en la pantalla            
            e.KeepInInsertMode = true;
            DictionaryEntry[] parametros = new DictionaryEntry[e.Values.Count];
            e.Values.CopyTo(parametros, 0);
            paramInsertNoRealizado.AddRange(parametros);
            // Mensaje de Error
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }

    }

    private void Fv_DataBound(object sender, EventArgs e)
    {
        //se comento esta parte
        //if (redirecionado)
        //{
        //    return;
        //}

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
                        Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).Parametros.Clear();
                    }
                }
                else
                {
                    PegarValoresEnControlesOrigen(Fv,
                                                  Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).
                                                      ParametrosInsertarConMemoria);
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

            Zoom.AgregarRequerimiento(AppRelativeVirtualPath + Request.Url.Query, Fv.CurrentMode, e.CommandArgument.ToString());

            switch (Fv.CurrentMode)
            {
                case FormViewMode.Insert:
                    Fv.InsertItem(false);
                    AsignarParametrosDataSourceDeatailsView(null);
                    if (CbInsertarMemoria != null)
                        zoomManager.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria =
                            CbInsertarMemoria.Checked;
                    break;
                case FormViewMode.Edit:
                    Fv.UpdateItem(false);
                    break;
                case FormViewMode.ReadOnly:
                    List<DictionaryEntry> parametros = Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
                    Dictionary<string, string> param = 
                        ZoomManager.ObtenerParametros(e.CommandArgument.ToString(), new char[] { ';', ':' }, true);
                    parametros.Add(
                        new DictionaryEntry(param["FILTRO"],
                                            Navegacion.ObtenerValorControl(Fv.FindControl(param["FILTRO"]))));
                    parametros.Add(new DictionaryEntry("Id", Navegacion.ObtenerValorControl(Fv.FindControl("Id"))));
                    break;
            }

            string rutaDestino = Zoom.ObtenerRutaDestino(AppRelativeVirtualPath + Request.Url.Query);
            //redirecionado = true;
            Response.Redirect(rutaDestino);
        }
    }
    #endregion

    #region Grid View

    private void Gv_Sorted(object sender, EventArgs e)
    {
        Gv.SelectedIndex = -1;
    }

    protected void Gv_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query) &&
            Zoom.ObtenerModoDeRequerimiento(Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query)) != FormViewMode.ReadOnly)
        {
            BResponderZoom.Visible = true;
        }

        Fv.ChangeMode(FormViewMode.ReadOnly);
        AsignarParametrosDataSourceDeatailsView(Gv.SelectedValue.ToString());
        VerificarCbInsertarMemoria();
    }
    #endregion

    #region Object Data Source
        
    private void OdsDv_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            filasAfectadas = 0;
        else 
            filasAfectadas = (int) e.ReturnValue;

        if (e.Exception != null)
        {
            /*SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            //AsignarMensaje(e.Exception.InnerException.Message, mal);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;*/
            SoapException ex = (SoapException)e.Exception.InnerException;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            e.ExceptionHandled = true;
        }
        else
        {
            Fv.ChangeMode(FormViewMode.Insert);
            Gv.SelectedIndex = -1;
            Fv.DefaultMode = FormViewMode.Insert;
            if(filasAfectadas == 0)
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
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        e.InputParameters.Add("s", Session["Scope"]);
        e.InputParameters.Add("parametros", parametrosList);
    }

    private void OdsDv_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        { 
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(Convert.ToString(e.ReturnValue));
            SeleccionarItemGridView(e.ReturnValue);
            Fv.DefaultMode = FormViewMode.ReadOnly;
            Fv.ChangeMode(FormViewMode.ReadOnly);
            VerificarBotonResponderZoom();
            VerificarCbInsertarMemoria();
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
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            e.InputParameters.Add("s", Session["Scope"]);
            e.InputParameters.Add("parametros", parametrosList);
        }
    }

    private void OdsDv_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.ReturnValue == null)
            filasAfectadas = 0;
        else
            filasAfectadas = (int)e.ReturnValue;
    }

    #endregion

    #region Verificadores
    private void VerificarCbInsertarMemoria()
    {
        if (CbInsertarMemoria == null) return;

        if (Fv.CurrentMode != FormViewMode.Insert)
            CbInsertarMemoria.Visible = false;
        else
        {
            CbInsertarMemoria.Visible = true;
            if (!IsPostBack)
            {
                if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
                {
                    if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria)
                    {
                        CbInsertarMemoria.Checked = true;
                    }
                }
            }
        }
    }

    protected void VerificarBotonResponderZoom()
    {
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query))
        {
            string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query);
            if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query)
                && Zoom.ObtenerModoDeRequerimiento(rutaOrigen) != FormViewMode.ReadOnly
                && Fv.CurrentMode != FormViewMode.Insert)
            {
                BResponderZoom.Visible = true;
            }
        }
    }
    
    protected void VerificarBotonRegreso()
    {
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query))
        {
            BRegreso.Visible = true;
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
                    _zoomRequeriminetoOrigen = true;
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

    protected void VerificarFiltroZoom()
    {
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query))
        {
            Dictionary<string, string> filtro = 
                Zoom.ObtenerFiltroParaDestino(AppRelativeVirtualPath + Request.Url.Query, TipoObjeto.Name);

            if (filtro.Count == 0)
                return;

            string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query);
            if (Zoom.ObtenerModoDeRequerimiento(rutaOrigen) == FormViewMode.ReadOnly)
            {
                if (!IsPostBack)
                {
                    Fv.ChangeMode(FormViewMode.ReadOnly);
                    AsignarParametrosDataSourceDeatailsView(filtro["Id"]);
                }
            }
            else
            {
                if (KftFiltro != null)
                {
                    if (filtro.Count > 0)
                    {
                        List<string> borrarDeFiltrosZoom = new List<string>();

                        foreach (KeyValuePair<string, string> parametro in filtro)
                        {
                            if (KftFiltro.ParametrosFiltro.ContainsKey(parametro.Key))
                            {
                                if (parametro.Key.Contains("Codigo"))
                                {
                                    if (KftFiltro.ParametrosFiltro[parametro.Key].Visible)
                                    {
                                        if (!IsPostBack)
                                        {
                                            KftFiltro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                                parametro.Key, parametro.Value, parametro.Value);
                                            borrarDeFiltrosZoom.Add(parametro.Key);
                                        }
                                    }
                                    else
                                    {
                                        KftFiltro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                            parametro.Key, parametro.Value, parametro.Value);
                                    }
                                }

                                else if (parametro.Key.Contains("Nombre"))
                                {
                                    if (KftFiltro.ParametrosFiltro[parametro.Key].Visible)
                                    {
                                        if (!IsPostBack)
                                        {
                                            KftFiltro.ParametrosFiltro[parametro.Key].
                                                EstablecerValoresDeFiltrado(
                                                parametro.Key, parametro.Value + "[%]");
                                            borrarDeFiltrosZoom.Add(parametro.Key);
                                        }
                                    }
                                    else
                                    {
                                        KftFiltro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                            parametro.Key, parametro.Value + "[%]");
                                    }
                                }
                            }
                        }

                        for (int i = 0; i < borrarDeFiltrosZoom.Count; i++)
                        {
                            filtro.Remove(borrarDeFiltrosZoom[i]);
                        }
                    }
                }
            }
        }
    }

    protected bool VerificarExistenciaParametroFiltrado(string nombreParametro)
    {
        if (OdsGv.FilterParameters.Count == 0)
            return false;
        for (int i = 0; i < OdsGv.FilterParameters.Count; i++)
        {
            if (OdsGv.FilterParameters[i].Name == nombreParametro)
                return true;
        }
        return false;
    }

    #endregion

    #region Controladores de eventos

    protected void KftFiltro_Buscar(object sender, EventArgs e)
    { 
    }

    private void CbInsertarMemoria_CheckedChanged(object sender, EventArgs e)
    {
        if (CbInsertarMemoria.Checked == false)
        {
            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
                Zoom.RemoverRequerimiento(AppRelativeVirtualPath + Request.Url.Query);
        }
        else
        {
            Zoom.AgregarRequerimiento(AppRelativeVirtualPath + Request.Url.Query, Fv.CurrentMode);
            Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).Parametros =
                CopiarValoresDeControles(Fv, TipoObjeto);
            Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath + Request.Url.Query).InsertarConMemoria = true;
        }
    }

    private void BRegreso_Click(object sender, EventArgs e)
    {
        string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query);
        //redirecionado = true;
        Response.Redirect(rutaOrigen);
    }

    private void BResponderZoom_Click(object sender, EventArgs e)
    {
        //KUbicacionUrl rutaOrigen;
        //if(Zoom.ContieneRequerimientoDestino(rutaOrigen.PathCompleto));
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath + Request.Url.Query))
        {
            string id = Navegacion.ObtenerValorControl(Fv.FindControl("Id"));
            string codigo = Navegacion.ObtenerValorControl(Fv.FindControl("Codigo"));
            string nombre = Navegacion.ObtenerValorControl(Fv.FindControl("Nombre"));

            string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath + Request.Url.Query);

            ParametrosZoom parametrosZoom = Zoom.ObtenerParametrosZoom(rutaOrigen);

            List<DictionaryEntry> parametrosOrigen = parametrosZoom.Parametros;

            string nombreObjeto = TipoObjeto.Name.ToUpper();
            //nombreObjeto = nombreObjeto.ToUpper();

            List<DictionaryEntry> memoria = new List<DictionaryEntry>();
            bool insertarConMemoria = parametrosZoom.InsertarConMemoria;

            string alias = parametrosZoom.Alias.ToUpper();

            Dictionary<string, string> parametrosObtener = parametrosZoom.ParametrosObtener;

            for (int i = 0; i < parametrosOrigen.Count; i++)
            {
                string nombreParametro = parametrosOrigen[i].Key.ToString();
                nombreParametro = nombreParametro.ToUpper();
                if (nombreParametro.Contains(nombreObjeto))
                {
                    string parametro = "";

                    if (alias != "")
                    {
                        parametro = nombreParametro.Replace(alias + "_" + nombreObjeto + "_", "");
                    }
                    else
                    {
                        parametro = nombreParametro.Replace(nombreObjeto + "_", "");
                    }

                    switch (parametro)
                    {
                        case "ID":
                            {
                                parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, id);
                                if (insertarConMemoria)
                                    memoria.Add(new DictionaryEntry(parametrosOrigen[i].Key, id));
                                break;
                            }
                        case "CODIGO":
                            {
                                parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, codigo);
                                if (insertarConMemoria)
                                    memoria.Add(new DictionaryEntry(parametrosOrigen[i].Key, codigo));
                                break;
                            }
                        case "NOMBRE":
                            {
                                parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, nombre);
                                if (insertarConMemoria)
                                    memoria.Add(new DictionaryEntry(parametrosOrigen[i].Key, nombre));
                                break;
                            }
                    }
                    continue;
                }

                if (EsParametroFK(parametrosOrigen[i].Key.ToString()))
                {
                    string parametroFK =
                        Navegacion.ObtenerValorControl(Fv.FindControl(parametrosOrigen[i].Key.ToString()));
                    if (parametroFK != null)
                    {
                        if (alias == "")
                        {
                            parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, parametroFK);
                            if (insertarConMemoria)
                                memoria.Add(new DictionaryEntry(parametrosOrigen[i].Key, parametroFK));
                        }
                        else
                        {
                            string parametro = alias + "_" + parametrosOrigen[i].Key;
                            int indiceBusqueda = BuscarParametro(parametro, parametrosOrigen);
                            if (indiceBusqueda != -1)
                                parametrosOrigen[indiceBusqueda] =
                                    new DictionaryEntry(parametrosOrigen[indiceBusqueda].Key, parametroFK);
                        }
                    }
                }

                if (parametrosObtener.ContainsKey(parametrosOrigen[i].Key.ToString()))
                {
                    string parametroOb =
                        Navegacion.ObtenerValorControl(Fv.FindControl(parametrosObtener[parametrosOrigen[i].Key.ToString()]));

                    parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, parametroOb);
                }
            }


            List<string> noGuardar = parametrosZoom.ParametrosEliminar;


            for (int i = 0; i < parametrosOrigen.Count; i++)
            {
                for (int j = 0; j < noGuardar.Count; j++)
                {
                    if (parametrosOrigen[i].Key.ToString() == noGuardar[j])
                    {
                        parametrosOrigen[i] = new DictionaryEntry(parametrosOrigen[i].Key, "");
                        break;
                    }
                }
            }

            parametrosZoom.ParametrosInsertarConMemoria.Clear();
            parametrosZoom.ParametrosInsertarConMemoria = memoria;

            //redirecionado = true;
            AsignarParametrosDataSourceDeatailsView(null);
            Fv.ChangeMode(FormViewMode.Insert);

            Response.Redirect(rutaOrigen);
        }
    }

    protected bool EsParametroFK(string parametro)
    {
        if (parametro == "Id"
                || parametro == "Codigo"
                || parametro == "Nombre"
                || parametro == "Estado"
                || parametro == "Estado_Nombre")
            return false;

        if (parametro.EndsWith("Id")
                || parametro.EndsWith("Codigo")
                || parametro.EndsWith("Nombre")
                || parametro.EndsWith("Estado")
                || parametro.EndsWith("Estado_Nombre"))
            return true;

        return false;
    } 
    #endregion

    private const string _IndiceSessionScope = "Scope";

    protected Scope Scope
    {
        get 
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            return (Scope)Session[_IndiceSessionScope]; 
        }
    }

    private void OdsGv_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.Cancel = MostrarFiltro;
        Scope.Expresion_De_Filtrado = OdsGv.FilterExpression;
    }

    private bool ConsultarMostrarFiltro()
    {
        string pathActual = AppRelativeVirtualPath + Request.Url.Query;
        if (IsPostBack
            ||
            Zoom.ContieneRequerimientoDestino(pathActual) ||
            Zoom.ContieneRequerimientoOrigen(pathActual)
            )
            return false;
        BO_Dic_Contenedor boDicContenedor = new BO_Dic_Contenedor();
        List<Dic_Contenedor> lstContenedor = null;
        try
        {
            lstContenedor = boDicContenedor.GetByNombre("", Scope, Contenedor);
        }
        catch
        {
            return false;
        }

        if (lstContenedor.Count != 1)
            return false;
        string strMostrarFiltro = lstContenedor[0].Filtro;
        bool bolMostrarFiltro = false;
        if (strMostrarFiltro.Trim() == "S")
            bolMostrarFiltro = true;
        return bolMostrarFiltro;
    }

    private void RefrescarCache_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(OdsGv.CacheKeyDependency))
        {
            if (Cache[OdsGv.CacheKeyDependency] != null)
            {
                Cache[OdsGv.CacheKeyDependency] = new object();
                Gv.DataBind();
            }
        }
    }

    # region Invalidar Cache

    virtual protected void InvalidarCache()
    {
        if (Cache[TipoObjeto.Name] != null)
        {
            Cache[TipoObjeto.Name] = new object();
        }
    }

    #endregion

    #region utilitarios
    protected List<DictionaryEntry> CopiarValoresDeControles(Control contenedor, Type tipoObjeto)
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

    virtual protected void PrecisarValoresDeFiltradoFijo(Dictionary<string, KItemFiltro> parametrosFiltrado)
    { 
    }

    protected void AsignarContenedorAScope()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        s.Dic_Contenedor_Nombre = Contenedor;
    }

    private void AsignarTextosBotones()
    {
        if (BRegreso != null)
        {
            BRegreso.Text = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString();
            BRegreso.ToolTip =
                HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString();
            BRegreso.AccessKey =
                HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_AtrasRecursoKCG.AccesKey").ToString();
        }
        if (BResponderZoom != null)
        {
            BResponderZoom.AccessKey =
                HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_SeleccionarRecursoKCG.AccesKey").ToString();
            BResponderZoom.Text =
                HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString();
            BResponderZoom.ToolTip =
                HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString();
        }
    }

    protected void SeleccionarItemGridView(object id)
    {
        DataView lista = (DataView)OdsGv.Select();        
        OrdenarDataView(lista, Gv.SortExpression, Gv.SortDirection);

        if (lista == null) return;

        int iTotal = BuscarObjetoPorID(id, lista);
        int iPagina;
        int iFila;

        if (iTotal != -1)
            CalcularPaginaYFilaDeSeleccion(out iPagina, out iFila, iTotal, Gv.PageSize);
        else
        {
            iPagina = 0;
            iFila = -1;            
        }

        Gv.PageIndex = iPagina;
        Gv.SelectedIndex = iFila;
        Gv.DataBind();
    }

    protected void OrdenarDataView(DataView lista, string expresionOrdenado, SortDirection direccionOrdenado)
    {
        if (!string.IsNullOrEmpty(expresionOrdenado))
        {
            string direccionSort = "ASC";
            if (direccionOrdenado == SortDirection.Descending)
                direccionSort = "DESC";
            lista.Sort = expresionOrdenado + " " + direccionSort;
        }
    }

    protected void CalcularPaginaYFilaDeSeleccion(out int indicePagina, out int indiceFila, int indiceTotal, 
                                                  int longuitudPagina)
    {
        int tempIndiceTotal = indiceTotal + 1;
        indicePagina = Convert.ToInt32(Math.DivRem(tempIndiceTotal, longuitudPagina, out indiceFila));
        indiceFila--;
        if (indiceFila == -1)
        {
            indicePagina--;
            indiceFila = longuitudPagina - 1;
        }
    }

    protected int BuscarObjetoPorID(object id, DataView lista)
    {
        for (int i = 0; i < lista.Count; i++)
        {
            object valor = lista[i]["Id"];
            if (valor.Equals(id))
                return i;
        }
        return -1;
    }
    
    protected string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        int Dimension=0 ;
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
            if (MensajeError.StartsWith("MSJ"))
            {
                string[] Parametros = MensajeError.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                if (Parametros.GetLength(Dimension)>=2)
                    MensajeError = Parametros[1];
                
            }
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

    protected void PegarValoresEnControlesOrigen(Control contenedor, List<DictionaryEntry> parametros)
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

    private int BuscarParametro(string parametro, List<DictionaryEntry> listParametros)
    {
        for (int i = 0; i < listParametros.Count; i++)
        {
            if (listParametros[i].Key.ToString().ToUpper() == parametro.ToUpper())
            {
                return i;
            }
        }
        return -1;
    }

    protected virtual void EtiquetarBotonRefrescarCache()
    {
        if (RefrescarCache != null)
        {
            RefrescarCache.Text = "Refrescar Contenido";
        }
    }

    virtual protected void AsignarParametrosDataSourceDeatailsView(string id)
    {
        OdsDv.SelectParameters["Id"].DefaultValue = id;
    }

    protected void AsignarMensaje(string mensaje, Color color)
    {
        ((Label)Master.FindControl("LabelError")).Text = mensaje;
        ((Label)Master.FindControl("LabelError")).Visible = true;
        ((Label)Master.FindControl("LabelError")).ForeColor = color;
    }

    /// <summary>
    /// Selecciona el primer item en caso que indiceSeleccionQuery sea null o vacio
    /// caso contrario selecciona el item con el id especificado 
    /// </summary>
    /// <param name="indiceSeleccionQuery">Indice del id en el QueryString</param>
    protected void SeleccionarItemEnCarga(string indiceSeleccionQuery)
    {
        if (!IsPostBack)
        {
            string idSeleccion = null;
            if (!string.IsNullOrEmpty(indiceSeleccionQuery))
                idSeleccion = Request.QueryString[indiceSeleccionQuery];

            if (string.IsNullOrEmpty(idSeleccion))
            {
                Gv.DataBind();
                if (Gv.DataKeys.Count > 0)
                {
                    Gv.SelectedIndex = 0;
                    AsignarParametrosDataSourceDeatailsView(Gv.SelectedDataKey.Values["Id"].ToString());
                    Fv.DefaultMode = FormViewMode.ReadOnly;
                }
            }
            else
            {
                AsignarParametrosDataSourceDeatailsView(idSeleccion);
                Fv.DefaultMode = FormViewMode.ReadOnly;
                SeleccionarItemGridView(idSeleccion);
            }
        }
    }

    #endregion

    #region Implementación IResponderZoom
    public object ObtenerValorParametro(string nombreParametro)
    {
        return Navegacion.ObtenerValorControl(Fv.FindControl(nombreParametro));
    }

    #endregion
}