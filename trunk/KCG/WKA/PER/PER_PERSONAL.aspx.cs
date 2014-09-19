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
using FEL.PAR;
using System.Collections.Generic;

public partial class PER_PER_PERSONAL : PaginaBaseKCG
{
    string sValor = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sValor = Request.QueryString["valorCheck"];
            Session.Add("sNombre", sValor);
        }
        Fv_Per_Personal.DataBound += new EventHandler(Fv_Per_Personal_DataBound);       
    }

    void Fv_Per_Personal_DataBound(object sender, EventArgs e)
    {
        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
        {
            TextBox Jefe_Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Jefe_Fiscalizacion");
            DropDownList ddlJefe_Fiscalizacion = (DropDownList)Fv_Per_Personal.FindControl("ddlJefe_Fiscalizacion");
            if (Jefe_Fiscalizacion.Text == string.Empty)
                Jefe_Fiscalizacion.Text = ddlJefe_Fiscalizacion.SelectedValue;

            TextBox Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Fiscalizacion");
            DropDownList ddlFiscalizacion = (DropDownList)Fv_Per_Personal.FindControl("ddlFiscalizacion");
            if (Fiscalizacion.Text == string.Empty)
                Fiscalizacion.Text = ddlFiscalizacion.SelectedValue;

            TextBox Tecnico_Costos = (TextBox)Fv_Per_Personal.FindControl("Tecnico_Costos");
            DropDownList ddlTecnico_Costos = (DropDownList)Fv_Per_Personal.FindControl("ddlTecnico_Costos");
            if (Tecnico_Costos.Text == string.Empty)
                Tecnico_Costos.Text = ddlTecnico_Costos.SelectedValue;

            TextBox Contratista = (TextBox)Fv_Per_Personal.FindControl("Contratista");
            DropDownList ddlContratista = (DropDownList)Fv_Per_Personal.FindControl("ddlContratista");
            if (Contratista.Text == string.Empty)
                Contratista.Text = ddlContratista.SelectedValue;

            TextBox Tipo_Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Tipo_Fiscalizacion");
            DropDownList ddlTipo_Fiscalizacion = (DropDownList)Fv_Per_Personal.FindControl("ddlTipo_Fiscalizacion");
            if (Tipo_Fiscalizacion.Text == string.Empty)
                Tipo_Fiscalizacion.Text = ddlTipo_Fiscalizacion.SelectedValue;

            TextBox Coordinador = (TextBox)Fv_Per_Personal.FindControl("Coordinador");
            DropDownList ddlCoordinador = (DropDownList)Fv_Per_Personal.FindControl("ddlCoordinador");
            if (Coordinador.Text == string.Empty)
                Coordinador.Text = ddlCoordinador.SelectedValue;

            TextBox Int_Empresa_Nombre = (TextBox)Fv_Per_Personal.FindControl("Int_Empresa_Nombre");
            TextBox Par_Razon_Social_Numero = (TextBox)Fv_Per_Personal.FindControl("Par_Razon_Social_Numero");
            Par_Razon_Social_Numero.Text = Int_Empresa_Nombre.Text;
            Int_Empresa_Nombre.Text = "";
            Int_Empresa_Nombre.Visible = false;
            
        }
    }

    [WebMethod]
    static public string[] Get_Par_Tipo_Identificacion_Nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PAR.BO_Par_Tipo_Identificacion TipoIdentificacion = new BO_Par_Tipo_Identificacion();
        List<Par_Tipo_Identificacion> lstTipoIdentificacion = TipoIdentificacion.GetByLikeNombre("", s, prefixText + "%");
        List<string> opciones = new List<string>();
        for (int i = 0; i < lstTipoIdentificacion.Count; i++)
        {
            string value = lstTipoIdentificacion[i].Id;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstTipoIdentificacion[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_Par_Razon_Social_Numero(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PAR.BO_Par_Razon_Social RazonSocial = new BO_Par_Razon_Social();
        List<Par_Razon_Social> lstRazonSocial = RazonSocial.GetByLikeNombre("", s, contextKey, prefixText + "%");
        List<string> opciones = new List<string>();
        for (int i = 0; i < lstRazonSocial.Count; i++)
        {
            string value = lstRazonSocial[i].Id + "||" +
                            lstRazonSocial[i].Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstRazonSocial[i].Numero, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_Par_Razon_Social_Nombre(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.PAR.BO_Par_Razon_Social RazonSocial = new BO_Par_Razon_Social();
        List<Par_Razon_Social> lstRazonSocial = RazonSocial.GetByLikeNombre("", s, contextKey, prefixText + "%");
        List<string> opciones = new List<string>();
        for (int i = 0; i < lstRazonSocial.Count; i++)
        {
            string value = lstRazonSocial[i].Id + "||" +
                            lstRazonSocial[i].Numero;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstRazonSocial[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void Jefe_Fiscalizacion_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlJefe_Fiscalizacion = (DropDownList)sender;

        ddlJefe_Fiscalizacion.Attributes.Add("onchange", "checkSelectedValue_JFiscalizacion()");

        TextBox Jefe_Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Jefe_Fiscalizacion");
        ddlJefe_Fiscalizacion.SelectedValue = Jefe_Fiscalizacion.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlJefe_Fiscalizacion.SelectedValue = "N";
    }

    protected void Fiscalizacion_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlFiscalizacion = (DropDownList)sender;

        ddlFiscalizacion.Attributes.Add("onchange", "checkSelectedValue_Fiscalizacion()");

        TextBox Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Fiscalizacion");
        ddlFiscalizacion.SelectedValue = Fiscalizacion.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlFiscalizacion.SelectedValue = "N";
    }

    protected void Contratista_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlContratista = (DropDownList)sender;

        ddlContratista.Attributes.Add("onchange", "checkSelectedValue_Contratista()");

        TextBox Contratista = (TextBox)Fv_Per_Personal.FindControl("Contratista");
        ddlContratista.SelectedValue = Contratista.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlContratista.SelectedValue = "N";
    }

    protected void Tipo_Fiscalizacion_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlTipo_Fiscalizacion = (DropDownList)sender;

        ddlTipo_Fiscalizacion.Attributes.Add("onchange", "checkSelectedValue_TFiscalizacion()");

        TextBox Tipo_Fiscalizacion = (TextBox)Fv_Per_Personal.FindControl("Tipo_Fiscalizacion");
        ddlTipo_Fiscalizacion.SelectedValue = Tipo_Fiscalizacion.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlTipo_Fiscalizacion.SelectedValue = "INT";
    }

    protected void Coordinador_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlCoordinador = (DropDownList)sender;

        ddlCoordinador.Attributes.Add("onchange", "checkSelectedValue_Coordinador()");

        TextBox Coordinador = (TextBox)Fv_Per_Personal.FindControl("Coordinador");
        ddlCoordinador.SelectedValue = Coordinador.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlCoordinador.SelectedValue = "N";
    }

    protected void Tecnico_Costos_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlTecnico_Costos = (DropDownList)sender;

        ddlTecnico_Costos.Attributes.Add("onchange", "checkSelectedValue_TCostos()");

        TextBox Tecnico_Costos = (TextBox)Fv_Per_Personal.FindControl("Tecnico_Costos");
        ddlTecnico_Costos.SelectedValue = Tecnico_Costos.Text;

        if (Fv_Per_Personal.CurrentMode == FormViewMode.Insert)
            ddlTecnico_Costos.SelectedValue = "N";
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Per_Personal); }
    }

    protected override GridView Gv
    {
        get { return Gv_Per_Personal; }
    }

    protected override FormView Fv
    {
        get { return Fv_Per_Personal; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Per_Personal; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Per_Personal; }
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
        get { return KFiltro; }
    }

    protected override string Contenedor
    {
        get { return "PER_PERSONAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Btn_Reporte_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                        + "PER/R_PER_PERSONAL.aspx"
                                        + Scope_Factory.Get_QueryString(s),
                                        "_blank", "scrollbars=yes, resizable=yes");
    }
}
