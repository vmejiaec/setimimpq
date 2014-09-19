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
using System.Web.Services;
using FEL.DIC;

public partial class DIC_DIC_OBJETO : PaginaBaseKCG
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
        get { return typeof(global::Dic_Objeto); }
    }

    protected override GridView Gv
    {
        get { return GridView1; }
    }

    protected override FormView Fv
    {
        get { return frmDicObjeto; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicObjeto; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicObjeto; }
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
        get { return "DIC_OBJETO"; }
    }

    [WebMethod]
    static public string[] Get_Modulo_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Modulo boDicModulo = new BO_Dic_Modulo();
        List<Dic_Modulo> litDicModulo = boDicModulo.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicModulo.Count && i < count; i++)
        {
            string value = litDicModulo[i].Id + "||" +
                           litDicModulo[i].Codigo;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicModulo[i].Nombre, value));
        }
        return opciones1.ToArray();
    }
}
