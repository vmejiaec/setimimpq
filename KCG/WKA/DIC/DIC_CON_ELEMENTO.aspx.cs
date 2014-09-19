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
using System.Web.Services;
using FEL.DIC;
using System.Collections.Generic;

public partial class DIC_DIC_CON_ELEMENTO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        //base.Page_Load(sender, e);
    }
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Con_Elemento); }
    }

    protected override GridView Gv
    {
        get { return gvDicConElemento; }
    }

    protected override FormView Fv
    {
        get { return fvDicConElemento; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicConElemento; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicConElemento; }
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
        get { return "DIC_CON_ELEMENTO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] Get_Modulo_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Modulo boDicModulo = new BO_Dic_Modulo();
        List<Dic_Modulo> litDicModulo = boDicModulo.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litDicModulo.Count && i < count; i++)
        {
            string value = litDicModulo[i].Id + "||" +
                           litDicModulo[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicModulo[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_Contenedor_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Contenedor boDicContenedor = new BO_Dic_Contenedor();
        List<Dic_Contenedor> litDicContenedor = boDicContenedor.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litDicContenedor.Count && i < count; i++)
        {
            string value = litDicContenedor[i].Dic_Modulo_id + "||" +
                           litDicContenedor[i].Dic_Modulo_Codigo + "||" +
                           litDicContenedor[i].Dic_Modulo_Nombre + "||" +
                           litDicContenedor[i].Id + "||" +
                           litDicContenedor[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicContenedor[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_Rotulo_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Rotulo boDicRotulo = new BO_Dic_Rotulo();
        List<Dic_Rotulo> litDicRotulo = boDicRotulo.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litDicRotulo.Count && i < count; i++)
        {
            string value = litDicRotulo[i].Id + "||" +
                           litDicRotulo[i].Codigo + "||" +
                           litDicRotulo[i].Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicRotulo[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
