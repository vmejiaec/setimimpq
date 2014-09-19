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

public partial class APU_APU_PROYECTO_EQUIPO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoEquipo);
    }

    private void cargarBotones()
    {
        BtnProyecto.Text = GetLocalResourceObject("Btn_Proyecto_Equipo_ProyectoRecursoKCG.Text").ToString();
        BtnProyecto.ToolTip = GetLocalResourceObject("Btn_Proyecto_Equipo_ProyectoRecursoKCG.ToolTip").ToString();
    }

    public void Fv_DataBoundApuProyectoEquipo(object sender, EventArgs e)
    {
        AsignarAcceso();
    }

    private void AsignarAcceso()
    {
        Panel PanelI2 = (Panel)Fv.FindControl("PanelI2");        
        if (Fv.CurrentMode == FormViewMode.Insert)             
            PanelI2.Enabled = false;
        else                  
            PanelI2.Enabled = true;                                 
    }
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Equipo); }
    }

    protected override GridView Gv
    {
        get { return gvApu_Proyecto_Equipo; }
    }

    protected override FormView Fv
    {
        get { return fvApu_Proyecto_Equipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApu_proyecto_equipo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_proyecto_equipo; }
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
        get { return "APU_PROYECTO_EQUIPO"; }
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
        base.DefinirParametrosFijosDeInsercion(param);
    }
    protected void BtnProyecto_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }   
}
