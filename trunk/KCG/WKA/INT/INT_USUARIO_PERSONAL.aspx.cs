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

public partial class INT_INT_USUARIO_PERSONAL : PaginaBaseKCG 
{
    public bool zoom = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        fvint_usuario_personal.DataBound += new EventHandler(fvint_usuario_personal_DataBound);
        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            zoom = true;
        }
    }

    void fvint_usuario_personal_DataBound(object sender, EventArgs e)
    {
        if (zoom)
        {
            TextBox Pred_seg_Rol_Nombre = (TextBox)fvint_usuario_personal.FindControl("Pred_seg_Rol_Nombre");
            TextBox Per_Personal_Nombre = (TextBox)fvint_usuario_personal.FindControl("Per_Personal_Nombre");
            Per_Personal_Nombre.Text = Pred_seg_Rol_Nombre.Text;
            Pred_seg_Rol_Nombre.Text = "";           
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Int_Usuario); }
    }

    protected override GridView Gv
    {
        get { return gvint_usuario_personal; }
    }

    protected override FormView Fv
    {
        get { return fvint_usuario_personal; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvint_usuario_personal; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsint_usuario_personal; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "INT_USUARIO_PERSONAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}


