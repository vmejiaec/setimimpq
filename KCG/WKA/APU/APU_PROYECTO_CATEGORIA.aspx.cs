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

public partial class APU_APU_PROYECTO_CATEGORIA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }   

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Categoria); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoCategoria; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoCategoria; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuProyectoCategoria; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuProyectoCategoría; }
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
        get { return "APU_PROYECTO_CATEGORIA"; }
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
    
    protected void Btn_Proyecto_Click(object sender, EventArgs e)
    {
        string Proyecto_Id = Request.QueryString["Apu_Proyecto_Id"];
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + Proyecto_Id +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
