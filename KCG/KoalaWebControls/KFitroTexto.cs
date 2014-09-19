using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koala.KoalaWebControls
{
    [DefaultProperty("")]
    [ToolboxData("<{0}:KFiltroTexto runat=server></{0}:KFiltroTexto>")]
    public class KFiltroTexto : CompositeControl, IFiltroVacio
    {
        // texto de incio del texto
        private const string _textoDeInicio = "[%]";
        
        // Caracteres especiales, el primer simbolo siempre debe ser [
        public static readonly string[] _caracteresEspeciales = {
                                                                    "[", "]", "~",
                                                                    "(", ")", "#",
                                                                    "/", @"\", "=",
                                                                    ">", "<", "+",
                                                                    "-", "*", "&",
                                                                    "|", "^", "'",
                                                                    "%"
                                                                };

        private Unit _ancho = Unit.Pixel(0);

        private Label lblEtiqueta;
        private TextBox txbFiltrado;

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
        [DefaultValue("%")]
        [Description("Texto de filtrado")]
        public string TextoDeFiltrado
        {
            get
            {
                EnsureChildControls();
                return txbFiltrado.Text;
            }

            set
            {
                EnsureChildControls();
                txbFiltrado.Text = value;
            }
        }

        public Unit Ancho
        {
            get { return _ancho; }

            set { _ancho = value; }
        }

        public bool FiltroVacio
        {
            get
            {
                return _textoDeInicio == TextoDeFiltrado;
            }
        }

        public string ObtenerTextoDeFiltradoNormalizado()
        {
            return NormalizarTextoDeFiltrado(TextoDeFiltrado);
        }

        public void Limpiar()
        {
            TextoDeFiltrado = _textoDeInicio;
        }

        public static string NormalizarTextoDeFiltrado(string texto)
        {
            StringBuilder sb = new StringBuilder(texto.Trim(' '));
            const string comodinFiltrado = "¿¡__!?";

            //Se verifica para reempazar comodines
            if ( texto.Length >= _textoDeInicio.Length )
            {
                //temporal inicio
                sb.Replace(_textoDeInicio, comodinFiltrado, 0, _textoDeInicio.Length);

                //temporal fin
                sb.Replace(_textoDeInicio, comodinFiltrado, sb.Length - _textoDeInicio.Length, _textoDeInicio.Length);
            }

            const string comodinCorcheteDerecho = "¿¡_____!?";
            sb.Replace("[", "[[" + comodinCorcheteDerecho);

            for (int indice = 1; indice < _caracteresEspeciales.Length; indice++)
            {
                string caracterEspecial = _caracteresEspeciales[indice];
                string caracterNormalizado = "[" + caracterEspecial + "]";
                sb.Replace(caracterEspecial, caracterNormalizado);
            }
            sb.Replace(comodinCorcheteDerecho, "]");
            sb.Replace(comodinFiltrado, "%");
            return sb.ToString();
        }


        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Controls.Clear();
            InicializarComponentes();
            Controls.Add(lblEtiqueta);
            Controls.Add(txbFiltrado);
        }

        protected void InicializarComponentes()
        {
            txbFiltrado = new TextBox();
            txbFiltrado.Text = _textoDeInicio;
            if (Ancho != Unit.Pixel(0))
                txbFiltrado.Width = Ancho;
            //txbFiltrado.Style.Add(HtmlTextWriterStyle.FontSize, "small");
            txbFiltrado.CssClass = "filtroControles";
            lblEtiqueta = new Label();
        }

        /*internal void AsignarAnchoTextBox(Unit ancho)
        {
            txbFiltrado.Width = ancho;
        }*/
    }
}