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

public partial class APU_APU_PROYECTO_RUBRO_MATERIAL_COORDINADOR : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Rubro_Material_Coordinador_Rubro.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Material_Coordinador_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Material_Coordinador_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Material_Coordinador_RubroRecursoKCG.ToolTip").ToString();
    }
    
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro_Material); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoRubroMaterialCoordinador; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoRubroMaterialCoordinador; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuProyectoRubroMaterialCoordinador; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuProyectoRubroMaterialCoordinador; }
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
        get { return "APU_PROYECTO_RUBRO_MATERIAL_COORDINADOR"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Rubro_Id", Request.QueryString["Apu_Proyecto_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Id", Request.QueryString["Apu_Proyecto_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", Request.QueryString["Apu_Proyecto_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", Request.QueryString["Apu_Proyecto_Nombre"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", Request.QueryString["Apu_Rubro_Nombre"]));

        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
    protected void Btn_Apu_Proyecto_Rubro_Material_Coordinador_Rubro_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        TextBox ProyectoEtapa = (TextBox)Fv.FindControl("Apu_Proyecto_Etapa");
        //Response.Redirect("~/APU/APU_PROYECTO_RUBRO_COORDINADOR.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Proyecto_Etapa=" + ProyectoEtapa.Text);
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_COORDINADOR.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Proyecto_Etapa=" + ProyectoEtapa.Text);
    }
}
