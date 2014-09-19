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
using System.Web.Services;
using System.Collections.Generic;
using Koala.KoalaWebControls;

public partial class APU_APU_OFERTA_MANO_OBRA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        //EtiquetarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuOfertaManoObra);
    }

    void Fv_DataBoundApuOfertaManoObra(object sender, EventArgs e)
    {
        //AsignarAcceso(Request.QueryString["Apu_Oferta_Etapa"]);
        if (fvApuOfertaManoObra.CurrentMode == FormViewMode.Edit)
        {
            TextBox Costo_Diario = (TextBox)fvApuOfertaManoObra.FindControl("Costo_Diario");
            TextBox Apu_Categoria_Id = (TextBox)fvApuOfertaManoObra.FindControl("Apu_Categoria_Id");
            if (Apu_Categoria_Id.Text == "")
                Costo_Diario.Enabled = true;
            else
                Costo_Diario.Enabled = false;
        }
    }    

    private void AsignarAcceso(string Apu_Oferta_Etapa)
    {
        switch (Apu_Oferta_Etapa)
        {
            case "BOR":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel Rec_Apu_Oferta_Mano_Obra = (Panel)Fv.FindControl("Rec_Apu_Oferta_Mano_Obra");
                    Rec_Apu_Oferta_Mano_Obra.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");                    
                    btnEdit.Enabled = true;                   
                }
                break;

            case "DEF":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel Rec_Apu_Oferta_Mano_Obra = (Panel)Fv.FindControl("Rec_Apu_Oferta_Mano_Obra");
                    Rec_Apu_Oferta_Mano_Obra.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");                    
                    btnEdit.Enabled = true;                   
                }
                break;

            case "CON":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {                    
                    Panel Rec_Apu_Oferta = (Panel)Fv.FindControl("Rec_Apu_Oferta");
                    Rec_Apu_Oferta.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");                    
                    btnEdit.Enabled = false;                    
                }               
                break;

        }
    }

    private void EtiquetarBotones()
    {
        ;
        //Btn_Apu_Oferta_Mano_Obra_Formula.Text = GetLocalResourceObject("Btn_Apu_Oferta_Mano_Obra_FormulaRecursoKCG.Text").ToString();
        //Btn_Apu_Oferta_Mano_Obra_Formula.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Mano_Obra_FormulaRecursoKCG.ToolTip").ToString();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return gvApuOfertaManoObra; }
    }

    protected override FormView Fv
    {
        get { return fvApuOfertaManoObra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuOfertaManoObra; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuOfertaManoObra; }
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
        get { return "APU_OFERTA_MANO_OBRA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    [WebMethod]
    static public string[] GetCategoria(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Categoria boApuOfertaManoObraCategoria = new FEL.APU.BO_Apu_Categoria();
        List<Apu_Categoria> litApuOfertaManoObraCategoria = boApuOfertaManoObraCategoria.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuOfertaManoObraCategoria.Count && i < count; i++)
        {
            string value = litApuOfertaManoObraCategoria[i].Id + "||" +
                           litApuOfertaManoObraCategoria[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuOfertaManoObraCategoria[i].Nombre, value));
        }
        opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("Ninguno", "||"));
        return opciones.ToArray();
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", Request.QueryString["Apu_Oferta_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", Request.QueryString["Apu_Oferta_Nombre"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
}
