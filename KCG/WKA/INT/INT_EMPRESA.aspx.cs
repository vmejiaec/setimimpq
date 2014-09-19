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
using FEL.INT;
using System.Collections.Generic;

public partial class INT_INT_EMPRESA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga("Int_Empresa_Id");
        //Evento Boton
        Btn_Int_Empresa_Sucursal.Click += new EventHandler(Btn_Int_Empresa_Sucursal_Click);
        //Evento FormView
        fvIntEmpresa.ModeChanging += new FormViewModeEventHandler(fvIntEmpresa_ModeChanging);
        //Evento GridView
        gvInEmpresa.DataBound += new EventHandler(gvInEmpresa_DataBound);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Int_Empresa); }
    }

    protected override GridView Gv
    {
        get { return gvInEmpresa; }
    }

    protected override FormView Fv
    {
        get { return fvIntEmpresa; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvIntEmpresa; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvIntEmpresa; }
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
        get { return "INT_EMPRESA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    void fvIntEmpresa_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Insert)
            gvInEmpresa.SelectedIndex = -1;
    }

    void gvInEmpresa_DataBound(object sender, EventArgs e)
    {
        if (gvInEmpresa.SelectedIndex == -1)
            Btn_Int_Empresa_Sucursal.Enabled = false;
        else
            Btn_Int_Empresa_Sucursal.Enabled = true;
    }

    void Btn_Int_Empresa_Sucursal_Click(object sender, EventArgs e)
    {
        string Id = gvInEmpresa.DataKeys[gvInEmpresa.SelectedIndex].Values["Id"].ToString();
        Response.Redirect("~/INT/INT_SUCURSAL.aspx?Int_Empresa_Id=" + Id);
    }    
}
