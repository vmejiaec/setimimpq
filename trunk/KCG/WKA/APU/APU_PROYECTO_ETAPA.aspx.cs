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

public partial class APU_APU_PROYECTO_ETAPA : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto); }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoEtapa; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuProyectoEtapa; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_ETAPA"; }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Id", Request.QueryString["Apu_Proyecto_Id"]));            
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
    
    protected void Btn_Apu_Proyecto_Cancelar_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text);
    }

    protected void Btn_Oferta_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text);
    }
}
