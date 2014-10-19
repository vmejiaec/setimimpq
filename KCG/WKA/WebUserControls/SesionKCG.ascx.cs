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
using System.Text;

public partial class WebUserControls_SesionKCG : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LnkSesion.Text = ObtenerDatosDeSession();        
        }
    }

    private string ObtenerDatosDeSession()
    {
        Scope s = (Scope) Session["Scope"];
        StringBuilder stbSesion = new StringBuilder();
        //stbSesion.Append(s.Int_Empresa_Nombre);
        stbSesion.Append(s.Int_Empresa_Abreviatura);
        stbSesion.Append(" • ");
        //stbSesion.Append(s.Int_Sucursal_Nombre);
        stbSesion.Append(s.Int_Sucursal_Abreviatura);
        stbSesion.Append(" • ");
        stbSesion.Append(s.Seg_Rol_Nombre);
        stbSesion.Append(" • ");
        stbSesion.Append(s.Int_Usuario_Nombre);
        return stbSesion.ToString();
    }



    protected void LnkSesion_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        // Victor: para evitar el return URL
        Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        //FormsAuthentication.RedirectToLoginPage();
    }
}
