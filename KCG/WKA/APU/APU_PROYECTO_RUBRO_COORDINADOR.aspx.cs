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
using FEL.APU;
using System.Web.Services;
using System.Collections.Generic;
using System.Globalization;


public partial class APU_APU_PROYECTO_RUBRO_COORDINADOR : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoRubro);
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox cantidad = (TextBox)Fv.FindControl("Cantidad");
            cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }

    private void cargarBotones()
    {
        BtnRubro.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Coordinador_ProyectoRecursoKCG.Text").ToString();
        BtnRubro.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Coordinador_ProyectoRecursoKCG.ToolTip").ToString();
        BtnMaterial.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Coordinador_MaterialRecursoKCG.Text").ToString();
        BtnMaterial.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Coordinador_MaterialRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuProyectoRubro(object sender, EventArgs e)
    {
        AsignarAcceso(Request.QueryString["Apu_Proyecto_Etapa"]);
    }

    private void AsignarAcceso(string Apu_Proyecto_Etapa)
    {
        switch (Apu_Proyecto_Etapa)
        {
            case "BOR":
                break;

            case "DEF":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel PanelRubroI = (Panel)Fv.FindControl("PanelRubroI");
                    PanelRubroI.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");
                    Button btnDelete = (Button)Fv.FindControl("DeleteButton");
                    Button btnNew = (Button)Fv.FindControl("NewButton");
                    btnEdit.Enabled = false;
                    btnDelete.Enabled = false;
                    btnNew.Enabled = false;

                }
                else if (Fv.CurrentMode == FormViewMode.Edit)
                {
                    TextBox txbApuRubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
                    txbApuRubroNombre.ReadOnly = true;
                    txbApuRubroNombre.CssClass = "";
                }
                break;

            case "CON":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel PanelRubroI = (Panel)Fv.FindControl("PanelRubroI");
                    PanelRubroI.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");
                    Button btnDelete = (Button)Fv.FindControl("DeleteButton");
                    Button btnNew = (Button)Fv.FindControl("NewButton");
                    btnEdit.Enabled = false;
                    btnDelete.Enabled = false;
                    btnNew.Enabled = false;
                }
                /*else
                {
                    goto case "DEF";
                }*/
                break;

        }

    }

    
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro); }
    }

    protected override GridView Gv
    {
        get { return gvapu_proyecto_rubro_coordinador; }
    }

    protected override FormView Fv
    {
        get { return fvapu_proyecto_rubro_coordinador; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_proyecto_rubro_coordinador; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_proyecto_rubro; }
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
        get { return "APU_PROYECTO_RUBRO_COORDINADOR"; }
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
    
    
    [WebMethod]
    static public string[] GetProyectoRubroByCodigo(string prefixText, int count)
  {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Rubro boApuRubro = new BO_Apu_Rubro();
        List<Apu_Rubro> litApuRubro = boApuRubro.GetByLikeCodigo("Codigo", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuRubro.Count && i < count; i++)        
        {
            string value = litApuRubro[i].Id + "||" +
                           litApuRubro[i].Nombre + "||" +
                           litApuRubro[i].Unidad + "||" +
                           litApuRubro[i].Costo_Total.ToString() + "||" +
                           litApuRubro[i].Rendimiento_Mano_Obra + "||" +
                           litApuRubro[i].Rendimiento_Equipo + "||" +
                           litApuRubro[i].Apu_Subtitulo_id;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuRubro[i].Codigo, value));
        }
        return opciones.ToArray();
    }

    protected void BtnRubro_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        TextBox ProyectoEtapa = (TextBox)Fv.FindControl("Apu_Proyecto_Etapa");
        Response.Redirect("~/APU/APU_PROYECTO_COORDINADOR.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Proyecto_Etapa=" + ProyectoEtapa.Text);

    }
    protected void BtnMaterial_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //Response.Redirect("~/APU/APU_PROYECTO_RUBRO_MATERIAL_COORDINADOR.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + "&Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + RubroNombre.Text + "&Apu_Rubro_Unidad=" + RubroUnidad.Text);
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_MATERIAL_COORDINADOR.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + "&Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + RubroNombre.Text + "&Apu_Rubro_Unidad=" + RubroUnidad.Text);

    }  
}
