using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using FEL.VER;

namespace Koala.KoalaWebControls
{
    [DefaultProperty("")]
    [ToolboxData("<{0}:KFiltroRadioSeleccion runat=server></{0}:KFiltroRadioSeleccion>")]
    public class KFiltroRadioSeleccion : CompositeControl, IFiltroVacio
    {
        private Label lblEtiqueta;
        private RadioButtonList rblOpcionesSeleccion;
        //private CheckBoxList rblOpcionesSeleccion;

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
        [Description("Seleccion actual de filtrado")]
        public ListItem ItemFiltroSeleccionado
        {
            get
            {
                EnsureChildControls();
                return rblOpcionesSeleccion.SelectedItem;
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
                return rblOpcionesSeleccion.SelectedValue;
            }
            set
            {
                EnsureChildControls();
                rblOpcionesSeleccion.SelectedValue = value;
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
                string s = (string) ViewState["IndiceScope"];
                return (s == null) ? String.Empty : s;
            }

            set { ViewState["IndiceScope"] = value; }
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
                string s = (string) ViewState["CampoID"];
                return (s == null) ? String.Empty : s;
            }

            set { ViewState["CampoID"] = value; }
        }

        public bool FiltroVacio
        {
            get { return FiltroSeleccionado == ""; }
        }

        protected void ObtenerDatosDeDominio()
        {
            BO_Ver_Dominio BoVerDominio = new BO_Ver_Dominio();
            Scope s = (Scope) Context.Session[IndiceScope];
            VerificarScopeYCampoID(s);
            List<Ver_Dominio> listVerDominio = BoVerDominio.GetByCampo("Nombre", s, CampoID);
            rblOpcionesSeleccion.DataSource = listVerDominio;
            rblOpcionesSeleccion.DataValueField = "Dic_Dominio_Dominio";
            rblOpcionesSeleccion.DataTextField = "Nombre";
            rblOpcionesSeleccion.DataBind();
            
            StringBuilder opcionCombinada = new StringBuilder(3);

            for ( int i = 0; i < listVerDominio.Count; i++)
            {
                opcionCombinada.Append(listVerDominio[i].Nombre);
                if (i < listVerDominio.Count - 1)
                    opcionCombinada.Append("/");
            }

            rblOpcionesSeleccion.Items.Insert(0, new ListItem(opcionCombinada.ToString(),""));
            rblOpcionesSeleccion.Items[0].Selected = true;
        }

        protected void VerificarScopeYCampoID(Scope s)
        {
            if (s == null)
                throw new Exception("Scope es null en el indice " + IndiceScope);
            if (CampoID == string.Empty)
                throw new Exception("CampoID no asignado");
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Controls.Clear();
            InicializarComponentes();
            ObtenerDatosDeDominio();
            Controls.Add(lblEtiqueta);
            Controls.Add(rblOpcionesSeleccion);
        }

        protected void InicializarComponentes()
        {
            rblOpcionesSeleccion = new RadioButtonList();
            rblOpcionesSeleccion.CssClass = "filtroControles";
            //rblOpcionesSeleccion = new CheckBoxList();
            rblOpcionesSeleccion.RepeatDirection = RepeatDirection.Horizontal;
            rblOpcionesSeleccion.RepeatLayout = RepeatLayout.Flow;
            
            lblEtiqueta = new Label();
        }
    }
}