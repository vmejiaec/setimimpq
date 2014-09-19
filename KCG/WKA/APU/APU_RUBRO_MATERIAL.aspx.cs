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
using System.Globalization;


public partial class APU_APU_RUBRO_MATERIAL : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    private void cargarBotones()
    {
        BtnRubro.Text = GetLocalResourceObject("Btn_Apu_Rubro_Material_RubroRecursoKCG.Text").ToString();
        BtnRubro.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Material_RubroRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox Cantidad = (TextBox)Fv.FindControl("Cantidad");
            if(Cantidad.Text == string.Empty)
                Cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

            TextBox costo_unitario = (TextBox)Fv.FindControl("costo_unitario");
            if (costo_unitario.Text == string.Empty)
                costo_unitario.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

            TextBox costo_total = (TextBox)Fv.FindControl("costo_total");
            if(costo_total.Text == string.Empty)
                costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);      
        }        
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
        get { return gvapu_rubro_material; }
    }

    protected override FormView Fv
    {
        get { return fvapu_rubro_material; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_rubro_material; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_rubro_material; }
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
        get { return "APU_RUBRO_MATERIAL"; }
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
    
    [WebMethod]
    static public string[] GetMaterial(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Material boApuRubroMaterial = new BO_Apu_Material();
        List<Apu_Material> litApuMaterial = boApuRubroMaterial.GetByLikeNombre("Nombre", s, prefixText + "%",s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuMaterial.Count && i < count; i++)
        {
            string value = litApuMaterial[i].Id + "||" +
                           litApuMaterial[i].Unidad + "||" +
                           litApuMaterial[i].Costo_Total.ToString();                           

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuMaterial[i].Nombre, value));
        }

        return opciones.ToArray();
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
