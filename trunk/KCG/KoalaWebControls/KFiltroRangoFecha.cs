using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using FEL.DIC;
using FEL.VER;

namespace Koala.KoalaWebControls
{
    [DefaultProperty("")]
    [ToolboxData("<{0}:KFiltroRadioSeleccion runat=server></{0}:KFiltroRadioSeleccion>")]
    public class KFiltroRangoFecha : CompositeControl , IFiltroVacio
    {
        private Label lblEtiqueta;
        private DropDownList ddlOpcionesFiltradoFecha;
        private TextBox txbFechaInicio;
        private TextBox txbFechaFin;
        private AjaxControlToolkit.CalendarExtender cleFechaInicio;
        private AjaxControlToolkit.CalendarExtender cleFechaFin;

        [Bindable(true)]
        [Category("Version")]
        [DefaultValue("")]
        [Description("Etiqueta del filtro")]
        public string Etiqueta
        {
            get
            {
                EnsureChildControls();
                return lblEtiqueta.Text;
            }

            set
            {
                EnsureChildControls();
                lblEtiqueta.Text = value + ": ";
            }
        }

        [Bindable(true)]
        [Category("Filtro")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Seleccion actual de valor de filtrado")]
        public string FiltroSeleccionado
        {
            get
            {
                EnsureChildControls();
                return ddlOpcionesFiltradoFecha.SelectedValue;
            }
            set
            {
                EnsureChildControls();
                ddlOpcionesFiltradoFecha.SelectedValue = value;
            }
        }

        [Bindable(true)]
        [Category("Filtro")]
        [DefaultValue("")]
        [Localizable(true)]
        public string FechaInicio
        {
            get
            {
                EnsureChildControls();
                return txbFechaInicio.Text;
            }

            set
            {
                EnsureChildControls();
                txbFechaInicio.Text = value;
            }
        }

        [Bindable(true)]
        [Category("Filtro")]
        [DefaultValue("")]
        [Localizable(true)]
        public string FechaFin
        {
            get
            {
                EnsureChildControls();
                return txbFechaFin.Text;
            }

            set
            {
                EnsureChildControls();
                txbFechaFin.Text = value;
            }
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
                string s = (string)ViewState["IndiceScope"];
                return (s == null) ? String.Empty : s;
            }

            set
            {
                ViewState["IndiceScope"] = value;
            }
        }

        public bool FiltroVacio
        {
            get { return (FechaInicio == "" && FechaFin == ""); }
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Controls.Clear();
            InicializarComponentes();
            Controls.Add(lblEtiqueta);
            Controls.Add(ddlOpcionesFiltradoFecha);
            Controls.Add(txbFechaInicio);
            Controls.Add(txbFechaFin);
            Controls.Add(cleFechaInicio);
            Controls.Add(cleFechaFin);
        }

        protected void InicializarComponentes()
        {
            ddlOpcionesFiltradoFecha = new DropDownList();
            ObtenerDatosDeDominio();
            ddlOpcionesFiltradoFecha.CssClass = "filtroControles";
            ddlOpcionesFiltradoFecha.AutoPostBack = true;
            ddlOpcionesFiltradoFecha.SelectedIndexChanged += new EventHandler(cclOpcionesFiltradoFecha_SelectedIndexChanged);
            
            txbFechaInicio = new TextBox();
            txbFechaInicio.CssClass = "filtroControles";
            txbFechaInicio.ID = "txbFechaInicioID";
            txbFechaInicio.AutoPostBack = true;
            txbFechaInicio.TextChanged += new EventHandler(txbFechaInicio_TextChanged);
            
            txbFechaFin = new TextBox();
            txbFechaFin.CssClass = "filtroControles";
            txbFechaFin.ID = "txbFechaFinID";
            txbFechaFin.AutoPostBack = true;
            txbFechaFin.TextChanged += new EventHandler(txbFechaInicio_TextChanged);

            cleFechaInicio = new CalendarExtender();
            cleFechaInicio.TargetControlID = "txbFechaInicioID";
            cleFechaInicio.Format = "dd/MM/yyyy";
            
            cleFechaFin = new CalendarExtender();
            cleFechaFin.TargetControlID = "txbFechaFinID";
            cleFechaFin.Format = "dd/MM/yyyy";
            
            lblEtiqueta = new Label();
        }

        void txbFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (ddlOpcionesFiltradoFecha.SelectedValue != "FEC")
                ddlOpcionesFiltradoFecha.SelectedValue = "FEC";
            OnPost(e);
        }

        void cclOpcionesFiltradoFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch(ddlOpcionesFiltradoFecha.SelectedItem.Value)
            {
                case "FEC":
                    //txbFechaInicio.Text = "";
                    //txbFechaFin.Text = "";
                    break;
                case "DIA":
                    txbFechaInicio.Text = DateTime.Now.Date.ToShortDateString();
                    txbFechaFin.Text = DateTime.Now.Date.ToShortDateString();
                    break;
                case "SEM":
                    double diaSemanaActual = Convert.ToDouble(DateTime.Now.DayOfWeek);
                    DateTime inicioSemana = DateTime.Now.AddDays(-diaSemanaActual + 1.0);
                    DateTime finSemana = inicioSemana.AddDays(6.0);
                    txbFechaInicio.Text = inicioSemana.Date.ToShortDateString();
                    txbFechaFin.Text = finSemana.Date.ToShortDateString();
                    break;
                case "MES":
                    double diaMesActual = Convert.ToDouble(DateTime.Now.Date.Day);
                    DateTime inicioMes = DateTime.Now.AddDays(-diaMesActual + 1.0);
                    DateTime finMes = inicioMes.AddMonths(1).AddDays(-1.0);
                    txbFechaInicio.Text = inicioMes.Date.ToShortDateString();
                    txbFechaFin.Text = finMes.Date.ToShortDateString();
                    break;
                case "ANI":
                    double diaAnioActual = Convert.ToDouble(DateTime.Now.DayOfYear);
                    DateTime inicioAnio = DateTime.Now.AddDays(-diaAnioActual + 1.0);
                    DateTime finAnio = inicioAnio.AddYears(1).AddDays(-1.0);
                    txbFechaInicio.Text = inicioAnio.Date.ToShortDateString();
                    txbFechaFin.Text = finAnio.Date.ToShortDateString();
                    break;               
            }
            OnPost(e);
        }

        protected void ObtenerDatosDeDominio()
        {
            BO_Dic_General boDicGeneral= new BO_Dic_General();
            Scope s = (Scope)Context.Session[IndiceScope];
            VerificarScope(s);
            List<Dic_General> listDicGeneral = boDicGeneral.GetByTipo("Orden", s, "FEC");
            ddlOpcionesFiltradoFecha.DataSource = listDicGeneral;
            ddlOpcionesFiltradoFecha.DataValueField = "Dominio";
            ddlOpcionesFiltradoFecha.DataTextField = "Ver_Version_Nombre1";
            ddlOpcionesFiltradoFecha.DataBind();

        }

        protected void VerificarScope(Scope s)
        {
            if (s == null)
                throw new Exception("Scope es null en el indice " + IndiceScope);
        }


        private static readonly object EventPostKey = new object();

        /*void bntBuscar_Click(object sender, EventArgs e)
        {
            OnNavegar(e);
        }*/

        [
        Category("Action"),
        Description("Cuando el usuario interactua con el control de filtrado de fecha")
        ]
        public event EventHandler Post
        {
            add
            {
                Events.AddHandler(EventPostKey, value);
            }
            remove
            {
                Events.RemoveHandler(EventPostKey, value);
            }
        }

        protected virtual void OnPost(EventArgs e)
        {
            EventHandler PostHandler = (EventHandler)Events[EventPostKey];
            if (PostHandler != null)
            {
                PostHandler(this, e);
                //mpeVentanaFiltro.Show();
            }
        }
    }
}
