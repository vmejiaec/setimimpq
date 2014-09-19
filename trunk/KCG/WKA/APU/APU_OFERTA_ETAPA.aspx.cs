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

public partial class APU_APU_OFERTA_ETAPA : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta); }
    }

    protected override FormView Fv
    {
        get { return fvApuOfertaEtapa; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuOfertaEtapa; }
    }

    protected override string Contenedor
    {
        get { return "APU_OFERTA_ETAPA"; }
    }

    protected override void AsignarParametrosDataSourceDeatailsView(string id)
    {
        OdsDv.SelectParameters["Apu_Oferta_Id"].DefaultValue = id;
    }
    
    protected void Btn_Oferta_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_OFERTA.aspx?Apu_Oferta_Id=" + OfertaId.Text);        
    }
    protected void Btn_Apu_Proyecto_Cancelar_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Id");        
        Response.Redirect("~/APU/APU_OFERTA.aspx?Apu_Oferta_Id=" + OfertaId.Text);
    }
}
