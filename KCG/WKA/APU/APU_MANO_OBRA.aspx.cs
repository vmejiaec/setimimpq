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
using System.Globalization;
using System.Web.Services;
using FEL.APU;
using System.Collections.Generic;
using HER;

public partial class APU_APU_MANO_OBRA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Apu_Mano_Obra_Id = Request.QueryString.Get("Apu_Mano_Obra_Id");
            if (Apu_Mano_Obra_Id != null)
            {
                AsignarParametrosDataSourceDeatailsView(Apu_Mano_Obra_Id);
                Fv.DefaultMode = FormViewMode.ReadOnly;
            }
            cargarBotones();
            Fv.DataBound += new EventHandler(Fv_DataBoundApuManoObra);
        }
        //Fv.DataBound += new EventHandler(Fv_DataBoundComprobar);       
    }

    void Fv_DataBoundApuManoObra(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox costo_diario = (TextBox)Fv.FindControl("Costo_Diario");
            if(costo_diario.Text == string.Empty)
                costo_diario.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

            TextBox costo_hora = (TextBox)Fv.FindControl("Costo_Hora");
            if(costo_hora.Text == string.Empty)
                costo_hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }
    private void cargarBotones()
    {
        Btn_Clonar.Text = GetLocalResourceObject("Btn_Clonar_Mano_ObraRecursoKCG.Text").ToString();
        Btn_Clonar.ToolTip = GetLocalResourceObject("Btn_Clonar_Mano_ObraRecursoKCG.ToolTip").ToString();
        Btn_Historico.Text = GetLocalResourceObject("Btn_Historico_Mano_ObraRecursoKCG.Text").ToString();
        Btn_Historico.ToolTip = GetLocalResourceObject("Btn_Historico_Mano_ObraRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundComprobar(object sender, EventArgs e)
    {
        TextBox CategoriaId = (TextBox)Fv.FindControl("Apu_Categoria_Id");
        TextBox CostoDiario = (TextBox)Fv.FindControl("Costo_Diario");
        if (Fv.DefaultMode == FormViewMode.Insert || Fv.DefaultMode == FormViewMode.Edit)
        {
            if (CategoriaId.Text == string.Empty)
            {
                CostoDiario.ReadOnly = false;
                CostoDiario.CssClass = "TEXTO_EDICION_KCG";
            }
            else
            {
                CostoDiario.ReadOnly = true;
                CostoDiario.TabIndex = -1;
            }
        }
    }    

    protected void Disponible_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList Disponible = (DropDownList)sender;
            Disponible.SelectedValue = "S";
        }
    }
    protected void Btn_Clonar_Click(object sender, EventArgs e)
    {

        TextBox ManoObraId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_CLONAR.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + ManoObraId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);

    }

    protected void Btn_Historico_Click(object sender, EventArgs e)
    {

        TextBox ManoObraId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/HIS/HIS_GENERAR_HISTORICO.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + ManoObraId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);
    }


    [WebMethod]
    static public string[] Get_ApuCateNom(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Categoria boApuCategoria = new BO_Apu_Categoria();
        List<Apu_Categoria> litApuCategoria = boApuCategoria.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuCategoria.Count && i < count; i++)
        {
            string value = litApuCategoria[i].Id + "||" +
                           litApuCategoria[i].Codigo + "||" +
                           litApuCategoria[i].Costo_Diario.ToString("N4", NumberFormatInfo.CurrentInfo) + "||" +
                           litApuCategoria[i].Costo_Hora.ToString("N4", NumberFormatInfo.CurrentInfo);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuCategoria[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Mano_Obra); }
    }

    protected override GridView Gv
    {
        get { return gvApuManoObra; }
    }

    protected override FormView Fv
    {
        get { return fvApuManoObra; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuManoObra ; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuManoObra; }
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
        get { return "APU_MANO_OBRA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
        
}
