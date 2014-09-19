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

public partial class DIC_DIC_CON_CAMPO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        cargarBotones();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Con_Campo); }
    }

    protected override GridView Gv
    {
        get { return gvdicconcampo; }
    }

    protected override FormView Fv
    {
        get { return FormView1; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvdicconcampo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsdiccampo; }
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
        get { return "DIC_CON_CAMPO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    private void cargarBotones()
    {
        BtnEtiqueta.Text = GetLocalResourceObject("BTN_DIC_CON_CAMPO_ETIQUETARecursoKCG.Text").ToString();
        BtnEtiqueta.ToolTip = GetLocalResourceObject("BTN_DIC_CON_CAMPO_ETIQUETARecursoKCG.ToolTip").ToString();        
    } 

    [WebMethod]
    static public string[] GetContenedor(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Contenedor boDicContenedor = new BO_Dic_Contenedor();
        List<Dic_Contenedor> litDicContenedor = boDicContenedor.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litDicContenedor.Count && i < count; i++)
        {
            string value = litDicContenedor[i].Id  + "||" +
                           litDicContenedor[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicContenedor[i].Nombre, value));
        }

        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetObjeto(string prefixText, int count)
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

    [WebMethod]
    static public string[] GetDicObjeto(string prefixText, int count, string contextKey)  
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];
                
        FEL.DIC.BO_Dic_Con_Objeto boDicConObjeto = new BO_Dic_Con_Objeto();
        string contenedorId = "";
        string objetoId = "";

        string[] valores = contextKey.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);
        for (int x = 0; x < valores.Length ; x++)
        {
            if (x == 0)
                contenedorId = valores[x];
            if (x == 1)
                objetoId = valores[x];
        }
                           
        List<Dic_Con_Objeto> litDicConObjeto = boDicConObjeto.GetByLikeNombre("Nombre", s, contenedorId, objetoId, prefixText + "%");


        List<string> opciones2 = new List<string>();
        for (int i = 0; i < litDicConObjeto.Count && i < count; i++)
        {
            string value = litDicConObjeto[i].Id + "||" +
                           litDicConObjeto[i].Codigo;

            opciones2.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicConObjeto[i].Nombre, value));
        }

        return opciones2.ToArray();
    }

    [WebMethod]
    static public string[] GetCampo(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Campo boDicCampo = new BO_Dic_Campo();

        List<Dic_Campo> litDicCampo = boDicCampo.GetByLikeNombre("Nombre", s, contextKey,prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicCampo.Count && i < count; i++)
        {
            string value = litDicCampo[i].Id + "||" +
                           litDicCampo[i].Codigo + "||" +
                           litDicCampo[i].Sug_Dic_Rotulo_Id + "||" +
                           litDicCampo[i].Sug_Dic_Rotulo_Codigo + "||" +
                           litDicCampo[i].Sug_Dic_Rotulo_Nombre + "||" +
                           litDicCampo[i].SugTool_Dic_Rotulo_Id + "||" +
                           litDicCampo[i].SugTool_Dic_Rotulo_Codigo + "||" +
                           litDicCampo[i].SugTool_Dic_Rotulo_Nombre;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicCampo[i].Nombre, value));
        }

        return opciones1.ToArray();
    }
    protected void BtnEtiqueta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/VER/VER_ETIQUETA.aspx?");
    }
}
