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
using HER;

public partial class HIS_HIS_GENERAR_HISTORICO : KPagina
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    
    protected void Aceptar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/" + Request.QueryString["Dic_Contenedor_Nombre"] + 
            ".aspx?Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/" + Request.QueryString["Dic_Contenedor_Nombre"] + 
            ".aspx?Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }


}
