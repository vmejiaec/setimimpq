/*
KOALA SOLUTION 
 
KFiltro     - Generador de expresiones de filtrado
              aplicables a ObjectDataSources que regresan DataTables
ver 2.1.1

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: Control Filtro Asp.Net              
							
NOTAS DE DISEÑO
 * Versiones anteriores
   - 
 * Version 2.0
   - Es caracter especial [%], cuando se encunetra en el principio
     o en el final.
   - Los demas caracteres especiales cuando estan en un tipo de control
     KFiltroTexto se encierran en [].
   - IFiltroVacio permite verificar si los controles de filtro
     tiene filtros.

HISTORIA     					 
 * Versiones anteriores
   - 
 * Version 2.0
   - Implementación de IFiltroVacio en los controles.
   - KFiltroTexto, tiene una función estática para normalizar
     el textro de filtrado (caracteres especiales).
 * Version 2.1
   - Se agregó una función que permite mostrar el filtro.
 * Version 2.1.1
   - Corrección de construcción de expresion de filatrado
     para rangos numéricos.
  
TRABAJO FUTURO
   - Implementar Funciones de limpiar en los controles q
     forman el filtro.

ÚLTIMA FECHA DE MODIFICACIÓN
02-07-2008 16H38

ACTUALIZACIÓN DE VERSION
 * Version 2.1.2
   - Para esta versión se agregó una propiedad para el KFiltro
   - Esta propiedad nos permitirá identificar si la página tiene PF (Paginación Fina)
   - En la función Aplicar Filtro() se puso una condición para que se realice ese
     código siempre y cuando la página no tenga PF

ÚLTIMA FECHA DE MODIFICACION
02-07-2008 16H38

ACTUALIZACIÓN DE VERSION
 * Version 2.1.2
   - Para esta versión se agregó una propiedad para el KFiltro
   - Esta propiedad nos permitirá identificar si la página tiene PF (Paginación Fina)
   - En la función Aplicar Filtro() se puso una condición para que se realice ese
     código siempre y cuando la página no tenga PF

ÚLTIMA FECHA DE MODIFICACION
29-07-2009 16H28

*/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using FEL.DIC;
using FEL.PAR;
using System.Web.Caching;

namespace Koala.KoalaWebControls
{
    #region KMetaItemFiltro
    public class KMetaItemFiltro
    {
        private string _tipoDato;
        private string _tipoCostraint;
        private bool _visible;

        public KMetaItemFiltro()
        {}

        public KMetaItemFiltro(string tipoDato, string tipoCostraint, bool visible)
        {
            _tipoDato = tipoDato;
            _tipoCostraint = tipoCostraint;
            _visible = visible;
        }

        public KMetaItemFiltro(string tipoDato, string tipoCostraint, string visible)
        {
            _tipoDato = tipoDato;
            _tipoCostraint = tipoCostraint;
            _visible = false;
            if (visible.Trim() == "S")
                _visible = true;
        }

        public string TipoDato
        {get { return _tipoDato; }}

        public string TipoCostraint
        {get { return _tipoCostraint; }}

        public bool Visible
        { get { return _visible; }}
    }
    #endregion

    #region KItemFiltroEventArgs
    public class KItemFiltroEventArgs : EventArgs
    {
        private readonly KItemFiltro _itemEditado;
        private readonly string _campo;

        public KItemFiltro ItemEditado
        {get { return _itemEditado; }}

        public string Campo
        {get { return _campo; }}

        public KItemFiltroEventArgs(KItemFiltro itemEditado, string campo)
        {
            _itemEditado = itemEditado;
            _campo = campo;
        }
    }
    #endregion

    #region Delegados
    public delegate void MedatosConsultadosEventHandler(object sender, KControlEventArgs e);
    public delegate void KItemFiltroCambioEventHandler(KItemFiltroEventArgs e);
    // V 1.4
    // Delegado para el manejo del error al insertar
    // en Par_Filtro
    public delegate void ErrorEncontradoEventHandler(object sender, KControlEventArgs e);
    #endregion

    #region KItemFiltro
    public class KItemFiltro : KMetaItemFiltro, IFiltroVacio
    {
        private object[] _valor;
        public enum TipoItemFiltro { Rango, ComboSeleccion, RadioSeleccion, Texto, RangoFecha, NoDefinido }
        private TipoItemFiltro _tipoItemFiltro;
        public event KItemFiltroCambioEventHandler FiltroCambioEvent;
        private bool _filtroVacio;

        private void OnFiltroCambio(string campo)
        {
            if (FiltroCambioEvent != null)
            {
                FiltroCambioEvent(new KItemFiltroEventArgs(this, campo));
            }
        }

        public KItemFiltro(string tipoDato, string tipoCostraint, bool visible, bool filtroVacio, params object[] valor)
            : base(tipoDato, tipoCostraint, visible)
        {
            _valor = valor;
            _tipoItemFiltro = ObtenerTipoItemFiltro();
            _filtroVacio = filtroVacio;
        }

        public KItemFiltro(string tipoDato, string tipoCostraint, string visible, bool filtroVacio, params object[] valor)
            : base(tipoDato, tipoCostraint, visible)
        {
            _valor = valor;
            _tipoItemFiltro = ObtenerTipoItemFiltro();
            _filtroVacio = filtroVacio;
        }

        public TipoItemFiltro TipoFiltro
        {get { return _tipoItemFiltro; }}

        public object[] Valor
        {get { return _valor; }
         set { _valor = value; }}

        public bool FiltroVacio
        {
            get { return _filtroVacio; }
        }

        internal bool FiltroVacioInterno
        {
            get { return _filtroVacio; }
            set { _filtroVacio = value; }
        }

        public void EstablecerValoresDeFiltrado(string keyCampo, params object[] valor )
        {
            _valor = valor;
            OnFiltroCambio(keyCampo);
        }

        internal void EstablecerValoresDeFiltradoInterno(bool filtroVacio, params object[] valor)
        {
            _valor = valor;
            _filtroVacio = filtroVacio;
        }

        private TipoItemFiltro ObtenerTipoItemFiltro()
        {
            if (TipoDato == "NUM" ||
                TipoDato == "FLO" ||
                TipoDato == "INT" ||
                (TipoDato == "VAR" && TipoCostraint == "COD") ||
                (TipoDato == "CHA" && TipoCostraint == "NIN"))
            {
                return TipoItemFiltro.Rango;
            }

            else if (TipoDato == "CHA"
                     && (TipoCostraint == "DOL" || TipoCostraint == "EST"))
            {
                return TipoItemFiltro.ComboSeleccion;
            }

            else if (TipoDato == "VAR" && TipoCostraint == "DOC")
            {
                return TipoItemFiltro.RadioSeleccion;
            }

            else if (TipoDato == "VAR"
                     && TipoCostraint == "NIN")
            {
                return TipoItemFiltro.Texto;
            }

            else if (TipoDato == "DAT")
            {
                return TipoItemFiltro.RangoFecha;
            }

            return TipoItemFiltro.NoDefinido;
        }
    }

    interface IFiltroVacio
    {
        bool FiltroVacio
        { get;}
    }
    #endregion

    #region KFiltro Control Compuesto 
    [   AspNetHostingPermission(SecurityAction.Demand,
            Level = AspNetHostingPermissionLevel.Minimal),
        AspNetHostingPermission(SecurityAction.InheritanceDemand,
            Level = AspNetHostingPermissionLevel.Minimal),
        DefaultProperty("ValorScope"),
        ToolboxData("<{0}:KFiltro runat=server></{0}:KFiltro>") ]
    public class KFiltro : CompositeControl
    {
        #region Atributos del Filtro
        private static readonly object EventBuscarKey = new object();
        private static readonly object EventMedatosConsultadosKey = new object();
        private static readonly object EventFiltroConstruidoKey = new object();
        // V 1.6
        // Identificador del evento del error al insertar
        // en Par_Filtro
        private static readonly object EventErrorEncontradoKey = new object();
        //Filtrado
        private Button bntBuscar;
        private Button bntLimpiar;
        private Button btnAvanzada;
        private Button btnCampos;
        private ModalPopupExtender mpeVentanaFiltro;
        //Campos
        private ModalPopupExtender mpeVentanaCampo;
        private bool _filtrosConstruido = false;
        private Dictionary<string, KItemFiltro> _filtros = new Dictionary<string, KItemFiltro>();
        private Panel _pnlContenedorVentanaCampo;
        private GridView _grvCampos;
        private ObjectDataSource _ods;
        private List<Par_Filtro> _litCampos;

        internal List<Par_Filtro> litCampos
        {
            get { return _litCampos; }
            set { _litCampos = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Nombre del Dic_Objeto")]
        public string Objeto
        {
            get
            {
                string s = (string) ViewState["Objeto"];
                return s ?? String.Empty;
            }

            set { ViewState["Objeto"] = value; }
        }

        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("ID del object data source para filtrado")]
        public string ObjectDataSourceID
        {
            get
            {
                string s = (string)ViewState["ObjectDataSourceID"];
                return s ?? String.Empty;
            }

            set { ViewState["ObjectDataSourceID"] = value; }
        }

        // V 1.7
        // Propiedad para verficar si la pagina se aplica Paginación Fina
        // Esta propiedad se define en la Página ASPX en KFiltro
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Respuesta si aplica Paginación Fina o No")]
        public bool PaginacionFina
        {
            get
            {
                if (ViewState["PaginacionFina"] != null)
                {
                    bool s = (bool)ViewState["PaginacionFina"];
                    return s;
                }
                else
                    return false;
            }
            set { ViewState["PaginacionFina"] = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Nombre del Dic_Contenedor")]
        public string Contenedor
        {
            get
            {
                string s = (string) ViewState["Contenedor"];
                return s ?? String.Empty;
            }

            set { ViewState["Contenedor"] = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("1")]
        [Localizable(true)]
        [Description("Orden en el Dic_Contenedor")]
        public int Orden
        {
            get
            {
                object orden = ViewState["Orden"];
                return (orden == null) ? -1 : (int) orden;
            }

            set { ViewState["Orden"] = value; }
        }


        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("Scope")]
        [Localizable(true)]
        [Description("Indice en en objeto Session donde se almacena Scope")]
        public string IndiceScope
        {
            get
            {
                string s = (string) ViewState["IndiceScope"];
                return s ?? String.Empty;
            }

            set { ViewState["IndiceScope"] = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("Scope")]
        [Localizable(true)]
        [Description("ParametrosFiltro Obligatorios")]
        public Dictionary<string, KItemFiltro> ParametrosFiltro
        {
            get
            {
                if (!_filtrosConstruido)
                {
                    EnsureChildControls();
                    AgregarParametrosDeFiltradoDelUsuario();
                    _filtrosConstruido = true;
                }
                return _filtros;
            }
        }
        #endregion

        #region Eventos de KFiltro
        [Category("Action"),
         Description("Cuando el usuario da clic en buscar")]
        public event EventHandler Buscar
        {
            add { Events.AddHandler(EventBuscarKey, value); }
            remove { Events.RemoveHandler(EventBuscarKey, value); }
        }

        // esta mal que la busqueda este en le evento pq si no se atrapa no se filtra
        protected virtual void OnBuscar(EventArgs e)
        {
            EventHandler BuscarHandler = (EventHandler)Events[EventBuscarKey];
            if (BuscarHandler != null)
            {
                BuscarHandler(this, e);
            }
        }

        [Category("Misc"),
         Description("El filtro fue construido desde el el origen de metadatos")]
        public event EventHandler FiltroConstruido
        {
            add { Events.AddHandler(EventFiltroConstruidoKey, value); }
            remove { Events.RemoveHandler(EventFiltroConstruidoKey, value); }
        }

        protected virtual void OnFiltroConstruido(EventArgs e)
        {
            EventHandler FiltroConstruidoHandler = (EventHandler)Events[EventFiltroConstruidoKey];
            if (FiltroConstruidoHandler != null)
            {
                FiltroConstruidoHandler(this, e);
            }
        }

        [Category("Datos"),
         Description("Se consultaron los metadatos")]
        public event MedatosConsultadosEventHandler MedatosConsultados
        {
            add { Events.AddHandler(EventMedatosConsultadosKey, value); }
            remove { Events.RemoveHandler(EventMedatosConsultadosKey, value); }
        }

        protected virtual void OnMedatosConsultados(KControlEventArgs e)
        {
            MedatosConsultadosEventHandler MedatosConsultadosHandler = (MedatosConsultadosEventHandler)Events[EventMedatosConsultadosKey];
            if (MedatosConsultadosHandler != null)
            {
                MedatosConsultadosHandler(this, e);
            }
            if (!e.ExcepcionManejada && e.Excepcion != null)
            {
                throw e.Excepcion;
            }
        }

        // V 1.2
        // Controlador de eventos para reportar errores 
        // al insertar registros en Par_Filtro
        // Con este controlador se registran los delegados para 
        // gestionar el error.
        [Category("Erorr"),
         Description("Se produjo un error al insertar Par_Filtro")]
        public event ErrorEncontradoEventHandler ErrorEncontrado
        {
            add { Events.AddHandler(EventErrorEncontradoKey, value); }
            remove { Events.RemoveHandler(EventErrorEncontradoKey, value); }
        }

        // V 1.3
        // Disparador de los delegados registrados
        // para gestionar el error al insertar en Par_Filtro
        protected internal virtual void OnErrorEncontrado(KControlEventArgs e)
        {
            ErrorEncontradoEventHandler ErrorEncontradoHandler =
                (ErrorEncontradoEventHandler)Events[EventErrorEncontradoKey];
            if (ErrorEncontradoHandler != null)
            {
                ErrorEncontradoHandler(this, e);
            }
            if (!e.ExcepcionManejada && e.Excepcion != null)
            {
                throw e.Excepcion;
            }
        }
        #endregion

        #region AgregarParametrosDeFiltradoDelUsuario
        private void AgregarParametrosDeFiltradoDelUsuario()
        {
            foreach (KeyValuePair<string, KItemFiltro> filtro in _filtros)
            {
                if (filtro.Value.Visible)
                {
                    Control controlFiltro = Controls[0].FindControl(filtro.Key);

                    if (controlFiltro is KFiltroTexto)
                    {
                        //controlFiltro = (KFiltroTexto)controlFiltro;
                        filtro.Value.EstablecerValoresDeFiltradoInterno(
                            ((IFiltroVacio)controlFiltro).FiltroVacio, ((KFiltroTexto)controlFiltro).TextoDeFiltrado);
                    }

                    else if (controlFiltro is  KFiltroRango)
                    {
                        KFiltroRango filtroRango = (KFiltroRango) controlFiltro;
                        filtro.Value.EstablecerValoresDeFiltradoInterno(
                            ((IFiltroVacio)controlFiltro).FiltroVacio, filtroRango.NumeroInicio, filtroRango.NumeroFin);
                    }

                    else if (controlFiltro is KFiltroComboSeleccion)
                    {
                        KFiltroComboSeleccion filtroCombo = (KFiltroComboSeleccion) controlFiltro;
                        filtro.Value.EstablecerValoresDeFiltradoInterno(
                            ((IFiltroVacio)controlFiltro).FiltroVacio, filtroCombo.ItemFiltroSeleccionado.Value);
                    }

                    else if (controlFiltro is KFiltroRadioSeleccion)
                    {
                        KFiltroRadioSeleccion filtroRadio = (KFiltroRadioSeleccion)controlFiltro;
                        filtro.Value.EstablecerValoresDeFiltradoInterno(
                            ((IFiltroVacio)controlFiltro).FiltroVacio, filtroRadio.ItemFiltroSeleccionado.Value);
                    }

                    else if (controlFiltro is KFiltroRangoFecha)
                    {
                        KFiltroRangoFecha filtroFecha = (KFiltroRangoFecha)controlFiltro;
                        filtro.Value.EstablecerValoresDeFiltradoInterno(
                            ((IFiltroVacio)controlFiltro).FiltroVacio, filtroFecha.FechaInicio, filtroFecha.FechaFin);
                    }
                }

            }

        }
        #endregion

        #region CreateChildControls
        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            InicializarVentanaCampos();
            List<Par_Filtro> listParFiltro = ObtenerDatosFiltro();

            Panel pnlContenedor = new Panel();
            pnlContenedor.ID = "pnlContenedor";
            pnlContenedor.Style.Add("display", "none");
            pnlContenedor.CssClass = "filtro";
            
            Panel pnlMover = new Panel();
            pnlMover.ID = "pnlMover";
            pnlMover.Height = Unit.Pixel(21);
            pnlMover.Width = Unit.Pixel(450);
            pnlMover.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            pnlMover.Style.Add("cursor", "move");
            pnlMover.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");

            Label lblTituloVentada = new Label();
            lblTituloVentada.Text =
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_BuscarRecursoKCG.Text").ToString();
            lblTituloVentada.ForeColor = Color.WhiteSmoke;
            lblTituloVentada.Width = Unit.Pixel(429);
            lblTituloVentada.Style.Add(HtmlTextWriterStyle.TextAlign, "left");
            pnlMover.Controls.Add(lblTituloVentada);

            Button btnCerrar = new Button();
            btnCerrar.ID = "btnCerrarID";
            btnCerrar.BorderStyle = BorderStyle.None;
            btnCerrar.CssClass = "cerrar";
            btnCerrar.Style.Add("cursor", "hand");
            pnlMover.Controls.Add(btnCerrar);

            pnlContenedor.Controls.Add(pnlMover);
            LiteralControl separadorCa = new LiteralControl("<br />");
            pnlContenedor.Controls.Add(separadorCa);

            for (int i = 0; i < listParFiltro.Count; i++)
            {
                if (listParFiltro[i].Visible == "S")
                {
                    if (listParFiltro[i].Dic_Campo_Tipo_dato == "NUM" ||
                        listParFiltro[i].Dic_Campo_Tipo_dato == "FLO" ||
                        listParFiltro[i].Dic_Campo_Tipo_dato == "INT" ||
                        (listParFiltro[i].Dic_Campo_Tipo_dato == "VAR" &&
                         listParFiltro[i].Dic_Campo_Tipo_constraint == "COD") ||
                        (listParFiltro[i].Dic_Campo_Tipo_dato == "CHA" &&
                         listParFiltro[i].Dic_Campo_Tipo_constraint == "NIN"))
                    {
                        string tipoDato = listParFiltro[i].Dic_Campo_Tipo_dato;

                        if (listParFiltro[i].Dic_Campo_Nombre == "Codigo")
                        {
                            tipoDato = "INT";
                        }
                        

                        KFiltroRango filtroRango = new KFiltroRango();
                        filtroRango.ID = listParFiltro[i].Dic_Campo_Nombre /*campoNombre*/;
                        filtroRango.TipoDato = /*listParFiltro[i].Dic_Campo_Tipo_dato*/ tipoDato;
                        //filtroRango.Etiqueta = ObtenerEtitquetaDeRecurso(listParFiltro[i].Dic_Campo_Nombre);
                        filtroRango.Etiqueta = listParFiltro[i].Ver_etiqueta_Nombre;
                        
                        pnlContenedor.Controls.Add(filtroRango);
                        LiteralControl separador = new LiteralControl("<br />");
                        pnlContenedor.Controls.Add(separador);
                    }
                    else if (listParFiltro[i].Dic_Campo_Tipo_dato == "CHA"
                             && (listParFiltro[i].Dic_Campo_Tipo_constraint == "DOL" ||
                                 listParFiltro[i].Dic_Campo_Tipo_constraint == "EST"))
                    {
                        KFiltroComboSeleccion filtroComboSeleccion = new KFiltroComboSeleccion();
                        filtroComboSeleccion.ID = listParFiltro[i].Dic_Campo_Nombre;
                        filtroComboSeleccion.CampoID = listParFiltro[i].Dic_Campo_Id;
                        filtroComboSeleccion.IndiceScope = "Scope";
                        filtroComboSeleccion.TipoConstraintFiltro = listParFiltro[i].Dic_Campo_Tipo_constraint;
                        //filtroComboSeleccion.Etiqueta = ObtenerEtitquetaDeRecurso(listParFiltro[i].Dic_Campo_Nombre);
                        filtroComboSeleccion.Etiqueta = listParFiltro[i].Ver_etiqueta_Nombre;

                        pnlContenedor.Controls.Add(filtroComboSeleccion);
                        LiteralControl separador = new LiteralControl("<br />");
                        pnlContenedor.Controls.Add(separador);
                    }

                    else if (listParFiltro[i].Dic_Campo_Tipo_dato == "VAR"
                             && listParFiltro[i].Dic_Campo_Tipo_constraint == "DOC")
                    {
                        KFiltroRadioSeleccion filtroRadioSeleccion = new KFiltroRadioSeleccion();
                        filtroRadioSeleccion.ID = listParFiltro[i].Dic_Campo_Nombre;
                        filtroRadioSeleccion.CampoID = listParFiltro[i].Dic_Campo_Id;
                        filtroRadioSeleccion.IndiceScope = "Scope";
                        //filtroRadioSeleccion.Etiqueta = ObtenerEtitquetaDeRecurso(listParFiltro[i].Dic_Campo_Nombre);
                        filtroRadioSeleccion.Etiqueta = listParFiltro[i].Ver_etiqueta_Nombre;
                        pnlContenedor.Controls.Add(filtroRadioSeleccion);
                        LiteralControl separador = new LiteralControl("<br />");
                        pnlContenedor.Controls.Add(separador);
                    }

                    else if (listParFiltro[i].Dic_Campo_Tipo_dato == "VAR"
                             && listParFiltro[i].Dic_Campo_Tipo_constraint == "NIN")
                    {
                        KFiltroTexto fitroTexto = new KFiltroTexto();
                        fitroTexto.ID = listParFiltro[i].Dic_Campo_Nombre;
                        if (listParFiltro[i].Dic_Campo_Nombre.ToUpper().EndsWith("NOMBRE"))
                        {
                            fitroTexto.Ancho = Unit.Pixel(200);
                        }
                        //fitroTexto.Etiqueta = ObtenerEtitquetaDeRecurso(listParFiltro[i].Dic_Campo_Nombre);
                        fitroTexto.Etiqueta = listParFiltro[i].Ver_etiqueta_Nombre;
                        pnlContenedor.Controls.Add(fitroTexto);
                        LiteralControl separador = new LiteralControl("<br />");
                        pnlContenedor.Controls.Add(separador);
                    }

                    else if (listParFiltro[i].Dic_Campo_Tipo_dato == "DAT")
                    {
                        KFiltroRangoFecha fitroFecha = new KFiltroRangoFecha();
                        fitroFecha.ID = listParFiltro[i].Dic_Campo_Nombre;
                        //fitroFecha.Post += fitroFecha_Post;
                        fitroFecha.IndiceScope = "Scope";
                        //fitroFecha.Etiqueta = ObtenerEtitquetaDeRecurso(listParFiltro[i].Dic_Campo_Nombre);
                        fitroFecha.Etiqueta = listParFiltro[i].Ver_etiqueta_Nombre;
                        pnlContenedor.Controls.Add(fitroFecha);
                        LiteralControl separadoraa = new LiteralControl("<br />");
                        pnlContenedor.Controls.Add(separadoraa);
                    }
                }

                KItemFiltro itemfiltro = new KItemFiltro(listParFiltro[i].Dic_Campo_Tipo_dato,
                                                         listParFiltro[i].Dic_Campo_Tipo_constraint,
                                                         listParFiltro[i].Visible, true, null);

                if (!string.IsNullOrEmpty(listParFiltro[i].Dic_con_Campo_Id))
                    _litCampos.Add(listParFiltro[i]);

                if (listParFiltro[i].Visible == "S")
                    itemfiltro.FiltroCambioEvent += itemfiltro_FiltroCambioEvent;

                _filtros.Add(listParFiltro[i].Dic_Campo_Nombre,
                                        itemfiltro);
            
            }

            pnlContenedor.Controls.Add(new LiteralControl("<br />"));

            Panel pnlBotones = new Panel();
            pnlBotones.ID = "pnlBotones";
            pnlBotones.Height = Unit.Pixel(21);
            pnlBotones.Width = Unit.Pixel(450);
            pnlBotones.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            pnlBotones.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
            pnlBotones.Style.Add(HtmlTextWriterStyle.TextAlign, "center");

            InicializarBotones();
            pnlBotones.Controls.Add(btnCampos);
            pnlBotones.Controls.Add(btnAvanzada);
            pnlBotones.Controls.Add(bntBuscar);
            pnlBotones.Controls.Add(bntLimpiar);
            pnlContenedor.Controls.Add(pnlBotones);
            pnlContenedor.DefaultButton = bntBuscar.ID;

            Controls.AddAt(0, pnlContenedor);

            Button btnAbrirFiltro = new Button();
            btnAbrirFiltro.Text = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_FiltrarRecursoKCG.Text").ToString();
            btnAbrirFiltro.ID = "btnAbrir";
            Controls.Add(btnAbrirFiltro);

            mpeVentanaFiltro = new ModalPopupExtender();
            mpeVentanaFiltro.TargetControlID = "btnAbrir";
            mpeVentanaFiltro.PopupControlID = "pnlContenedor";
            mpeVentanaFiltro.CancelControlID = "btnCerrarID";
            mpeVentanaFiltro.PopupDragHandleControlID = "pnlMover";

            Controls.Add(mpeVentanaFiltro);

            CrearVentanaCampos();
        }
        #endregion

        #region CrearVentanaCampos
        protected void CrearVentanaCampos()
        {
            _pnlContenedorVentanaCampo.ID = "pnlContenedorC";
            _pnlContenedorVentanaCampo.Style.Add("display", "none");
            _pnlContenedorVentanaCampo.CssClass = "filtro";

            Panel pnlMover = new Panel();
            pnlMover.ID = "pnlMoverC";
            pnlMover.Height = Unit.Pixel(21);
            pnlMover.Width = Unit.Pixel(450);
            pnlMover.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            pnlMover.Style.Add("cursor", "move");
            pnlMover.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");

            Label lblTituloVentada = new Label();
            lblTituloVentada.Text =
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CamposRecursoKCG.Text").ToString();
            lblTituloVentada.ForeColor = Color.WhiteSmoke;
            lblTituloVentada.Width = Unit.Pixel(429);
            lblTituloVentada.Style.Add(HtmlTextWriterStyle.TextAlign, "left");
            pnlMover.Controls.Add(lblTituloVentada);

            Button btnCerrar = new Button();
            btnCerrar.ID = "btnCerrarIDC";
            btnCerrar.BorderStyle = BorderStyle.None;
            btnCerrar.CssClass = "cerrar";
            btnCerrar.Style.Add("cursor", "hand");
            pnlMover.Controls.Add(btnCerrar);

            _pnlContenedorVentanaCampo.Controls.Add(pnlMover);
            LiteralControl separadorCa = new LiteralControl("<br />");
            _pnlContenedorVentanaCampo.Controls.Add(separadorCa);

            _grvCampos.HeaderStyle.CssClass = "headerstyle";
            _grvCampos.AlternatingRowStyle.CssClass = "alternatingrowstyle";
            _grvCampos.Width = Unit.Percentage(100);

            BoundField clmEtiqueta = new BoundField();
            clmEtiqueta.HeaderText = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CamposRecursoKCG.Text").ToString();
            clmEtiqueta.DataField = "Ver_etiqueta_Nombre";

            TemplateField clmCheck = new TemplateField();
            clmCheck.HeaderText = "Visible";
            clmCheck.ItemTemplate = new CheckTemplate();
            
            if (!Page.IsPostBack)
            {
                _grvCampos.DataKeyNames = new string[] { "Dic_con_Campo_Id" };
            }

            _grvCampos.Columns.Add(clmEtiqueta);
            _grvCampos.Columns.Add(clmCheck);
            _pnlContenedorVentanaCampo.Controls.Add(_grvCampos);
            
            _grvCampos.DataSource = _litCampos;
            _grvCampos.DataBind();

            _pnlContenedorVentanaCampo.Controls.Add(new LiteralControl("<br />"));

            Panel pnlBotones = new Panel();
            pnlBotones.ID = "pnlBotonesC";
            pnlBotones.Height = Unit.Pixel(21);
            pnlBotones.Width = Unit.Pixel(450);
            pnlBotones.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            pnlBotones.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
            pnlBotones.Style.Add(HtmlTextWriterStyle.TextAlign, "center");

            Button btnActualizarCampos = new Button();
            btnActualizarCampos.ID = "btnPrueba";
            btnActualizarCampos.Text = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_AceptarRecursoKCG.Text").ToString();
            btnActualizarCampos.Click += btnActualizarCampos_Click;
            btnActualizarCampos.CssClass = "filtroControles";

            pnlBotones.Controls.Add(btnActualizarCampos);
            _pnlContenedorVentanaCampo.Controls.Add(pnlBotones);

            Controls.Add(_pnlContenedorVentanaCampo);

            mpeVentanaCampo.TargetControlID = "btnCampos";
            mpeVentanaCampo.PopupControlID = "pnlContenedorC";
            mpeVentanaCampo.CancelControlID = "btnCerrarIDC";
            mpeVentanaCampo.PopupDragHandleControlID = "pnlMoverC";
            mpeVentanaCampo.BackgroundCssClass = "modalBackground";

            Controls.Add(mpeVentanaCampo);
        }
        #endregion

        #region btnActualizarCampos_Click
        //Este evento solo se lo controla para causar un
        //postback desde la venta de campos, con el fin
        //de controlar los eventos ChechedChange de los
        //checks del GridView y mandar ACTUALIZAR LA PAGINA
        void btnActualizarCampos_Click(object sender, EventArgs e)
        {HttpContext.Current.Response.
            Redirect(HttpContext.Current.Request.Url.AbsoluteUri);}
        #endregion

        #region itemfiltro_FiltroCambioEvent
        void itemfiltro_FiltroCambioEvent(KItemFiltroEventArgs e)
        {
            Control control = Controls[0].FindControl(e.Campo);
            if (control != null)
            {
                if(control is KFiltroRango)
                {
                    KFiltroRango controlRango = (KFiltroRango) control;
                    controlRango.NumeroInicio = e.ItemEditado.Valor[0].ToString();
                    controlRango.NumeroFin = e.ItemEditado.Valor[1].ToString();
                }
                else if (control is KFiltroTexto)
                {
                    KFiltroTexto controlTexto = (KFiltroTexto) control;
                    controlTexto.TextoDeFiltrado = e.ItemEditado.Valor[0].ToString();
                }
                else if(control is KFiltroRangoFecha)
                {
                    KFiltroRangoFecha controlRangoFecha = (KFiltroRangoFecha) control;
                    controlRangoFecha.FechaInicio = e.ItemEditado.Valor[0].ToString();
                    controlRangoFecha.FechaFin = e.ItemEditado.Valor[1].ToString();
                    controlRangoFecha.FiltroSeleccionado = "FEC";
                }
                else if(control is KFiltroComboSeleccion)
                {
                    KFiltroComboSeleccion controlSeleccion = (KFiltroComboSeleccion)control;
                    controlSeleccion.FiltroSeleccionado = e.ItemEditado.Valor[0].ToString();
                }
            }
        }
        #endregion

        #region fitroFecha_Post
        /*private void fitroFecha_Post(object sender, EventArgs e)
        {
            mpeVentanaFiltro.Show();
        }*/
        #endregion

        public void Mostrar()
        {
            mpeVentanaFiltro.Show();
        }        

        #region InicializarBotones
        private void InicializarBotones()
        {
            bntBuscar = new Button();
            bntBuscar.ID = "bntBuscar";
            bntBuscar.Text =
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_BuscarRecursoKCG.Text").ToString();
            bntBuscar.Click += bntBuscar_Click;
            bntBuscar.CssClass = "filtroControles";

            btnCampos = new Button();
            btnCampos.ID = "btnCampos";
            btnCampos.Text = 
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CamposRecursoKCG.Text").ToString();
            btnCampos.Click += btnCampos_Click;
            btnCampos.CssClass = "filtroControles";

            btnAvanzada = new Button();
            btnAvanzada.Text =
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_AvanzadoRecursoKCG.Text").ToString();
            btnAvanzada.CssClass = "filtroControles";

            bntLimpiar = new Button();
            bntLimpiar.ID = "bntLimpiar";
            bntLimpiar.Text =
                HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_LimpiarRecursoKCG.Text").ToString();

            bntLimpiar.Click += bntLimpiar_Click;
            bntLimpiar.CssClass = "filtroControles";
        }
        #endregion

        #region InicializarVentanaCampos
        protected void InicializarVentanaCampos()
        {
            mpeVentanaCampo = new ModalPopupExtender();
            _pnlContenedorVentanaCampo = new Panel();
            _grvCampos = new GridView();
            _grvCampos.AutoGenerateColumns = false;
            _litCampos = new List<Par_Filtro>();
        }
        #endregion

        #region btnCampos_Click
        void btnCampos_Click(object sender, EventArgs e)
        {
            mpeVentanaFiltro.Show();
            mpeVentanaCampo.Show();

        }
        #endregion

        #region bntLimpiar_Click
        private void bntLimpiar_Click(object sender, EventArgs e)
        {
            foreach (Control control in Controls[0].Controls)
            {
                if (control is KFiltroTexto)
                {
                    ((KFiltroTexto) control).Limpiar();
                    ParametrosFiltro[control.ID].EstablecerValoresDeFiltradoInterno(
                        ((IFiltroVacio)control).FiltroVacio, ((KFiltroTexto)control).TextoDeFiltrado);
                }
                else if (control is KFiltroComboSeleccion)
                {
                    ((KFiltroComboSeleccion) control).FiltroSeleccionado = "";
                    ParametrosFiltro[control.ID].EstablecerValoresDeFiltradoInterno(((IFiltroVacio)control).FiltroVacio,"");
                }
                else if (control is KFiltroRadioSeleccion)
                {
                    ((KFiltroRadioSeleccion) control).FiltroSeleccionado = "";
                    ParametrosFiltro[control.ID].EstablecerValoresDeFiltradoInterno(((IFiltroVacio)control).FiltroVacio, "");
                }
                else if (control is KFiltroRango)
                {
                    ((KFiltroRango) control).NumeroInicio = "";
                    ((KFiltroRango) control).NumeroFin = "";
                    ParametrosFiltro[control.ID].EstablecerValoresDeFiltradoInterno(((IFiltroVacio)control).FiltroVacio,"","");
                }
                else if (control is KFiltroRangoFecha)
                {
                    ((KFiltroRangoFecha) control).FechaInicio = "";
                    ((KFiltroRangoFecha) control).FechaFin = "";
                    ((KFiltroRangoFecha) control).FiltroSeleccionado = "FEC";
                    ParametrosFiltro[control.ID].EstablecerValoresDeFiltradoInterno(((IFiltroVacio)control).FiltroVacio,"", "");
                }
            }
            AplicarFiltro();
            mpeVentanaFiltro.Show();
        }
        #endregion

        #region bntBuscar_Click
        private void bntBuscar_Click(object sender, EventArgs e)
        {
            OnBuscar(e);
            AplicarFiltro();
            //Page.Cache[_ods.CacheKeyDependency] = new object();
            mpeVentanaFiltro.Show();
        }
        #endregion

        #region AplicarFiltro
        public void AplicarFiltro()
        {
            // V 1.7
            // Para esta versión se agrego esta condición para verificar si
            // la página aplica paginación fina o no, en caso de aplicar PF
            // no se realizara este código el cual su funcionalidad es aplicar
            // un FilterExpression al GridView
            if (!PaginacionFina)
            {
                BuscarOds();
                StringBuilder filtradoTotal = new StringBuilder();

                if (!_filtrosConstruido)
                {
                    EnsureChildControls();
                    AgregarParametrosDeFiltradoDelUsuario();
                    _filtrosConstruido = true;
                }

                foreach (KeyValuePair<string, KItemFiltro> parametroFiltrado in _filtros)
                {
                    if (parametroFiltrado.Value.Valor == null) continue;
                    if (string.IsNullOrEmpty(parametroFiltrado.Key)) continue;

                    switch (parametroFiltrado.Value.TipoFiltro)
                    {
                        case KItemFiltro.TipoItemFiltro.Texto:
                            {
                                string campo = parametroFiltrado.Key;
                                string filtrado = KFiltroTexto.NormalizarTextoDeFiltrado(parametroFiltrado.Value.Valor[0].ToString());

                                if (filtrado != "%" && !string.IsNullOrEmpty(filtrado))
                                {
                                    StringBuilder filtradoCampo = new StringBuilder();

                                    if (filtradoTotal.Length > 0)
                                        filtradoTotal.Append("AND ");

                                    filtradoCampo.Append(campo);
                                    filtradoCampo.Append(" LIKE ");
                                    filtradoCampo.Append("'");
                                    filtradoCampo.Append(filtrado);
                                    filtradoCampo.Append("' ");
                                    filtradoTotal.Append(filtradoCampo);

                                }
                                break;
                            }
                        case KItemFiltro.TipoItemFiltro.ComboSeleccion:
                        case KItemFiltro.TipoItemFiltro.RadioSeleccion:
                            {
                                string campo = parametroFiltrado.Key;
                                string filtrado = parametroFiltrado.Value.Valor[0].ToString();

                                if (!string.IsNullOrEmpty(filtrado))
                                {
                                    StringBuilder filtradoCampo = new StringBuilder();

                                    if (filtradoTotal.Length > 0)
                                        filtradoTotal.Append("AND ");

                                    filtradoCampo.Append(campo);
                                    filtradoCampo.Append(" = ");
                                    filtradoCampo.Append("'");
                                    filtradoCampo.Append(filtrado);
                                    filtradoCampo.Append("' ");
                                    filtradoTotal.Append(filtradoCampo);
                                }
                                break;
                            }
                        case KItemFiltro.TipoItemFiltro.Rango:
                            {
                                string campo = parametroFiltrado.Key;
                                string filtradoInicio = parametroFiltrado.Value.Valor[0].ToString();
                                string filtradoFin = parametroFiltrado.Value.Valor[1].ToString();
                                string tipoDato = parametroFiltrado.Value.TipoDato;

                                if (campo == "Codigo")
                                {
                                    campo = "Codigo_int";
                                }

                                if (!string.IsNullOrEmpty(campo))
                                {
                                    if (!string.IsNullOrEmpty(filtradoInicio))
                                    {
                                        StringBuilder srbfiltradoInicio = new StringBuilder();

                                        if (filtradoTotal.Length > 0)
                                            filtradoTotal.Append("AND ");

                                        srbfiltradoInicio.Append(campo);
                                        srbfiltradoInicio.Append(" >= ");

                                        if (tipoDato == "CHA" || tipoDato == "VAR")
                                            srbfiltradoInicio.Append("'");
                                        srbfiltradoInicio.Append(filtradoInicio);
                                        if (tipoDato == "CHA" || tipoDato == "VAR")
                                            srbfiltradoInicio.Append("'");
                                        srbfiltradoInicio.Append(" ");
                                        filtradoTotal.Append(srbfiltradoInicio);
                                    }

                                    if (!string.IsNullOrEmpty(filtradoFin))
                                    {
                                        StringBuilder srbfiltradoFin = new StringBuilder();

                                        if (filtradoTotal.Length > 0)
                                            filtradoTotal.Append("AND ");

                                        srbfiltradoFin.Append(campo);
                                        srbfiltradoFin.Append(" <= ");
                                        if (tipoDato == "CHA" || tipoDato == "VAR")
                                            srbfiltradoFin.Append("'");
                                        srbfiltradoFin.Append(filtradoFin);
                                        if (tipoDato == "CHA" || tipoDato == "VAR")
                                            srbfiltradoFin.Append("'");
                                        srbfiltradoFin.Append(" ");
                                        filtradoTotal.Append(srbfiltradoFin);
                                    }
                                }
                                break;
                            }
                        case KItemFiltro.TipoItemFiltro.RangoFecha:
                            {
                                string campo = parametroFiltrado.Key;
                                string filtradoInicio = parametroFiltrado.Value.Valor[0].ToString();
                                string filtradoFin = parametroFiltrado.Value.Valor[1].ToString();

                                if (!string.IsNullOrEmpty(campo))
                                {
                                    if (!string.IsNullOrEmpty(filtradoInicio))
                                    {
                                        StringBuilder srbfiltradoInicio = new StringBuilder();

                                        if (filtradoTotal.Length > 0)
                                            filtradoTotal.Append("AND ");

                                        srbfiltradoInicio.Append(campo);
                                        srbfiltradoInicio.Append(" >= ");
                                        srbfiltradoInicio.Append("'");
                                        srbfiltradoInicio.Append(filtradoInicio);
                                        srbfiltradoInicio.Append(" 00:00:00");
                                        srbfiltradoInicio.Append("' ");
                                        filtradoTotal.Append(srbfiltradoInicio);
                                    }

                                    if (!string.IsNullOrEmpty(filtradoFin))
                                    {
                                        StringBuilder srbfiltradoFin = new StringBuilder();

                                        if (filtradoTotal.Length > 0)
                                            filtradoTotal.Append("AND ");

                                        srbfiltradoFin.Append(campo);
                                        srbfiltradoFin.Append(" <= ");
                                        srbfiltradoFin.Append("'");
                                        srbfiltradoFin.Append(filtradoFin);
                                        srbfiltradoFin.Append(" 23:59:59");
                                        srbfiltradoFin.Append("' ");
                                        filtradoTotal.Append(srbfiltradoFin);
                                    }
                                }
                                break;
                            }
                    }

                }
                _ods.FilterExpression = filtradoTotal.ToString();
                if (string.IsNullOrEmpty(_ods.FilterExpression))
                    _ods.FilterParameters.Clear();
            }
        }
        #endregion

        #region BuscarOds
        private void BuscarOds ()
        {
            if ( string.IsNullOrEmpty(ObjectDataSourceID) )
                throw new Exception("No existe ObjectDataSourceID para filtrado");
            _ods = (ObjectDataSource)Parent.FindControl(ObjectDataSourceID);
            if ( _ods == null )
                throw new Exception("No existe ObjectDataSource con ID: " + ObjectDataSourceID);
        }
        #endregion

        #region ObtenerEtitquetaDeRecurso
        private string ObtenerEtitquetaDeRecurso(string Dic_Campo_Nombre)
        {
            StringBuilder stbIndiceRecurso = new StringBuilder();
            stbIndiceRecurso.Append("Bound");
            stbIndiceRecurso.Append(Dic_Campo_Nombre);
            stbIndiceRecurso.Append("RecursoKCG.HeaderText");
            return
                HttpContext.GetLocalResourceObject(Page.AppRelativeVirtualPath, 
                                                   stbIndiceRecurso.ToString()) as string;
        }
        #endregion

        #region ObtenerDatosFiltro
        private List<Par_Filtro> ObtenerDatosFiltro()
        {
            BO_Par_Filtro boParFiltro = new BO_Par_Filtro();
            List<Par_Filtro> listParFiltro = new List<Par_Filtro>();

            BO_Dic_Con_Objeto boDicConObjeto = new BO_Dic_Con_Objeto();
            List<Dic_Con_Objeto> listDicConObjeto = null;

            Exception excepcion = null;

            Scope s = (Scope) Context.Session[IndiceScope];
            if (s == null)
            {
                excepcion = new Exception("Scope es null en el indice " + IndiceScope);
            }
            
            try
            {
                listDicConObjeto = boDicConObjeto.GetByContenedorObjetoOrden("", s, Contenedor, Objeto, Orden);
                if (listDicConObjeto.Count == 1)
                    listParFiltro = boParFiltro.GetByConObjetoUsuario("",
                                                                  s,
                                                                  listDicConObjeto[0].Id,
                                                                  s.Int_Usuario_Id);
            }
            catch (Exception exc)
            {
                excepcion = exc;
                //throw;
            }

            OnMedatosConsultados(new KControlEventArgs(excepcion));

            return listParFiltro;
        }
        #endregion
    }
    #endregion

    #region CheckTemplate
    public class CheckTemplate : ITemplate
    {
        //private string _Dic_con_Campo_Id;

        public void InstantiateIn(Control container)
        {
            PlaceHolder ph = new PlaceHolder();
            CheckBox chbCheck = new CheckBox();
            chbCheck.CheckedChanged += new EventHandler(chbCheck_CheckedChanged);
            chbCheck.ID = "check";
            ph.Controls.Add(chbCheck);
            ph.DataBinding += new EventHandler(ph_DataBinding);
            container.Controls.Add(ph);
        }

        void chbCheck_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chbCheck = (CheckBox) sender;
            GridViewRow ri = (GridViewRow)chbCheck.NamingContainer;

            BO_Par_Filtro boParFiltro = new BO_Par_Filtro();

            Scope s = (Scope)HttpContext.Current.Session["Scope"];
            Par_Filtro nuevoFiltro = new Par_Filtro();

            if(chbCheck.Checked)
            {
                nuevoFiltro.Dic_con_Campo_Id = ObtenerDicConCampo(ri).Dic_con_Campo_Id;
                nuevoFiltro.Int_Usuario_Id = s.Int_Usuario_Id;
                try
                {
                    boParFiltro.Insert(s, nuevoFiltro);
                }
                catch (Exception ex)
                {
                    // V1.1
                    // Invoca el evento ErrorEncontrado del objeto KFiltro
                    // por medio del Grid donde se encuentra el Check
                    ((KFiltro)
                        ((GridView)ri.
                            NamingContainer).
                                NamingContainer).
                                    OnErrorEncontrado(new KControlEventArgs(ex)); 
                }
            }
            else
            {
                try
                {
                    boParFiltro.Delete(s, ObtenerDicConCampo(ri));
                }
                catch
                {
                    throw;
                }
            }
        }

        private Par_Filtro ObtenerDicConCampo(GridViewRow fila)
        {
            KFiltro filtro = (KFiltro) fila.NamingContainer.NamingContainer;
            return filtro.litCampos[fila.RowIndex];
        }

        static void ph_DataBinding(object sender, EventArgs e)
        {
            PlaceHolder ph = (PlaceHolder) sender;
            GridViewRow ri = (GridViewRow)ph.NamingContainer;
            string visible = (string)DataBinder.Eval(ri.DataItem, "Visible");
            if(visible == "S")
                ((CheckBox) ph.FindControl("check")).Checked = true;
        }
    }
    #endregion
}