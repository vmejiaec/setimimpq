using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Koala.KoalaWebControls;

public partial class APU_APU_PROYECTO_FORMULA_MATERIAL:PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnListaProyecto.Click += new EventHandler(btnListaProyecto_Click);
        btnApuIndice.Click += new EventHandler(btnApuIndice_Click);
        fvApuProyectoMaterial.DataBound += new EventHandler(fvApuProyectoMaterial_DataBound);
    }

    void fvApuProyectoMaterial_DataBound(object sender, EventArgs e)
    {
        EstablecerAcceso();
    }

    private void EstablecerAcceso()
    {
        if(fvApuProyectoMaterial.CurrentMode == FormViewMode.ReadOnly)
        {
            if( Request.QueryString["Apu_Proyecto_Etapa"] == "CON" )
            {
                DeshabilitarControl("EditButton");
            }
        }
    }

    void btnApuIndice_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_INDICE.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void btnListaProyecto_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }

    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Material); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoMaterial; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoMaterial; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuProyectoMaterial; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuProyectoMaterial; }
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
        get { return "APU_PROYECTO_FORMULA_MATERIAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] GetIndice(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Indice boApuIndiceEquipo = new FEL.APU.BO_Apu_Indice();
        List<Apu_Indice> litApuIndiceEquipo = boApuIndiceEquipo.GetByLikeSoloMaterial("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuIndiceEquipo.Count && i < count; i++)
        {
            string value = litApuIndiceEquipo[i].Id + "||" +
                           litApuIndiceEquipo[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuIndiceEquipo[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
