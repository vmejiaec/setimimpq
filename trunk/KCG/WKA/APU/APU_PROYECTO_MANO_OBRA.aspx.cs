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
using System.Globalization;
using System.Web.Services;
using System.Collections.Generic;

public partial class APU_APU_PROYECTO_MANO_OBRA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoManoObra);
    }
    
    private void cargarBotones()
    {
        BtnProyecto.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Mano_Obra_ProyectoRecursoKCG.Text").ToString();
        BtnProyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Mano_Obra_ProyectoRecursoKCG.ToolTip").ToString();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return gvapu_proyecto_mano_obra; }
    }

    protected override FormView Fv
    {
        get { return fvapu_proyecto_mano_obra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_proyecto_mano_obra; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_proyecto_mano_obra; }
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
        get { return "APU_PROYECTO_MANO_OBRA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] GetManoDeObra(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Categoria boApuCategoria = new BO_Apu_Categoria();
        List<Apu_Categoria> litApuCategoria = boApuCategoria.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuCategoria.Count && i < count; i++)
        {
            string value = litApuCategoria[i].Id + "||" +
                           litApuCategoria[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuCategoria[i].Nombre, value));
        }

        return opciones.ToArray();
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
    
    public void Fv_DataBoundApuProyectoManoObra(object sender, EventArgs e)
    {
        AsignarAcceso(Request.QueryString["Apu_Proyecto_Etapa"]);
        if(fvapu_proyecto_mano_obra.CurrentMode == FormViewMode.Edit)
            DeterminarEdicion();
    }

    private void AsignarAcceso(string Apu_Proyecto_Etapa)
    {
        switch (Apu_Proyecto_Etapa)
        {
            case "BOR":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel PanelI2 = (Panel)Fv.FindControl("PanelI2");
                    PanelI2.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {

                    Button btnDelete = (Button)Fv.FindControl("DeleteButton");
                    Button btnNew = (Button)Fv.FindControl("NewButton");
                    btnDelete.Enabled = false;
                    btnNew.Enabled = false;
                    

                }
                break;

            case "DEF":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel PanelI2 = (Panel)Fv.FindControl("PanelI2");
                    PanelI2.Enabled = false;
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
                break;

            case "CON":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel PanelI2 = (Panel)Fv.FindControl("PanelI2");
                    PanelI2.Enabled = false;
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
                break;

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
    
    private void DeterminarEdicion()
    {
        TextBox CategoriaId = (TextBox)Fv.FindControl("Apu_Categoria_Id");
        TextBox CostoDiario = (TextBox)Fv.FindControl("Costo_Diario");
        if (CategoriaId.Text == "")
            CostoDiario.Enabled = true;
        else
            CostoDiario.Enabled = false;        
    }

    
}
