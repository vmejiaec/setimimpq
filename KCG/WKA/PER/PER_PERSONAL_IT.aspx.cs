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
using FEL.DIC;
using FEL.PER;
using System.Text;
using System.Collections.Generic;
using System.Web.Services;
using System.Reflection;

public partial class PER_PER_PERSONAL_IT : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fvper_personal_it.DataBound += new EventHandler(fvper_personal_it_DataBound);
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
        get { return gvper_personal_it; }
    }

    protected override FormView Fv
    {
        get { return fvper_personal_it; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvper_personal_it; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvper_personal_it; }
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
        get { return "PER_PERSONAL_IT"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    void fvper_personal_it_DataBound(object sender, EventArgs e)
    {        
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox _valCordinador = (TextBox)Fv.FindControl("Coordinador");
            TextBox _valTecnico_Costos = (TextBox)Fv.FindControl("Tecnico_Costos");
            _valCordinador.Text = "N";
            _valTecnico_Costos.Text = "N";
        }
    }

}