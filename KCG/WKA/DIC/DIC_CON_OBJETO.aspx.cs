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
using FEL.DIC;
using System.Collections.Generic;

public partial class DIC_DIC_CON_OBJETO :PaginaBaseKCG
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
        get { return typeof(global::Dic_Con_Objeto); }
    }

    protected override GridView Gv
    {
        get { return gvDicConObjeto; }
    }

    protected override FormView Fv
    {
        get { return fvDicConObjeto; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicConObjeto; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicConObjeto; }
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
        get { return "DIC_CON_OBJETO"; }
    }
    
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] Get_Contenedor_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Contenedor boDicContenedor = new BO_Dic_Contenedor();
        List<Dic_Contenedor> litDicContenedor = boDicContenedor.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicContenedor.Count && i < count; i++)
        {
            string value = litDicContenedor[i].Id + "||" +
                           litDicContenedor[i].Codigo;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicContenedor[i].Nombre, value));
        }
        return opciones1.ToArray();
    }

    [WebMethod]
    static public string[] Get_Objeto_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Objeto boDicObjeto = new BO_Dic_Objeto();
        List<Dic_Objeto> litDicObjeto = boDicObjeto.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicObjeto.Count && i < count; i++)
        {
            string value = litDicObjeto[i].Id + "||" +
                           litDicObjeto[i].Codigo;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicObjeto[i].Nombre, value));
        }
        return opciones1.ToArray();
    }
}
