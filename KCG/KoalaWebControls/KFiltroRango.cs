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

namespace Koala.KoalaWebControls
{
    [DefaultProperty("")]
    [ToolboxData("<{0}:KFiltroRango runat=server></{0}:KFiltroRango>")]
    public class KFiltroRango : CompositeControl, IFiltroVacio
    {
        private Label lblEtiqueta;
        private TextBox tbxNumeroFin;
        private TextBox tbxNumeroInicio;

        [
        Bindable(true),
        Category("Version"),
        DefaultValue(""),
        Description("Etiqueta del filtro")
        ]
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
        public string NumeroInicio
        {
            get
            {
                EnsureChildControls();
                return tbxNumeroInicio.Text;
            }

            set
            {
                EnsureChildControls();
                tbxNumeroInicio.Text = value;
            }
        }

        [Bindable(true)]
        [Category("Filtro")]
        [DefaultValue("")]
        [Localizable(true)]
        public string NumeroFin
        {
            get
            {
                EnsureChildControls();
                return tbxNumeroFin.Text;
            }

            set
            {
                EnsureChildControls();
                tbxNumeroFin.Text = value;
            }
        }

        [Bindable(true)]
        [Category("MetaData")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("Tipo de dato")]
        public string TipoDato
        {
            get
            {
                string s = (string)ViewState["TipoDato"];
                return (s == null) ? String.Empty : s;
            }

            set { ViewState["TipoDato"] = value; }
        }

        public bool FiltroVacio
        {
            get
            {
                return (NumeroFin == "" && NumeroInicio == "");
            }
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Controls.Clear();
            InicializarComponentes();
            Controls.Add(lblEtiqueta);
            Controls.Add(tbxNumeroInicio);
            Controls.Add(tbxNumeroFin);
        }


        private void InicializarComponentes()
        {
            lblEtiqueta = new Label();
            tbxNumeroInicio = new TextBox();
            tbxNumeroInicio.CssClass = "filtroControles";
            tbxNumeroFin = new TextBox();
            tbxNumeroFin.CssClass = "filtroControles";

            if(TipoDato == "NUM" || TipoDato == "FLO"
                || TipoDato == "INT" || TipoDato =="COD")
            {
                tbxNumeroInicio.Style.Add("text-align", "right");
                tbxNumeroFin.Style.Add("text-align", "right");
            }
        }
    }
}