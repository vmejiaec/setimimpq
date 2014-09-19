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
using FEL.INT;
using System.Web.Services;
using System.Collections.Generic;

public partial class SEG_SEG_ROL_USUARIO_DET : PaginaBaseKCG
{
    public Seg_Rol_Usuario Rol_Usuario_Actual
    {
        get
        {
            if (ViewState["SEG_ROL_USUARIO"] == null)
                ViewState["SEG_ROL_USUARIO"] = ObtenerRolUsuario();
            return (Seg_Rol_Usuario)ViewState["SEG_ROL_USUARIO"];
        }
    }

    Seg_Rol_Usuario ObtenerRolUsuario()
    {
        FEL.SEG.BO_Seg_Rol_Usuario datos = new FEL.SEG.BO_Seg_Rol_Usuario();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Seg_Rol_Usuario_Id"])[0];
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Seg_Rol_Usuario_Det); }
    }

    protected override GridView Gv
    {
        get { return gvSeg_Rol_Usuario_Det; }
    }

    protected override FormView Fv
    {
        get { return fvSegRolUsuarioDet; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvSeg_Rol_Usuario_Det; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVSegRolUsuarioDet; }
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
        get { return "SEG_ROL_USUARIO_DET"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    //protected override void AsignarParametrosDataSourceDeatailsView(string id)
    //{
    //    odsFVSegRolUsuarioDet.SelectParameters["Seg_Rol_Usuario_Id"].DefaultValue = id;
    //}

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {
            param.Add(new DictionaryEntry("Seg_Rol_Usuario_Id", Request.QueryString["Seg_Rol_Usuario_Id"]));
            param.Add(new DictionaryEntry("Seg_Rol_Usuario_Codigo", Rol_Usuario_Actual.Seg_Rol_Codigo));
            param.Add(new DictionaryEntry("Seg_Rol_Usuario_Nombre", Rol_Usuario_Actual.Seg_Rol_Nombre + " - " + Rol_Usuario_Actual.Int_usuario_nombre));
    }
    

    [WebMethod]
    static public string[] GetInt_Empresa_Nombre(string prefixText, int count)
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
    static public string[] GetInt_Sucursal_Nombre(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.INT.BO_Int_Sucursal IntSucursal = new BO_Int_Sucursal();
        List<Int_Sucursal> litIntSucursal = IntSucursal.GetByLikeEmpresa("",s,contextKey);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litIntSucursal.Count && i < count; i++)
        {
            string value =  litIntSucursal[i].Id + "||" +
                            litIntSucursal[i].Codigo;
            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litIntSucursal[i].Nombre,value));
        }
        return opciones.ToArray();
    }

    protected void btnSeg_Rol_Usu_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SEG/SEG_ROL_USUARIO.aspx?Seg_Rol_Usuario_Id=" +
            Request.QueryString["Seg_Rol_Usuario_Id"]);
    }

}
