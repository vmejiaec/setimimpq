using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Security.Permissions;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koala.KoalaWebControls
{
    [
        AspNetHostingPermission(SecurityAction.Demand,
            Level = AspNetHostingPermissionLevel.Minimal),
        AspNetHostingPermission(SecurityAction.InheritanceDemand,
            Level = AspNetHostingPermissionLevel.Minimal),
        DefaultProperty("ValorScope"),
        ToolboxData("<{0}:KNavegacion runat=server></{0}:KNavegacion>")
    ]
    public class KNavegacion : CompositeControl
    {
        private GridView _gridView;
        //private FormView _formView;
        
        private ImageButton btnSiguiente;
        private ImageButton btnAnterior;
        private ImageButton btnPrimero;
        private ImageButton btnUltimo;


        private static readonly object eventNavegarKey = new object();

        [Category("Navegacion")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("ID del GridView")]
        public string GridViewID
        {
            get
            {
                string s = (string)ViewState["GridViewID"];
                return (s == null) ? String.Empty : s;
            }

            set { ViewState["GridViewID"] = value; }
        }

        [Category("Navegacion")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("ID del FormView")]
        public string FormViewID
        {
            get
            {
                string s = (string)ViewState["FormViewID"];
                return (s == null) ? String.Empty : s;
            }

            set { ViewState["FormViewID"] = value; }
        }

      
        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            InicializarControles();
            Controls.Add(btnPrimero);
            Controls.Add(btnAnterior);
            Controls.Add(btnSiguiente);
            Controls.Add(btnUltimo);
        }

        protected void InicializarControles()
        {
            btnSiguiente = new ImageButton();
            btnSiguiente.ImageUrl = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NextRecursoKCG.ImagenActiva").ToString();
            btnSiguiente.AlternateText = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NextRecursoKCG.Text").ToString();
            btnSiguiente.AccessKey = "3";
            btnSiguiente.ToolTip = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NextRecursoKCG.ToolTip").ToString();
            btnSiguiente.Click += new ImageClickEventHandler(btnSiguiente_Click);

            btnAnterior = new ImageButton();
            btnAnterior.ImageUrl = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_BeforeRecursoKCG.ImagenActiva").ToString();
            btnAnterior.AlternateText = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_BeforeRecursoKCG.Text").ToString();
            btnAnterior.AccessKey = "2";
            btnAnterior.ToolTip = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_BeforeRecursoKCG.ToolTip").ToString();
            btnAnterior.Click += new ImageClickEventHandler(btnAnterior_Click);

            btnPrimero = new ImageButton();
            btnPrimero.ImageUrl = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_FirstRecursoKCG.ImagenActiva").ToString();
            btnPrimero.AlternateText = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_FirstRecursoKCG.Text").ToString();
            btnPrimero.AccessKey = "4";
            btnPrimero.ToolTip = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_FirstRecursoKCG.ToolTip").ToString();
            btnPrimero.Click += new ImageClickEventHandler(btnPrimero_Click);

            btnUltimo = new ImageButton();
            btnUltimo.ImageUrl = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_LastRecursoKCG.ImagenActiva").ToString();
            btnUltimo.AlternateText = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_LastRecursoKCG.Text").ToString();
            btnUltimo.AccessKey = "1";
            btnUltimo.ToolTip = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_LastRecursoKCG.ToolTip").ToString();
            btnUltimo.Click += new ImageClickEventHandler(btnUltimo_Click);
        }

        bool GridTieneFilas ()
        {
            return !(_gridView.Rows.Count == 0);
        }

        void btnUltimo_Click(object sender, ImageClickEventArgs e)
        {
            BuscarGridView();

            if (!GridTieneFilas()) return;

            if (_gridView.SelectedIndex == -1)
            {
                _gridView.SelectedIndex = 0;
            }

            else
            {
                _gridView.PageIndex = _gridView.PageCount - 1;
                _gridView.DataBind();
                _gridView.SelectedIndex = _gridView.Rows.Count - 1;
            }

            OnNavegar(e);
        }

        void btnPrimero_Click(object sender, ImageClickEventArgs e)
        {
            BuscarGridView();
            if (!GridTieneFilas()) return;
            if (_gridView.SelectedIndex == -1)
            {
                _gridView.SelectedIndex = 0;
            }

            else
            {
                _gridView.PageIndex = 0;
                _gridView.SelectedIndex = 0;
            }
            OnNavegar(e);
        }

        void btnAnterior_Click(object sender, ImageClickEventArgs e)
        {
            BuscarGridView();
            if (!GridTieneFilas()) return;

            if (_gridView.SelectedIndex == -1)
            {
                _gridView.SelectedIndex = 0;
            }

            else if (_gridView.SelectedIndex > 0)
            {
                _gridView.SelectedIndex = _gridView.SelectedIndex - 1;
            }

            else if (_gridView.PageIndex > 0)
            {
                _gridView.PageIndex = _gridView.PageIndex - 1;
                _gridView.DataBind();
                _gridView.SelectedIndex = _gridView.PageSize - 1;
            }

            else if (_gridView.PageIndex == 0)
            {
                _gridView.PageIndex = _gridView.PageCount - 1;
                _gridView.DataBind();
                _gridView.SelectedIndex = _gridView.Rows.Count - 1;
            }

            OnNavegar(e);
        }

        void btnSiguiente_Click(object sender, ImageClickEventArgs e)
        {
            BuscarGridView();
            if (!GridTieneFilas()) return;

            if (_gridView.SelectedIndex == -1)
            {
                _gridView.SelectedIndex = 0;
            }

            else if (_gridView.SelectedIndex < _gridView.Rows.Count - 1)
            {
                _gridView.SelectedIndex = _gridView.SelectedIndex + 1;
            }

            else if (_gridView.PageIndex < _gridView.PageCount - 1)
            {
                _gridView.PageIndex = _gridView.PageIndex + 1;
                _gridView.SelectedIndex = 0;
            }

            else if (_gridView.PageIndex == _gridView.PageCount - 1)
            {
                _gridView.PageIndex = 0;
                _gridView.SelectedIndex = 0;
            }

            OnNavegar(e);
        }

        void BuscarGridView()
        {
            _gridView = (GridView)this.Parent.FindControl(GridViewID);
            if(_gridView == null)
                throw new Exception("No existe un GridView con ID " + GridViewID);
        }

        

        [
        Category("Action"),
        Description("Cuando el usuario da clic en siguinte")
        ]

        public event EventHandler Navegar
        {
            add { Events.AddHandler(eventNavegarKey, value); }
            remove { Events.RemoveHandler(eventNavegarKey, value); }
        }

        protected virtual void OnNavegar(EventArgs e)
        {
            EventHandler NavegarHandler = (EventHandler)Events[eventNavegarKey];
            if (NavegarHandler != null)
            {
                NavegarHandler(this, e);
            }
        }


    }
}
