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
using System.Collections.Generic;

public partial class DIC_DIC_DOMINIO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Dominio); }
    }

    protected override GridView Gv
    {
        get { return gvDicDominio; }
    }

    protected override FormView Fv
    {
        get { return fvDicDominio; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicDominio; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicDominio; }
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
        get
        {
            string s = ((TextBox)fvDicDominio.FindControl("Dic_Objeto_Id")).ClientID;
            return "DIC_DOMINIO"; }
    }

    // Autocompletar
    // Maestro: Click: Dic_Objeto_Nombre
    //          Id: Dic_Objeto_Id
    //          Codigo: Dic_Objeto_Codigo
    // Detalle: Click: Dic_Campo_Nombre
    //          Id: Dic_Campo_Id
    //          Codigo: Dic_Campo_Codigo

    #region WebServices para autocompletar
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxDic_Objeto_Nombre_GetList(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.DIC.BO_Dic_Objeto adp = new FEL.DIC.BO_Dic_Objeto();
        var lista = adp.GetByLikeNombre("Nombre", s, prefixText + "%" );
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Nombre, fila.Id + "||" + fila.Codigo  // 0 1
                    ));
        return items.ToArray();
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] acxDic_Campo_Nombre_GetList(string prefixText, int count, string contextKey)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.DIC.BO_Dic_Campo adp = new FEL.DIC.BO_Dic_Campo();
        var lista = adp.GetByLikeObjeto("Nombre",s, contextKey, prefixText + "%");
        //
        List<string> items = new List<string>();
        foreach (var fila in lista)
            items.Add(
                AjaxControlToolkit.AutoCompleteExtender.
                    CreateAutoCompleteItem(
                        fila.Nombre,
                        fila.Id.ToString() + "||" + fila.Codigo  // 0  1
                    ));
        return items.ToArray();
    }
    #endregion WebServices para autocompletar

}
