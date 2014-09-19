using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class INT_INT_USUARIO_CLAVE : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Int_Usuario); }
    }

    protected override FormView Fv
    {
        get { return fvIntUsuarioClave; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsIntUsuarioClave; }
    }

    protected override string Contenedor
    {
        get { return "INT_USUARIO_CLAVE"; }
    }
}
