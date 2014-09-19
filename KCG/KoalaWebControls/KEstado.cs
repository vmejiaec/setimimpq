/*
KOALA SOLUTION 
 
KEstado     - Controls para manejo de estado
KEstadoTemplate  - Template para el grid contenido en KEstado  
  
ver 1.2

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: Control Estado Asp.Net              
							
NOTAS DE DISEÑO
 * Version 1.0
   - Se define una única entrada (Ejecutar) para
     manejar los estados de ciaquier objeto.
   - La implementación del manejo des estados para cada
     estado están en los proyectos DEL y APR.

HISTORIA     					 
 * Version 1.0
   - Se presentan los errores en un panel en la parte inferior de la página.
 * Version 1.1
   - Cambio el método BuscarIndiceActual, se compara con Apr_Estado_Dominio,
     en lugar de Estado.
 * Version 1.2 [1-08-2008]
   - Cambio para asignar comandname de los botones a Arp_Estado_Dominio.
 
TRABAJO FUTURO
   - 
 
ÚLTIMA FECHA DE MODIFICACIÓN
1-08-2008 14H26

*/


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Security.Permissions;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using AjaxControlToolkit;
using FEL.APR;
using FEL.APROBACION;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;





namespace Koala.KoalaWebControls
{
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    [AspNetHostingPermission(SecurityAction.InheritanceDemand, Level = AspNetHostingPermissionLevel.Minimal)]
    [DefaultProperty("ObjetoNombre")]
    [ToolboxData("<{0}:KEstado runat=server></{0}:KEstado>")]
    public class KEstado : CompositeControl
    {
        //Controles
        private const string _indiceScope = "Scope";
        private Button _btnAbrir;
        private Button _btnAnterior;
        private Button _btnCerrar;
        private Button _btnSiguiente;
        private GridView _grvGrid;
        private Label _lblMensajeError;
        private Label _lblTituloVentana;
        private List<Apr_Doc_Estado> _lstEstados;
        private LiteralControl _ltcSeparacion;
        private ModalPopupExtender _mpeVentanaEstado;
        private Panel _pnlError;
        private Panel _pnlGrid;
        private Panel _pnlMover;
        private Panel _pnlVentana;


        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Valor actual del estado")]
        public string EstadoActualNombre
        {
            get
            {
                object s = ViewState["EstadoActualNombre"];
                return (string)s ?? string.Empty;
            }

            set
            {
                ViewState["EstadoActualNombre"] = value;
                EnsureChildControls();
                AsignarEstado();
            }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Valor actual del estado ID")]
        public string EstadoActualID
        {
            get
            {
                object s = ViewState["EstadoActualID"];
                return (string)s ?? string.Empty;
            }

            set { ViewState["EstadoActualID"] = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Nombre del objeto")]
        public string ObjetoNombre
        {
            get
            {
                object s = ViewState["ObjetoNombre"];
                return (string)s ?? string.Empty;
            }

            set { ViewState["ObjetoNombre"] = value; }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Nombre del campo de estado")]
        public string CampoNombre
        {
            get
            {
                object s = ViewState["CampoNombre"];
                return (string)s ?? string.Empty;
            }

            set { ViewState["CampoNombre"] = value; }
        }

        private DataTable ViewStateEstado
        {
            get
            {
                object s = ViewState["ViewStateEstado"];
                return (DataTable)s ?? null;
            }

            set { ViewState["ViewStateEstado"] = value; }
        }

        private List<Apr_Doc_Estado> Estados
        {
            get
            {
                if (_lstEstados == null)
                    _lstEstados = ConsultarEstados(ObjetoNombre, CampoNombre);
                return _lstEstados;
            }
        }

        private Scope Scope
        {
            get { return (Scope)HttpContext.Current.Session[_indiceScope]; }
        }

        private void AsignarEstado()
        {
            int indiceS = BuscarIndiceActual();
            _grvGrid.SelectedIndex = indiceS;

            if (indiceS != -1)
            {
                if (indiceS == 0)
                    _btnAnterior.Visible = false;
                else
                {
                    _btnAnterior.Text = "<< " + Estados[indiceS - 1].Ver_Doc_Estado_Nombre;
                    _btnAnterior.CommandName = Estados[indiceS - 1].Apr_Estado_Dominio;
                    _btnAnterior.Visible = true;
                }

                if (indiceS + 1 < Estados.Count)
                {
                    _btnSiguiente.Text = Estados[indiceS + 1].Ver_Doc_Estado_Nombre + " >>";
                    _btnSiguiente.CommandName = Estados[indiceS + 1].Apr_Estado_Dominio;
                    _btnSiguiente.Visible = true;
                }
                else
                    _btnSiguiente.Visible = false;
            }
            else
            {
                _btnAnterior.Visible = false;
                _btnSiguiente.Visible = false;
            }
        }

        private List<Apr_Doc_Estado> ConsultarEstados(string Objeto_Nombre, string Campo_Nombre)
        {
            BO_Apr_Doc_Estado boAprDocEstado = new BO_Apr_Doc_Estado();
            List<Apr_Doc_Estado> lstResultado = null;
            try
            {
                lstResultado = boAprDocEstado.GetByObjetoCampo("", Scope, Objeto_Nombre, Campo_Nombre);
            }
            catch
            {
                _lblMensajeError.Text = "Se produjo un error al colsultar estados";
            }
            return lstResultado;
        }

        protected void InicializarControles()
        {
            _ltcSeparacion = new LiteralControl("<br />");

            /* CONTROLS */

            //Boton Abrir
            _btnAbrir = new Button();
            _btnAbrir.ID = "btnAbrir";
            _btnAbrir.Text = "Estado";

            //Panel Ventana
            _pnlVentana = new Panel();
            _pnlVentana.ID = "pnlVentana";
            _pnlVentana.Style.Add(HtmlTextWriterStyle.Display, "none");
            _pnlVentana.CssClass = "filtro";

            //Extension ventana
            _mpeVentanaEstado = new ModalPopupExtender();
            _mpeVentanaEstado.TargetControlID = "btnAbrir";
            _mpeVentanaEstado.PopupControlID = "pnlVentana";
            _mpeVentanaEstado.CancelControlID = "btnCerrar";
            _mpeVentanaEstado.PopupDragHandleControlID = "pnlMover";

            /* PANEL VENTANA */

            //Panel Grid
            _pnlGrid = new Panel();
            _pnlGrid.ID = "pnlGrid";
            _pnlGrid.GroupingText = HttpContext.GetLocalResourceObject("~/KOALA.master", "Rec_Apr_EstadosRecursoKCG.Text").ToString();
            //_pnlGrid.GroupingText = "estados";
            _pnlGrid.Height = Unit.Pixel(150);
            _pnlGrid.ScrollBars = ScrollBars.Vertical;

            //Panel Mover
            _pnlMover = new Panel();
            _pnlMover.ID = "pnlMover";
            _pnlMover.Height = Unit.Pixel(21);
            _pnlMover.Width = Unit.Pixel(450);
            _pnlMover.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            _pnlMover.Style.Add(HtmlTextWriterStyle.Cursor, "move");
            _pnlMover.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");

            //Boton Anterior
            _btnAnterior = new Button();
            _btnAnterior.ID = "btnAnterior";
            _btnAnterior.Click += new EventHandler(_btnAnterior_Click);
            _btnAnterior.CssClass = "filtroControles";

            //Boton Siguiente
            _btnSiguiente = new Button();
            _btnSiguiente.ID = "btnSiguiente";
            _btnSiguiente.Click += new EventHandler(_btnSiguiente_Click);
            _btnSiguiente.CssClass = "filtroControles";

            //Panel Error
            _pnlError = new Panel();
            _pnlError.ID = "pnlError";
            _pnlError.Height = Unit.Pixel(21);
            _pnlError.Width = Unit.Pixel(450);
            _pnlError.BackColor = ColorTranslator.FromHtml("#A2ABBC");
            _pnlError.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
            _pnlError.Style.Add(HtmlTextWriterStyle.TextAlign, "center");

            /* PANEL MOVER */

            //Titulo Ventana
            _lblTituloVentana = new Label();
            _lblTituloVentana.ID = "lblTituloVentana";
            _lblTituloVentana.Text = HttpContext.GetLocalResourceObject("~/KOALA.master", "Tit_Apr_EstadosRecursoKCG.Text").ToString();
            //_lblTituloVentana.Text = "Estado Titulo";           
            _lblTituloVentana.ForeColor = Color.WhiteSmoke;
            _lblTituloVentana.Width = Unit.Pixel(429);
            _lblTituloVentana.Style.Add(HtmlTextWriterStyle.TextAlign, "left");

            //BotonCerrar
            _btnCerrar = new Button();
            _btnCerrar.ID = "btnCerrar";
            _btnCerrar.BorderStyle = BorderStyle.None;
            _btnCerrar.CssClass = "cerrar";
            _btnCerrar.Style.Add("cursor", "hand");

            /* PANEL GRID */

            //Grid
            _grvGrid = new GridView();
            _grvGrid.ID = "grvGrid";
            _grvGrid.AutoGenerateColumns = false;
            _grvGrid.HeaderStyle.CssClass = "headerstyle";
            _grvGrid.AlternatingRowStyle.CssClass = "alternatingrowstyle";
            _grvGrid.SelectedRowStyle.CssClass = "selectedrowstyle";
            _grvGrid.Width = Unit.Percentage(100);

            BoundField bfdOrden = new BoundField();
            // bfdOrden.HeaderText = "Orden";
            bfdOrden.HeaderText = HttpContext.GetLocalResourceObject("~/KOALA.master", "Apr_Estados_OrdenRecursoKCG.Text").ToString();
            bfdOrden.DataField = "Orden";


            TemplateField tpfEstadoNombreDescripcion = new TemplateField();
            tpfEstadoNombreDescripcion.HeaderText = HttpContext.GetLocalResourceObject("~/KOALA.master", "Apr_Estados_EstadoRecursoKCG.Text").ToString();
            //tpfEstadoNombreDescripcion.HeaderText = "Estados";
            tpfEstadoNombreDescripcion.ItemTemplate = new KEstadoTemplate();

            _grvGrid.Columns.Add(bfdOrden);
            _grvGrid.Columns.Add(tpfEstadoNombreDescripcion);

            /*PANEL ERROR*/

            //Label Mensaje error
            _lblMensajeError = new Label();
            _lblMensajeError.ID = "lblMensajeError";
            _lblMensajeError.EnableViewState = false;
            _lblMensajeError.ForeColor = Color.WhiteSmoke;
        }

        private void _btnSiguiente_Click(object sender, EventArgs e)
        {
            Ejecutar("ADELANTE", ((Button)sender).CommandName);
            _mpeVentanaEstado.Show();
        }

        private void _btnAnterior_Click(object sender, EventArgs e)
        {
            Ejecutar("ATRAS", ((Button)sender).CommandName);
            _mpeVentanaEstado.Show();
        }

        private void Ejecutar(string p_Accion, string p_Proceso)
        {
            BO_Aprobacion_Estado boAprobacionEstado = new BO_Aprobacion_Estado();
            try
            {
                bool cambioEstado = boAprobacionEstado.Ejecutar(Scope, p_Accion,
                                                                ObjetoNombre, CampoNombre,
                                                                EstadoActualID, p_Proceso);

                if (cambioEstado)
                {
                    EstadoActualNombre = p_Proceso;
                    OnEstadoActualizado(new EventArgs());
                }
            }
            catch (SoapException se)
            {
                _lblMensajeError.Text = ObtenerMensajeError(se.Detail["DetalleError"]);
            }
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();

            InicializarControles();

            _pnlMover.Controls.Add(_lblTituloVentana);
            _pnlMover.Controls.Add(_btnCerrar);

            _pnlGrid.Controls.Add(_grvGrid);

            _pnlError.Controls.Add(_lblMensajeError);

            _pnlVentana.Controls.Add(_pnlMover);
            _pnlVentana.Controls.Add(_pnlGrid);
            _pnlVentana.Controls.Add(new LiteralControl("<table width=\"100%\"><tr align=\"center\"><td>"));
            _pnlVentana.Controls.Add(_btnAnterior);
            _pnlVentana.Controls.Add(_btnSiguiente);
            _pnlVentana.Controls.Add(new LiteralControl("</td></tr></table>"));
            _pnlVentana.Controls.Add(_pnlError);

            _grvGrid.DataSource = Estados;
            _grvGrid.DataBind();

            Controls.Add(_pnlVentana);
            Controls.Add(_btnAbrir);
            Controls.Add(_mpeVentanaEstado);
        }

        private int BuscarIndiceActual()
        {
            for (int indice = 0; indice < Estados.Count; indice++)
            {
                if (Estados[indice].Apr_Estado_Dominio == EstadoActualNombre)
                    return indice;
            }
            return -1;
        }

        private string ObtenerMensajeError(XmlNode detalleMensajeError)
        {
            string CodigoError = "MSJ14";
            string MensajeError = "";
            if (detalleMensajeError != null)
            {
                CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
                MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
            }
            string pre_mensaje =
                HttpContext.GetLocalResourceObject("~/KOALA.master",
                                                   CodigoError + "RecursoKCG.Text").ToString();
            pre_mensaje = string.Format(pre_mensaje, MensajeError);
            return pre_mensaje;
        }

        private static readonly object EventEstadoActualizadoKey = new object();

        [Category("Action"),
         Description("Se ha actulizado el estado")]
        public event EventHandler EstadoActualizado
        {
            add { Events.AddHandler(EventEstadoActualizadoKey, value); }
            remove { Events.RemoveHandler(EventEstadoActualizadoKey, value); }
        }

        // esta mal que la busqueda este en le evento pq si no se atrapa no se filtra
        protected virtual void OnEstadoActualizado(EventArgs e)
        {
            EventHandler EstadoActualizadoHandler = (EventHandler)Events[EventEstadoActualizadoKey];
            if (EstadoActualizadoHandler != null)
            {
                EstadoActualizadoHandler(this, e);
            }
        }

    }

    internal class KEstadoTemplate : ITemplate
    {
        private HoverMenuExtender _hmeDescripcion;
        private Label _lblDescripcion;
        private Label _lblEstado;
        private PlaceHolder _plhContenedor;

        private Panel _pnlDescripcion;

        private Panel _pnlEstado;

        #region ITemplate Members

        public void InstantiateIn(Control container)
        {
            InicializarControles();

            _pnlDescripcion.Controls.Add(_lblDescripcion);
            _pnlEstado.Controls.Add(_lblEstado);

            _plhContenedor.Controls.Add(_pnlDescripcion);
            _plhContenedor.Controls.Add(_pnlEstado);
            _plhContenedor.Controls.Add(_hmeDescripcion);

            container.Controls.Add(_plhContenedor);
        }

        #endregion

        private void InicializarControles()
        {
            _plhContenedor = new PlaceHolder();
            _plhContenedor.DataBinding += new EventHandler(_plhContenedor_DataBinding);

            _pnlDescripcion = new Panel();
            _pnlDescripcion.CssClass = "popupMenu";
            _pnlDescripcion.Width = Unit.Pixel(200);
            _pnlDescripcion.ID = "pnlDescripcion";

            _lblDescripcion = new Label();
            _lblDescripcion.ID = "lblDescripcion";

            _pnlEstado = new Panel();
            _pnlEstado.ID = "pnlEstado";
            _pnlEstado.Width = Unit.Percentage(100);

            _lblEstado = new Label();
            _lblEstado.ID = "lblEstado";

            _hmeDescripcion = new HoverMenuExtender();
            _hmeDescripcion.HoverCssClass = "popupHover";
            _hmeDescripcion.PopupControlID = "pnlDescripcion";
            _hmeDescripcion.PopupPosition = HoverMenuPopupPosition.Right;
            _hmeDescripcion.TargetControlID = "pnlEstado";
            _hmeDescripcion.PopDelay = 25;
        }

        private static void _plhContenedor_DataBinding(object sender, EventArgs e)
        {
            PlaceHolder ph = (PlaceHolder)sender;
            GridViewRow ri = (GridViewRow)ph.NamingContainer;

            string descripcion = (string)DataBinder.Eval(ri.DataItem, "Descripcion");
            string estado = (string)DataBinder.Eval(ri.DataItem, "Ver_Doc_Estado_Nombre");

            ((Label)ph.FindControl("lblDescripcion")).Text = descripcion;
            ((Label)ph.FindControl("lblEstado")).Text = estado;
        }
    }
}