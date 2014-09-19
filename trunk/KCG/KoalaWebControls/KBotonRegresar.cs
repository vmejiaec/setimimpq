using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Koala.KoalaWebControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:KBotonRegresar runat=server></{0}:KBotonRegresar>")]
    public class KBotonRegresar : Button
    {
        protected override void OnClick(EventArgs e)
        {
            //((HER.KPagina)Page).RedireccionarUrlAnterior();
            base.OnClick(e);
        }

        protected override void OnLoad(EventArgs e)
        {
            Text = HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_Pagina_AnteriorRecursoKCG.Text").ToString();
            base.OnLoad(e);
        }
    }
}
