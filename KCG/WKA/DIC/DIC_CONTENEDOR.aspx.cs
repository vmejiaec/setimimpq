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

public partial class DIC_DIC_CONTENEDOR : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Fv.ItemUpdating += new FormViewUpdateEventHandler(Fv_ItemUpdating);
        Fv.ItemInserting += new FormViewInsertEventHandler(Fv_ItemInserting);
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    void Fv_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        string tipo = HER.Navegacion.ObtenerValorControl(Fv.FindControl("ddlTipo"));
        e.Values["Tipo"] = tipo;

        string filtro = HER.Navegacion.ObtenerValorControl(Fv.FindControl("ddlFiltro"));
        e.Values["Filtro"] = filtro;
    }

    void Fv_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        string tipo = HER.Navegacion.ObtenerValorControl(Fv.FindControl("ddlTipo"));
        e.NewValues["Tipo"] = tipo;

        string filtro = HER.Navegacion.ObtenerValorControl(Fv.FindControl("ddlFiltro"));
        e.NewValues["Filtro"] = filtro;
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (fvDicContenedor.CurrentMode == FormViewMode.Edit)
        {
            DropDownList ddlTipo = (DropDownList)Fv.FindControl("ddlTipo");
            TextBox txbTipo = (TextBox)Fv.FindControl("Tipo");
            ddlTipo.SelectedValue = txbTipo.Text;
        }
        if (fvDicContenedor.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtFiltro = (TextBox)Fv.FindControl("Filtro");
            txtFiltro.Text = "S";

            DropDownList ddlTipo = (DropDownList)Fv.FindControl("ddlTipo");
            TextBox txbTipo = (TextBox)Fv.FindControl("Tipo");
            ddlTipo.SelectedValue = txbTipo.Text;
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Contenedor); }
    }

    protected override GridView Gv
    {
        get { return gvDicContenedor; }
    }

    protected override FormView Fv
    {
        get { return fvDicContenedor; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvDicContenedor; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvDicContenedor; }
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
        get { return "DIC_CONTENEDOR"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Filttro_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlFiltro = (DropDownList)sender;

        ddlFiltro.Attributes.Add("onchange", "checkSelectedValueFiltro()");

        TextBox Filtro = (TextBox)Fv.FindControl("Filtro");
        ddlFiltro.SelectedValue = Filtro.Text;

        if (Fv.CurrentMode == FormViewMode.Insert)
            ddlFiltro.SelectedValue = "S";
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