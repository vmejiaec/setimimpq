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
using System.Collections.Generic;
using System.Web.Services;

public partial class SEG_SEG_ROL_ELEMENTO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        nav.Navegar += new EventHandler(nav_Navegar);
        gvMstSegRol.DataBound += new EventHandler(gvMstSegRol_DataBound);
        gvMstSegRol.DataBound += new EventHandler(gvMstSegRol_DataBound_);
        gvMstSegRol.SelectedIndexChanged += new EventHandler(gvMstSegRol_SelectedIndexChanged);
        navMst.Navegar += new EventHandler(gvMstSegRol_SelectedIndexChanged);        
        fvDetSegRolElemento.DataBound += new EventHandler(fvDetSegRolElemento_DataBound);
        btnRol.Click += new EventHandler(btnRol_Click);

        gvMstSegRol.PageIndexChanged += new EventHandler(gvMstSegRol_PageIndexChanged);
        
        //base.Page_Load(sender, e);
    }    

    void gvMstSegRol_PageIndexChanged(object sender, EventArgs e)
    {
        gvMstSegRol.SelectedIndex = 0;

        fvDetSegRolElemento.DefaultMode = FormViewMode.Insert;
        fvDetSegRolElemento.ChangeMode(FormViewMode.Insert);
        gvDetSegRolElemento.SelectedIndex = -1;
    }

    void btnRol_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SEG/SEG_ROL.aspx?Seg_Rol_Id=" +
            gvMstSegRol.SelectedDataKey.Values["Seg_Rol_Id"]);
    }

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {
        if (gvMstSegRol.Rows.Count > 0 && gvMstSegRol.SelectedDataKey != null)
        {
            param.Add(new DictionaryEntry("Seg_Rol_Id", gvMstSegRol.SelectedDataKey["Id"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    void fvDetSegRolElemento_DataBound(object sender, EventArgs e)
    {
        //if (fvDetSegRolElemento.CurrentMode == FormViewMode.ReadOnly)
        //{
        //    btnRol.Enabled = true;
        //}
        //else
        //{
        //    btnRol.Enabled = false;
        //}
    }

    void gvMstSegRol_SelectedIndexChanged(object sender, EventArgs e)
    {
        fvDetSegRolElemento.DefaultMode = FormViewMode.Insert;
        fvDetSegRolElemento.ChangeMode(FormViewMode.Insert);
        gvDetSegRolElemento.SelectedIndex = -1;
    }

    void gvMstSegRol_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SeleccionarItemEnCarga(null);
        }        
    }

    void gvMstSegRol_DataBound_(object sender, EventArgs e)
    {
        if (gvMstSegRol.SelectedDataKey == null)
            btnRol.Enabled = false;
        else
        {
            btnRol.Enabled = true;
        }
    }   

    void nav_Navegar(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(Seg_Rol_Elemento); }
    }

    protected override GridView Gv
    {
        get { return gvDetSegRolElemento; }
    }

    protected override FormView Fv
    {
        get { return fvDetSegRolElemento; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvDetSegRolElemento; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvDetSegRolElemento; }
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
        get { return "SEG_ROL_ELEMENTO"; }
    }


    [WebMethod]
    static public string[] GetEtiqueta(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Con_Elemento boDic_Con_Elemento = new FEL.DIC.BO_Dic_Con_Elemento();
        List<Dic_Con_Elemento> litDic_Con_Elemento = boDic_Con_Elemento.GetByTipoLikeEtiqueta("Nombre", s, "", prefixText + "%");
        List<string> opciones = new List<string>();

        for (int i = 0; i < litDic_Con_Elemento.Count && i < count; i++)
        {
            string value = litDic_Con_Elemento[i].Id + "||" +
                litDic_Con_Elemento[i].Nombre + "||" +
                    litDic_Con_Elemento[i].Dic_Rotulo_id + "||" +
                    litDic_Con_Elemento[i].Dic_Rotulo_nombre + "||" +
                    litDic_Con_Elemento[i].Dic_Contenedor_id + "||" +
                    litDic_Con_Elemento[i].Dic_Contenedor_Codigo + "||" +
                    litDic_Con_Elemento[i].Dic_Contenedor_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDic_Con_Elemento[i].Ver_etiqueta_nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetContenedor(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Contenedor boDic_Contenedor = new FEL.DIC.BO_Dic_Contenedor();
        List<Dic_Contenedor> litDic_Contenedor = boDic_Contenedor.GetByLikeNombre("Nombre", s, prefixText + "%");
        List<string> opciones = new List<string>();

        for (int i = 0; i < litDic_Contenedor.Count && i < count; i++)
        {
            string value = litDic_Contenedor[i].Id + "||" +
                    litDic_Contenedor[i].Menu_Dic_Con_Elemento_Id + "||" +
                    litDic_Contenedor[i].Menu_Dic_Con_Elemento_Nombre + "||" +
                    litDic_Contenedor[i].Menu_Dic_Rotulo_Id + "||" +
                    litDic_Contenedor[i].Menu_Dic_Rotulo_Nombre + "||" +
                    litDic_Contenedor[i].Menu_Ver_Etiqueta_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDic_Contenedor[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
