using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;


public partial class APU_APU_RUBRO_TRANSPORTE : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
    }
    
    private void cargarBotones()
    {
        BtnRubro.Text = GetLocalResourceObject("Btn_Apu_Rubro_Transporte_RubroRecursoKCG.Text").ToString();
        BtnRubro.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Transporte_RubroRecursoKCG.ToolTip").ToString();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Rubro_Material); }
    }

    protected override GridView Gv
    {
        get { return gvapu_rubro_transporte; }
    }

    protected override FormView Fv
    {
        get { return fvapu_rubro_transporte; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_rubro_transporte; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_rubro_transporte; }
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
        get { return "APU_RUBRO_TRANSPORTE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", Server.UrlDecode(Request.QueryString["Apu_Rubro_Nombre"])));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", Request.QueryString["Apu_Rubro_Unidad"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
    protected void BtnRubro_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        Response.Redirect("~/APU/APU_RUBRO.aspx?Apu_Rubro_Id=" + RubroId.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }   
}
