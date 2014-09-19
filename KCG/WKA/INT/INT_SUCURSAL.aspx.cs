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
using Koala.KoalaWebControls;
using System.Web.Services;
using FEL.INT;
using System.Collections.Generic;
public partial class INT_INT_SUCURSAL : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        fv_int_sucursal.DataBound += new EventHandler(fv_int_sucursal_DataBound);
        SeleccionarItemEnCarga("Int_Sucursal_Id");
    }

    public Int_Empresa Int_Empresa_Actual
    {
        get
        {
            if (ViewState["INT_EMPRESA"] == null)
                ViewState["INT_EMPRESA"] = ObtenerEmpresa();
            return (Int_Empresa)ViewState["INT_EMPRESA"];
        }
    }

    Int_Empresa ObtenerEmpresa()
    {

        FEL.INT.BO_Int_Empresa datos2 = new FEL.INT.BO_Int_Empresa();
        return datos2.GetById("", (Scope)Session["Scope"], Request.QueryString["Int_Empresa_Id"])[0];
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Int_Empresa_Id", Request.QueryString["Int_Empresa_Id"]));
            param.Add(new DictionaryEntry("Int_Empresa_Codigo", Int_Empresa_Actual.Codigo));
            param.Add(new DictionaryEntry("Int_Empresa_Nombre", Int_Empresa_Actual.Nombre));            

        }
        base.DefinirParametrosFijosDeInsercion(param);


    }

    void fv_int_sucursal_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList ddl_predeterminada = (DropDownList)Fv.FindControl("ddl_Predeterminada");
            TextBox predeterminada = (TextBox)Fv.FindControl("Predeterminada");
            predeterminada.Text = ddl_predeterminada.SelectedValue;
        }      
    }

    protected void btnEmpresa_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/INT/INT_EMPRESA.aspx?Int_Empresa_Id=" + Request.QueryString["Int_Empresa_Id"]);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Int_Sucursal); }
    }

    protected override GridView Gv
    {
        get { return gv_int_sucursal; }
    }

    protected override FormView Fv
    {
        get { return fv_int_sucursal; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgv_int_sucursal; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfv_int_sucursal; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "INT_SUCURSAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] Get_Empresa(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.INT.BO_Int_Empresa IntEmpresa = new BO_Int_Empresa();
        List<Int_Empresa> litIntEmpresa = IntEmpresa.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litIntEmpresa.Count && i < count; i++)
        {
            string value = litIntEmpresa[i].Id + "||" +
                           litIntEmpresa[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litIntEmpresa[i].Nombre, value));
        }
        return opciones.ToArray();
    }


    [WebMethod]
    static public string[] Get_Moneda(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.INT.BO_Int_Moneda IntMoneda = new BO_Int_Moneda();
        List<Int_Moneda> litIntMoneda = IntMoneda.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litIntMoneda.Count && i < count; i++)
        {
            string value = litIntMoneda[i].Id + "||" +
                           litIntMoneda[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litIntMoneda[i].Nombre, value));
        }
        return opciones.ToArray();
    }        
                   
   
    protected void Predeterminada_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl_predeterminada = (DropDownList)sender;

        ddl_predeterminada.Attributes.Add("onchange", "checkSelectedValue_Predeterminado()");

        TextBox predeterminada = (TextBox)Fv.FindControl("Predeterminada");
        ddl_predeterminada.SelectedValue = predeterminada.Text;

        if (Fv.CurrentMode == FormViewMode.Insert)
            ddl_predeterminada.SelectedValue = "S";
    }


}
