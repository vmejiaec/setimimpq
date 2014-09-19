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

public partial class APU_APU_PROYECTO_MATERIAL : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();        
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoMaterial);        
    }    

    private void cargarBotones()
    {
        BtnProyecto.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Material_ProyectoRecursoKCG.Text").ToString();
        BtnProyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Material_ProyectoRecursoKCG.ToolTip").ToString();
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
        get { return gvapu_proyecto_material; }
    }

    protected override FormView Fv
    {
        get { return fvapu_proyecto_material; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_proyecto_material; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_proyecto_material; }
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
        get { return "APU_PROYECTO_MATERIAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Id", Request.QueryString["Apu_Proyecto_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", Request.QueryString["Apu_Proyecto_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", Request.QueryString["Apu_Proyecto_Nombre"]));

        }

        /*Apu_Rubro_Id
        Apu_Rubro_Codigo
        Apu_Rubro_Nombre
        Apu_Rubro_Unidad*/

        base.DefinirParametrosFijosDeInsercion(param);
    }

    public void Fv_DataBoundApuProyectoMaterial(object sender, EventArgs e)
    {
        if (Request.QueryString["Estado"] == "DIS")
        {
            if (fvapu_proyecto_material.CurrentMode == FormViewMode.Insert && fvapu_proyecto_material.DataItemCount == 0)
            {
                DeshabilitarControl("InsertButton");
                DeshabilitarControl("InsertCancelButton");
            }
        }
        else
        {
            if (fvapu_proyecto_material.CurrentMode == FormViewMode.Insert)
            {
                HabilitarControl("InsertButton");
                HabilitarControl("InsertCancelButton");
            }
        }
    }

    protected void BtnProyecto_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + 
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

    private void HabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = true;
        }
    }
}
