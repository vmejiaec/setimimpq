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
using FEL.VER;
using System.Web.Services;
using FEL.DIC;
using System.Collections.Generic;
using Koala.KoalaWebControls;

public partial class DIC_DIC_CAMPO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlFiltro.DataBind();
        btnConsultar.Click += new EventHandler(btnConsultar_Click);
        fvDicCampo.DataBound += new EventHandler(fvDicCampo_DataBound);
    }

    void fvDicCampo_DataBound(object sender, EventArgs e)
    {
        if (fvDicCampo.CurrentMode == FormViewMode.Insert)
        {
            DropDownList _valorFiltro = (DropDownList)Fv.FindControl("ddlfiltro");
            _valorFiltro.Text = "N";

            DropDownList _valorTipo = (DropDownList)Fv.FindControl("ddlTipoDato");
            _valorTipo.Text = "VAR";

            DropDownList _valorTipoC = (DropDownList)Fv.FindControl("ddlTipoConstraint");
            _valorTipoC.Text = "NIN";
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Campo); }
    }

    protected override GridView Gv
    {
        get { return GridView1; }
    }

    protected override FormView Fv
    {
        get { return fvDicCampo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicCampo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicCampo; }
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
        get { return "DIC_CAMPO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] Get_Objeto(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Objeto boDicObjeto = new BO_Dic_Objeto();

        List<Dic_Objeto> litDicObjeto = boDicObjeto.GetByNombre("Nombre", s, prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicObjeto.Count && i < count; i++)
        {
            string value = litDicObjeto[i].Id + "||" +
                           litDicObjeto[i].Codigo + "||" +
                           litDicObjeto[i].Nombre;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicObjeto[i].Nombre, value));
        }
        return opciones1.ToArray();
    }

    [WebMethod]
    static public string[] Get_Objeto_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Objeto boDicObjeto = new BO_Dic_Objeto();

        List<Dic_Objeto> litDicObjeto = boDicObjeto.GetByNombre("Nombre", s, prefixText + "%");

        List<string> opciones1 = new List<string>();
        for (int i = 0; i < litDicObjeto.Count && i < count; i++)
        {
            string value = litDicObjeto[i].Id + "||" +
                           litDicObjeto[i].Codigo;

            opciones1.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDicObjeto[i].Nombre, value));
        }
        return opciones1.ToArray();
    }

    void btnConsultar_Click(object sender, EventArgs e)
    {
        FEL.DIC.BO_Dic_Campo boDic_Campo = new BO_Dic_Campo();
        List<Dic_Campo> identificador = boDic_Campo.GetByObjeto("", (Scope)Session["Scope"], txtDic_Id.Text);
        string id;
        if (identificador.Count > 0)
        {
            id = identificador[0].Dic_Objeto_Id;
            txtDic_Id.Text = id;
            detSeleccionarItemEnCarga(null);
        }
    }

    protected void detSeleccionarItemEnCarga(string indiceSeleccionQuery)
    {
        string idSeleccion = null;
        if (!string.IsNullOrEmpty(indiceSeleccionQuery))
            idSeleccion = Request.QueryString[indiceSeleccionQuery];

        if (string.IsNullOrEmpty(idSeleccion))
        {
            Gv.DataBind();
            if (Gv.DataKeys.Count > 0)
            {
                Gv.SelectedIndex = 0;
                AsignarParametrosDataSourceDeatailsView(Gv.SelectedDataKey.Values["Id"].ToString());
                Fv.DefaultMode = FormViewMode.ReadOnly;
                Fv.ChangeMode(FormViewMode.ReadOnly);
            }
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(idSeleccion);
            Fv.DefaultMode = FormViewMode.ReadOnly;
            Fv.ChangeMode(FormViewMode.ReadOnly);
            SeleccionarItemGridView(idSeleccion);
        }
    }
}