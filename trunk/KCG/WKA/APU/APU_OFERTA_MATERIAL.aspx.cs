using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using FEL.APU;
using System.Web.UI.HtmlControls;

public partial class APU_APU_OFERTA_MATERIAL : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuOfertaMaterial);
    }

    private void cargarBotones()
    {
        FormulaButton.Text = GetLocalResourceObject("Btn_Apu_Oferta_Material_FormulaRecursoKCG.Text").ToString();
        FormulaButton.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Material_FormulaRecursoKCG.ToolTip").ToString();
        ListadoButton.Text = GetLocalResourceObject("Btn_Apu_Oferta_Material_Oferta_ListadoRecursoKCG.Text").ToString();
        ListadoButton.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Material_Oferta_ListadoRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuOfertaMaterial(object sender, EventArgs e)
    {
        //AsignarAcceso(Request.QueryString["Apu_Oferta_Etapa"]);
        string estado = Request.QueryString["Estado"];
        string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
        if (estado == "BOR" || presupuesto_estado == "PEN")
            HabilitarControl("InsertButton");
        else
            DeshabilitarControl("InsertButton");
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvapu_oferta_material.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvapu_oferta_material.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }


    private void AsignarAcceso(string Apu_Oferta_Etapa)
    {
        switch (Apu_Oferta_Etapa)
        {
            case "BOR":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    Panel panelI2 = (Panel)Fv.FindControl("panelI2");
                    panelI2.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");
                    Button btnDelete = (Button)Fv.FindControl("DeleteButton");
                    Button btnNew = (Button)Fv.FindControl("NewButton");
                    btnEdit.Enabled = true;
                    btnDelete.Enabled = false;
                    btnNew.Enabled = false;
                }                
                break;

            case "DEF":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    /*Button btnInsert = (Button)Fv.FindControl("InsertButton");
                    Button btnCancelInsert = (Button)Fv.FindControl("InsertCancelButton");
                    btnInsert.Enabled = false;
                    btnCancelInsert.Enabled = false;*/
                    Panel panelI2 = (Panel)Fv.FindControl("panelI2");
                    panelI2.Enabled = false;
                }
                else if (Fv.CurrentMode == FormViewMode.ReadOnly)
                {
                    Button btnEdit = (Button)Fv.FindControl("EditButton");
                    Button btnDelete = (Button)Fv.FindControl("DeleteButton");
                    Button btnNew = (Button)Fv.FindControl("NewButton");
                    btnEdit.Enabled = true;
                    btnDelete.Enabled = false;
                    btnNew.Enabled = false;
                }                
                break;

            case "CON":
                if (Fv.CurrentMode == FormViewMode.Insert)
                {
                    /*Button btnInsert = (Button)Fv.FindControl("InsertButton");
                    Button btnCancelInsert = (Button)Fv.FindControl("InsertCancelButton");
                    btnInsert.Enabled = false;
                    btnCancelInsert.Enabled = false;*/
                    Panel panelI2 = (Panel)Fv.FindControl("panelI2");
                    panelI2.Enabled = false;
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
        get { return typeof(global::Apu_Oferta_Material); }
    }

    protected override GridView Gv
    {
        get { return Gvapu_oferta_material; }
    }

    protected override FormView Fv
    {
        get { return fvapu_oferta_material; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvapu_oferta_material; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_oferta_material; }
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
        get { return "APU_OFERTA_MATERIAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
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

    [WebMethod]
    static public string[] GetMaterial(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Indice boApu_Indice = new BO_Apu_Indice();
        List<Apu_Indice> litApuOfetaMaterial = boApu_Indice.GetByLikeSoloMaterial("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuOfetaMaterial.Count && i < count; i++)
        {
            string value = litApuOfetaMaterial[i].Id + "||" +
                           litApuOfetaMaterial[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuOfetaMaterial[i].Nombre, value));
        }
        opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("NINGUNO", "||"));
        return opciones.ToArray();
    }

    protected void FormulaButton_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        Response.Redirect("~/APU/APU_OFERTA_INDICE.aspx?Apu_Oferta_Id=" + OfertaId.Text + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void ListadoButton_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx?Apu_Oferta_id=" + OfertaId.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }   


}
