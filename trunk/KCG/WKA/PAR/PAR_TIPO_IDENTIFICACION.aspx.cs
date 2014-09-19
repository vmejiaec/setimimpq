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

public partial class PAR_PAR_TIPO_IDENTIFICACION : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fvpar_tipo_identificacion.DataBound += new EventHandler(fvpar_tipo_identificacion_DataBound);        
    }
    
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Par_Tipo_Identificacion); }
    }

    protected override GridView Gv
    {
        get { return gvpar_tipo_identificacion; }
    }

    protected override FormView Fv
    {
        get { return fvpar_tipo_identificacion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvpar_tipo_identificacion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvpar_tipo_identificacion; }
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
        get { return "PAR_TIPO_IDENTIFICACION"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Cedula_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlcedula = (DropDownList)sender;

        ddlcedula.Attributes.Add("onchange", "checkSelectedValueCedula()");

        TextBox cedula = (TextBox)Fv.FindControl("Cedula");
        ddlcedula.SelectedValue = cedula.Text;

        if (Fv.CurrentMode == FormViewMode.Insert)
            ddlcedula.SelectedValue = "N";
    }

    void fvpar_tipo_identificacion_DataBound(object sender, EventArgs e)
    {
        if (fvpar_tipo_identificacion.CurrentMode == FormViewMode.Insert)
        {
            TextBox cedula = (TextBox)Fv.FindControl("Cedula");
            DropDownList ddlcedula = (DropDownList)Fv.FindControl("ddlCedula");
            if (cedula.Text == string.Empty)
                cedula.Text = ddlcedula.SelectedValue;
        }
    }
}
