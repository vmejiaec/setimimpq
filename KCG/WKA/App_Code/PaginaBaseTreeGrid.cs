using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using HER;
using Koala.KoalaWebControls;

/// <summary>
/// Summary description for PaginaBaseTreeGrid
/// </summary>
public abstract class PaginaBaseTreeGrid : KPagina
{

        #region Atributos
        
        protected Color _clrBien = Color.WhiteSmoke;
        protected Color _clrMal = Color.WhiteSmoke;

        protected ZoomManager _zoomManager;
        protected bool _aplicarFiltrosFijos;

        protected abstract Type TipoObjeto { get; }
        protected abstract TreeView Trv { get; }
        protected abstract FormView Frv { get; }
        //protected abstract ObjectDataSource OdsTrv { get; }
        protected abstract ObjectDataSource OdsFrv { get; }
        protected abstract Button ResponderZoom { get; }
        protected abstract Button RegresoZoom { get; }
        protected abstract KFiltro Filtro { get; }
        protected abstract string Contenedor { get; }

        //protected abstract string IDControlPadre { get; }

        private Dictionary<string, string> _parametros = new Dictionary<string, string>();
        List<DictionaryEntry> _paramFijosDeInsercion = new List<DictionaryEntry>();
        List<DictionaryEntry> _paramInsertNoRealizado = new List<DictionaryEntry>();
        List<DictionaryEntry> _paramUpdateNoRealizado = new List<DictionaryEntry>();
        protected Dictionary<string, string> Parametros
        { get { return _parametros; } }
        #endregion

        #region Funciones para manejar eventos de KFiltro
        #region Filtro_MedatosConsultados
        void KftFiltro_MedatosConsultados(object sender, KControlEventArgs e)
        {
            if (e.Excepcion != null)
            {
                e.ExcepcionManejada = true;
            }
        }
        #endregion
        #region Filtro_ErrorEncontrado
        // V 1.7
        // Función para manejar el error al insertar
        // en Par_Filtro dentro del objeto KFiltro
        void KftFiltro_ErrorEncontrado(object sender, KControlEventArgs e)
        {
            if (e.Excepcion != null)
            {
                SoapException ex = (SoapException)e.Excepcion;
                string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
                AsignarMensaje(mensaje, _clrMal);
                Exception exe = new Exception(mensaje);
                throw exe;
            }
        }
        #endregion
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            s.id_inicial = "00000000000000000";
            s.id_final = "999999999999999";

            VerificarModoZoom();

            if (Filtro != null)
            {
                VerificarFiltroZoom();
                PrecisarValoresDeFiltradoFijo(Filtro.ParametrosFiltro);
                Filtro.AplicarFiltro();
            }

            VerificarBotonRegreso();
            VerificarBotonResponderZoom();
            //VerificarCbInsertarMemoria();
            AsignarTextosBotones();

            if (!IsPostBack)
            {
                AsignarContenedorAScope();
            }
        }
        #endregion

        #region OnInit
        protected override void OnInit(EventArgs e)
        {
            if (Trv != null)
            {
                Trv.SelectedNodeChanged += new EventHandler(Trv_SelectedNodeChanged); /*+= Gv_SelectedIndexChanged*/
                //Trv.Sorted += Gv_Sorted;
            }

            if (OdsFrv != null)
            {
                OdsFrv.Updating += OdsFrv_Updating;
                OdsFrv.Inserting += OdsFrv_Inserting;
                OdsFrv.Deleting += OdsFrv_Deleting;
                OdsFrv.Inserted += OdsFrv_Inserted;
                OdsFrv.Deleted += OdsFrv_Deleted;
            }

            if (ResponderZoom != null)
                ResponderZoom.Click += ResponderZoom_Click;

            if (RegresoZoom != null)
                RegresoZoom.Click += Regreso_Click;

            if (Frv != null)
            {
                Frv.ItemCommand += Frv_ItemCommand;
                Frv.DataBound += Frv_DataBound;
                Frv.ItemUpdated += Frv_ItemUpdated;
                Frv.ItemInserted += Frv_ItemInserted;
                //Frv.ModeChanged += Frv_ModeChanged;
            }


            if (Filtro != null)
            {
                Filtro.MedatosConsultados += KftFiltro_MedatosConsultados;
                // V 1.6
                // Registro el manejador para tratar el error al insertar 
                // en Par_Filtro dentro del objeto KFiltro
                Filtro.ErrorEncontrado += KftFiltro_ErrorEncontrado;
            }

            base.OnInit(e);
        }

    void Trv_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath) &&
                Zoom.ObtenerModoDeRequerimiento(Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath)) != FormViewMode.ReadOnly)
        {
            ResponderZoom.Visible = true;
        }

        Frv.ChangeMode(FormViewMode.ReadOnly);
        AsignarParametrosDataSourceDeatailsView(Trv.SelectedValue.ToString());
        //VerificarCbInsertarMemoria();
    }
        #endregion

        #region InitializeCulture
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
        /*private void Frv_ModeChanged(object sender, EventArgs e)
        {
            VerificarCbInsertarMemoria();
        }*/

        private void Frv_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                SoapException ex = (SoapException)e.Exception.InnerException;
                string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
                e.KeepInEditMode = true;

                DictionaryEntry[] parametros = new DictionaryEntry[e.NewValues.Count];
                e.NewValues.CopyTo(parametros, 0);
                _paramUpdateNoRealizado.AddRange(parametros);
                AsignarMensaje(mensaje, _clrMal);

                e.ExceptionHandled = true;
            }
            else
            {
                AsignarParametrosDataSourceDeatailsView(e.NewValues["Id"].ToString());
                //SeleccionarItemGridView(e.NewValues["Id"]);

                Frv.DefaultMode = FormViewMode.ReadOnly;
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, _clrBien);
            }
        }

        void Frv_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                SoapException ex = (SoapException)e.Exception.InnerException;
                string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);

                e.KeepInInsertMode = true;

                DictionaryEntry[] parametros = new DictionaryEntry[e.Values.Count];
                e.Values.CopyTo(parametros, 0);
                _paramInsertNoRealizado.AddRange(parametros);

                AsignarMensaje(mensaje, _clrMal);
                e.ExceptionHandled = true;
            }

        }

        private void Frv_DataBound(object sender, EventArgs e)
        {
            

            if (Frv.CurrentMode == FormViewMode.Insert)
            {
                DefinirParametrosFijosDeInsercion(_paramFijosDeInsercion);
                if (_paramFijosDeInsercion.Count > 0)
                    PegarValoresEnControlesOrigen(Frv, _paramFijosDeInsercion);
            }

            if (_paramUpdateNoRealizado.Count > 0)
            {
                PegarValoresEnControlesOrigen(Frv, _paramUpdateNoRealizado);
            }

            if (_paramInsertNoRealizado.Count > 0)
            {
                PegarValoresEnControlesOrigen(Frv, _paramInsertNoRealizado);
            }

            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
            {
                if (Frv.CurrentMode == FormViewMode.Insert &&
                    Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath) == FormViewMode.Insert)
                {
                    if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria == false
                        || Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).Parametros.Count > 0)
                    {
                        PegarValoresEnControlesOrigen(Frv, Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath));
                        if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria == true)
                        {
                            Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).Parametros.Clear();
                        }
                    }
                    else
                    {
                        PegarValoresEnControlesOrigen(Frv,
                                                      Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).
                                                          ParametrosInsertarConMemoria);
                    }
                }

                else if (Frv.CurrentMode == FormViewMode.Edit &&
                         Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath) == FormViewMode.Edit)
                {
                    PegarValoresEnControlesOrigen(Frv, Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath));
                }

                if (!Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria)
                    Zoom.RemoverRequerimiento(AppRelativeVirtualPath);
            }
        }

        private void Frv_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Zoom")
            {
                if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
                    Zoom.RemoverRequerimiento(AppRelativeVirtualPath);

                Zoom.AgregarRequerimiento(AppRelativeVirtualPath, Frv.CurrentMode, e.CommandArgument.ToString());

                switch (Frv.CurrentMode)
                {
                    case FormViewMode.Insert:
                        Frv.InsertItem(false);
                        AsignarParametrosDataSourceDeatailsView(null);
                        /*if (CbInsertarMemoria != null)
                            Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria =
                                CbInsertarMemoria.Checked;*/
                        break;
                    case FormViewMode.Edit:
                        Frv.UpdateItem(false);
                        break;
                    case FormViewMode.ReadOnly:
                        List<DictionaryEntry> parametros = Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath);
                        Dictionary<string, string> param = ZoomManager.ObtenerParametros(e.CommandArgument.ToString(), new char[] { ';', ':' }, true);
                        parametros.Add(
                            new DictionaryEntry(param["FILTRO"],
                                                Navegacion.ObtenerValorControl(Frv.FindControl(param["FILTRO"]))));
                        parametros.Add(new DictionaryEntry("Id", Navegacion.ObtenerValorControl(Frv.FindControl("Id"))));
                        break;
                }

                string rutaDestino = Zoom.ObtenerRutaDestino(AppRelativeVirtualPath);
                //redirecionado = true;
                Response.Redirect(rutaDestino);
            }
        }
        #endregion

        #region Grid View
        /*void Gv_Sorted(object sender, EventArgs e)
        {
            Trv.SelectedIndex = -1;
        }*/

        //protected void Gv_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath) &&
        //        Zoom.ObtenerModoDeRequerimiento(Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath)) != FormViewMode.ReadOnly)
        //    {
        //        ResponderZoom.Visible = true;
        //    }

        //    Frv.ChangeMode(FormViewMode.ReadOnly);
        //    AsignarParametrosDataSourceDeatailsView(Trv.SelectedValue.ToString());
        //    //VerificarCbInsertarMemoria();
        //}
        #endregion

        #region Object Data Source
        private void OdsFrv_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                SoapException ex = (SoapException)e.Exception.InnerException;
                string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
                //AsignarMensaje(e.Exception.InnerException.Message, _clrMal);
                AsignarMensaje(mensaje, _clrMal);
                e.ExceptionHandled = true;
            }
            else
            {
                Frv.ChangeMode(FormViewMode.Insert);
                //Trv.SelectedIndex = -1;
                Frv.DefaultMode = FormViewMode.Insert;
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, _clrBien);
            }
        }

        private void OdsFrv_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
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

        private void OdsFrv_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            { }
            else
            {
                AsignarParametrosDataSourceDeatailsView(Convert.ToString(e.ReturnValue));
                //SeleccionarItemGridView(e.ReturnValue);
                Frv.DefaultMode = FormViewMode.ReadOnly;
                Frv.ChangeMode(FormViewMode.ReadOnly);
                VerificarBotonResponderZoom();
                //VerificarCbInsertarMemoria();
                string mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, _clrBien);
            }
        }

        private void OdsFrv_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
            e.InputParameters.CopyTo(parametros, 0);
            e.InputParameters.Clear();

            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
            {
                if (Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria
                    && Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).ParametrosInsertarConMemoria.Count > 0)
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
                        Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath);
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

        protected void OdsFrv_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
            {
                DictionaryEntry[] parametros = new DictionaryEntry[e.InputParameters.Count];
                e.InputParameters.CopyTo(parametros, 0);
                e.InputParameters.Clear();
                List<DictionaryEntry> parametrosList = Zoom.ObtenerParametrosRequerimiento(AppRelativeVirtualPath);
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
        #endregion

        #region Verificadores
       

        protected void VerificarBotonResponderZoom()
        {
            if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath))
            {
                string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath);
                if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath)
                    && Zoom.ObtenerModoDeRequerimiento(rutaOrigen) != FormViewMode.ReadOnly
                    && Frv.CurrentMode != FormViewMode.Insert)
                {
                    ResponderZoom.Visible = true;
                }
            }
        }

        protected void VerificarBotonRegreso()
        {
            if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath))
            {
                RegresoZoom.Visible = true;
            }
        }

        protected void VerificarModoZoom()
        {
            if (Frv == null) return;
            if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
            {
                switch (Zoom.ObtenerModoDeRequerimiento(AppRelativeVirtualPath))
                {
                    case FormViewMode.Insert:
                        Frv.ChangeMode(FormViewMode.Insert);
                        break;
                    case FormViewMode.Edit:
                        Frv.ChangeMode(FormViewMode.Edit);
                        AsignarParametrosDataSourceDeatailsView(Zoom.ObtenerIdDeParametros(AppRelativeVirtualPath));
                        break;
                    case FormViewMode.ReadOnly:
                        Frv.ChangeMode(FormViewMode.ReadOnly);
                        AsignarParametrosDataSourceDeatailsView(Zoom.ObtenerIdDeParametros(AppRelativeVirtualPath));
                        break;
                }
            }
        }

        protected void VerificarFiltroZoom()
        {
            if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath))
            {
                Dictionary<string, string> filtro = Zoom.ObtenerFiltroParaDestino(AppRelativeVirtualPath, TipoObjeto.Name);

                if (filtro.Count == 0)
                    return;

                string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath);
                if (Zoom.ObtenerModoDeRequerimiento(rutaOrigen) == FormViewMode.ReadOnly)
                {
                    if (!IsPostBack)
                    {
                        Frv.ChangeMode(FormViewMode.ReadOnly);
                        AsignarParametrosDataSourceDeatailsView(filtro["Id"]);
                    }
                }
                else
                {
                    //if (!IsPostBack)
                    //{
                    if (Filtro != null)
                    {
                        if (filtro.Count > 0)
                        {
                            /*StringBuilder filtradoGrid = new StringBuilder();
                            if (!string.IsNullOrEmpty(OdsTrv.FilterExpression))
                                filtradoGrid.Append(OdsTrv.FilterExpression);*/


                            List<string> borrarDeFiltrosZoom = new List<string>();


                            foreach (KeyValuePair<string, string> parametro in filtro)
                            {
                                if (Filtro.ParametrosFiltro.ContainsKey(parametro.Key))
                                {
                                    if (parametro.Key.Contains("Codigo"))
                                    {
                                        if (Filtro.ParametrosFiltro[parametro.Key].Visible)
                                        {
                                            if (!IsPostBack)
                                            {
                                                Filtro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                                    parametro.Key, parametro.Value, parametro.Value);
                                                borrarDeFiltrosZoom.Add(parametro.Key);
                                                //filtro.Remove(parametro.Key);
                                            }
                                        }
                                        else
                                        {
                                            Filtro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                                parametro.Key, parametro.Value, parametro.Value);
                                        }
                                    }

                                    else if (parametro.Key.Contains("Nombre"))
                                    {
                                        if (Filtro.ParametrosFiltro[parametro.Key].Visible)
                                        {
                                            if (!IsPostBack)
                                            {
                                                Filtro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                                    parametro.Key, "%" + parametro.Value);
                                                borrarDeFiltrosZoom.Add(parametro.Key);
                                                //filtro.Remove(parametro.Key);
                                            }
                                        }
                                        else
                                        {
                                            Filtro.ParametrosFiltro[parametro.Key].EstablecerValoresDeFiltrado(
                                                parametro.Key, "%" + parametro.Value);
                                        }
                                    }
                                }

                            }

                            for (int i = 0; i < borrarDeFiltrosZoom.Count; i++)
                            {
                                filtro.Remove(borrarDeFiltrosZoom[i]);
                            }
                        }
                        //}
                    }
                }
            }
        }

        /*protected bool VerificarExistenciaParametroFiltrado(string nombreParametro)
        {
            if (OdsTrv.FilterParameters.Count == 0)
                return false;
            for (int i = 0; i < OdsTrv.FilterParameters.Count; i++)
            {
                if (OdsTrv.FilterParameters[i].Name == nombreParametro)
                    return true;
            }
            return false;
        }*/
        #endregion

        #region Controladores de eventos
        /*protected void KftFiltro_Buscar(object sender, EventArgs e)
        { }*/

        /*private void CbInsertarMemoria_CheckedChanged(object sender, EventArgs e)
        {
            if (CbInsertarMemoria.Checked == false)
            {
                if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath))
                    Zoom.RemoverRequerimiento(AppRelativeVirtualPath);
            }
            else
            {
                Zoom.AgregarRequerimiento(AppRelativeVirtualPath, Frv.CurrentMode);
                Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).Parametros =
                    CopiarValoresDeControles(Frv, TipoObjeto);
                Zoom.ObtenerParametrosZoom(AppRelativeVirtualPath).InsertarConMemoria = true;
            }
        }*/

        private void Regreso_Click(object sender, EventArgs e)
        {
            string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath);
            //redirecionado = true;
            Response.Redirect(rutaOrigen);
        }

        private void ResponderZoom_Click(object sender, EventArgs e)
        {
            if (Zoom.ContieneRequerimientoDestino(AppRelativeVirtualPath))
            {
                string id = Navegacion.ObtenerValorControl(Frv.FindControl("Id"));
                string codigo = Navegacion.ObtenerValorControl(Frv.FindControl("Codigo"));
                string nombre = Navegacion.ObtenerValorControl(Frv.FindControl("Nombre"));

                List<DictionaryEntry> parametrosOrigen =
                    Zoom.ObtenerParametrosRequerimiento(Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath));

                string rutaOrigen = Zoom.ObtenerRutaOrigen(AppRelativeVirtualPath);

                string nombreObjeto = TipoObjeto.Name;
                nombreObjeto = nombreObjeto.ToUpper();

                List<DictionaryEntry> memoria = new List<DictionaryEntry>();
                bool insertarConMemoria = Zoom.ObtenerParametrosZoom(rutaOrigen).InsertarConMemoria;

                string alias = Zoom.ObtenerParametrosZoom(rutaOrigen).Alias.ToUpper();

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

                    if (parametrosOrigen[i].Key.ToString() != "Id"
                        && parametrosOrigen[i].Key.ToString() != "Codigo"
                        && parametrosOrigen[i].Key.ToString() != "Nombre"
                        && parametrosOrigen[i].Key.ToString() != "Estado"
                        && parametrosOrigen[i].Key.ToString() != "Estado_Nombre")
                    {
                        string parametroFK =
                            Navegacion.ObtenerValorControl(Frv.FindControl(parametrosOrigen[i].Key.ToString()));
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
                }


                List<string> noGuardar = Zoom.ObtenerParametrosZoom(rutaOrigen).ParametrosEliminar;


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

                Zoom.ObtenerParametrosZoom(rutaOrigen).ParametrosInsertarConMemoria.Clear();
                Zoom.ObtenerParametrosZoom(rutaOrigen).ParametrosInsertarConMemoria = memoria;

                //redirecionado = true;
                AsignarParametrosDataSourceDeatailsView(null);
                Frv.ChangeMode(FormViewMode.Insert);

                Response.Redirect(rutaOrigen);
            }
        }
        #endregion

        #region utilitarios
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

        protected ZoomManager Zoom
        {
            get
            {
                if (_zoomManager == null && Session["Zoom"] == null)
                {
                    _zoomManager = new ZoomManager();
                    Session["Zoom"] = _zoomManager;
                }

                else if (_zoomManager == null && Session["Zoom"] != null)
                {
                    _zoomManager = (ZoomManager)Session["Zoom"];
                }

                else if (_zoomManager != null && Session["Zoom"] == null)
                {
                    Session["Zoom"] = _zoomManager;
                }

                return _zoomManager;
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
            if (RegresoZoom != null)
            {
                RegresoZoom.Text = HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString();
                RegresoZoom.ToolTip =
                    HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString();
                RegresoZoom.AccessKey =
                    HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_AtrasRecursoKCG.AccesKey").ToString();
            }
            if (ResponderZoom != null)
            {
                ResponderZoom.AccessKey =
                    HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_SeleccionarRecursoKCG.AccesKey").ToString();
                ResponderZoom.Text =
                    HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString();
                ResponderZoom.ToolTip =
                    HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString();
            }
        }

        /*protected void SeleccionarItemGridView(object id)
        {
            DataView lista = (DataView)OdsTrv.Select();
            OrdenarDataView(lista, Trv.SortExpression, Trv.SortDirection);

            int iTotal = BuscarObjetoPorID(id, lista);
            int iPagina;
            int iFila;

            CalcularPaginaYFilaDeSeleccion(out iPagina, out iFila, iTotal, Trv.PageSize);

            

            Trv.PageIndex = iPagina;
            Trv.SelectedIndex = iFila;
            Trv.DataBind();

        }*/

        /*protected void OrdenarDataView(DataView lista, string expresionOrdenado, SortDirection direccionOrdenado)
        {
            if (!string.IsNullOrEmpty(expresionOrdenado))
            {
                string direccionSort = "ASC";
                if (direccionOrdenado == SortDirection.Descending)
                    direccionSort = "DESC";
                lista.Sort = expresionOrdenado + " " + direccionSort;
            }
        }*/

        /*protected void CalcularPaginaYFilaDeSeleccion(out int indicePagina, out int indiceFila, int indiceTotal, int longuitudPagina)
        {
            int tempIndiceTotal = indiceTotal + 1;
            indicePagina = Convert.ToInt32(Math.DivRem(tempIndiceTotal, longuitudPagina, out indiceFila));
            indiceFila--;
            if (indiceFila == -1)
            {
                indicePagina--;
                indiceFila = longuitudPagina - 1;
            }
        }*/

        /*protected int BuscarObjetoPorID(object id, DataView lista)
        {
            for (int i = 0; i < lista.Count; i++)
            {
                object valor = lista[i]["Id"];
                if (valor.Equals(id))
                    return i;
            }
            return -1;
        }*/

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
        { }

        // ESTA FUNCION PODRIA IR EN EL ZOOMMANAGER
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

        virtual protected void AsignarParametrosDataSourceDeatailsView(string id)
        {
            OdsFrv.SelectParameters["Id"].DefaultValue = id;
        }

        protected void AsignarMensaje(string mensaje, Color color)
        {
            ((Label)Master.FindControl("LabelError")).Text = mensaje;
            ((Label)Master.FindControl("LabelError")).Visible = true;
            ((Label)Master.FindControl("LabelError")).ForeColor = color;
        }
        #endregion
    
}
