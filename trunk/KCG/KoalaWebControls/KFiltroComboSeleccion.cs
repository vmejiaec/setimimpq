using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using System.Security.Permissions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.DIC;
using FEL.PAR;
using FEL.VER;

namespace Koala.KoalaWebControls
{
    [DefaultProperty("")]
    [ToolboxData("<{0}:KFiltroComboSeleccion runat=server></{0}:KFiltroComboSeleccion>")]
    public class KFiltroComboSeleccion : CompositeControl, IFiltroVacio
    {
        private DropDownList ddlOpcionesSeleccion;
        private Label lblEtiqueta;

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
        [Description("Seleccion de item actual de filtrado")]
        public ListItem ItemFiltroSeleccionado 
        {
            get
            {
                EnsureChildControls();
                return ddlOpcionesSeleccion.SelectedItem;
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
                return ddlOpcionesSeleccion.SelectedValue;
            }
            set
            {
                EnsureChildControls();
                ddlOpcionesSeleccion.SelectedValue = value;
            }
        }

        [
        Bindable(true),
        Category("Filtro"),
        DefaultValue(""),
        Description("DOL o EST"),
        ]
        public string TipoConstraintFiltro
        {
            get
            {
                string s = (string)ViewState["TipoConstraintFiltro"];
                return (s == null) ? String.Empty : s;
            }
            set
            {
                ViewState["TipoConstraintFiltro"] = value;
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

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("ID del campo de filtrado")]
        public string CampoID
        {
            get
            {
                string s = (string)ViewState["CampoID"];
                return (s == null) ? String.Empty : s;
            }

            set
            {
                ViewState["CampoID"] = value;
            }
        }

        public bool FiltroVacio
        {
            get { return FiltroSeleccionado == ""; }
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Controls.Clear();
            InicializarComponentes();
            ObtenerDatosFiltro();
            Controls.Add(lblEtiqueta);
            Controls.Add(ddlOpcionesSeleccion);
        }

        protected void InicializarComponentes()
        {
            ddlOpcionesSeleccion = new DropDownList();
            ddlOpcionesSeleccion.CssClass = "filtroControles";
            lblEtiqueta = new Label();
        }

        protected void ObtenerDatosFiltro()
        {
            switch (TipoConstraintFiltro)
            {
                case "DOL":
                    ObtenerDatosDeDominio();
                    break;

                case "EST":
                    ObtenerDatosDeVersionEstado();
                    break;
           }
        }
        protected void ObtenerDatosDeVersionEstado()
        {
            BO_Ver_Doc_Estado boVerDocEstado = new BO_Ver_Doc_Estado();
            List<Ver_Doc_Estado> listVerDocEstado = null;
            Scope s = (Scope)Context.Session[IndiceScope];
            VerificarScopeYCampoID(s);
            listVerDocEstado = boVerDocEstado.GetByCampo("Nombre", s, CampoID);
            ddlOpcionesSeleccion.DataSource = listVerDocEstado;
            ddlOpcionesSeleccion.DataValueField = "Apr_Estado_Dominio";
            ddlOpcionesSeleccion.DataTextField = "Nombre";
            ddlOpcionesSeleccion.DataBind();
            ddlOpcionesSeleccion.Items.Insert(0, "");
        }

        protected void VerificarScopeYCampoID(Scope s)
        {
            if (s == null)
                throw new Exception("Scope es null en el indice " + IndiceScope);
            if (CampoID == string.Empty)
                throw new Exception("CampoID no asignado");
        }

        protected void ObtenerDatosDeDominio()
        {
            BO_Ver_Dominio BoVerDominio = new BO_Ver_Dominio();
            Scope s = (Scope)Context.Session[IndiceScope];
            VerificarScopeYCampoID(s);
            List<Ver_Dominio> listVerDominio = BoVerDominio.GetByCampo("Nombre", s, CampoID);
            ddlOpcionesSeleccion.DataSource = listVerDominio;
            ddlOpcionesSeleccion.DataValueField = "Dic_Dominio_Dominio";
            ddlOpcionesSeleccion.DataTextField = "Nombre";
            ddlOpcionesSeleccion.DataBind();
            ddlOpcionesSeleccion.Items.Insert(0, "");
        }
    }
}
