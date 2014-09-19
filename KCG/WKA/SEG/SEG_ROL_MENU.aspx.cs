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
using FEL.DIC;
using FEL.SEG;
using AjaxControlToolkit;

public partial class SEG_SEG_ROL_MENU : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        nav.Navegar += new EventHandler(nav_Navegar);
        mstgv_seg_rol_menu.DataBound += new EventHandler(mstgv_seg_rol_menu_DataBound);
        mstgv_seg_rol_menu.SelectedIndexChanged += new EventHandler(mstgv_seg_rol_menu_SelectedIndexChanged);
        navMst.Navegar += new EventHandler(mstgv_seg_rol_menu_SelectedIndexChanged);
        fv_det_SegRolMenu.DataBound += new EventHandler(fv_det_SegRolMenu_DataBound);
        Btn_Seg_Rol_Menu_Rol.Click += new EventHandler(Btn_Seg_Rol_Menu_Rol_Click);
        mstgv_seg_rol_menu.DataBound += new EventHandler(mstgv_seg_rol_menu_DataBound_);
        fv_det_SegRolMenu.ModeChanging += new FormViewModeEventHandler(fv_det_SegRolMenu_ModeChanging);
        mstgv_seg_rol_menu.PageIndexChanged += new EventHandler(mstgv_seg_rol_menu_PageIndexChanged);

        Verificar_ParametroZoom();

        //base.Page_Load(sender, e);
    }

    void fv_det_SegRolMenu_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Insert)
            gv_det_SegRolMenu.SelectedIndex = -1;
    }

    void mstgv_seg_rol_menu_PageIndexChanged(object sender, EventArgs e)
    {
        mstgv_seg_rol_menu.SelectedIndex = 0;

        fv_det_SegRolMenu.DefaultMode = FormViewMode.Insert;
        fv_det_SegRolMenu.ChangeMode(FormViewMode.Insert);
        gv_det_SegRolMenu.SelectedIndex = -1;  
    }

    void mstgv_seg_rol_menu_DataBound_(object sender, EventArgs e)
    {
        if (mstgv_seg_rol_menu.SelectedDataKey == null)
            Btn_Seg_Rol_Menu_Rol.Enabled = false;
        else
        {
            Btn_Seg_Rol_Menu_Rol.Enabled = true;            
        }
    }    

    protected void Verificar_ParametroZoom()
    {
        //if (fv_det_SegRolMenu == null) return;
        //if (Zoom.ContieneRequerimientoOrigen(UbicacionUrl))
        //{
        //    switch (Zoom.ObtenerModoDeRequerimiento(UbicacionUrl))
        //    {
        //        case FormViewMode.Insert:
        //            break;
                    
        //        case FormViewMode.Edit:
        //            fv_det_SegRolMenu.ChangeMode(FormViewMode.Edit);
        //            string _SegRolId = Zoom.ObtenerValorPropiedadDeParametros(UbicacionUrl, "Seg_Rol_Id");
        //            Seleccionar_IdGV(_SegRolId);
        //            break;                
        //    }
        //}
    }


    protected void Seleccionar_IdGV(object id)
    {
        DataView lista = (DataView)ods_mstgv_seg_rol_menu.Select();
        OrdenarDataView(lista, mstgv_seg_rol_menu.SortExpression, mstgv_seg_rol_menu.SortDirection);

        if (lista == null) return;

        int iTotal = BuscarObjetoPorID(id, lista);
        int iPagina;
        int iFila;

        if (iTotal != -1)
            CalcularPaginaYFilaDeSeleccion(out iPagina, out iFila, iTotal, mstgv_seg_rol_menu.PageSize);
        else
        {
            iPagina = 0;
            iFila = -1;
        }

        mstgv_seg_rol_menu.PageIndex = iPagina;
        mstgv_seg_rol_menu.SelectedIndex = iFila;
        mstgv_seg_rol_menu.DataBind();
    }



    void fv_det_SegRolMenu_DataBound(object sender, EventArgs e)
    {       
        if (fv_det_SegRolMenu.CurrentMode == FormViewMode.Insert || fv_det_SegRolMenu.CurrentMode == FormViewMode.Edit)
        {
            string Seg_Rol_Id = mstgv_seg_rol_menu.DataKeys[mstgv_seg_rol_menu.SelectedIndex].Values["Id"].ToString();
            ((AutoCompleteExtender)Fv.FindControl("AutoCompleteExtender4")).ContextKey = Seg_Rol_Id;
            ((AutoCompleteExtender)Fv.FindControl("acedic_contenedor_nombre")).ContextKey = Seg_Rol_Id;

            TextBox PantallaVerEtiquetaNombre = (TextBox)fv_det_SegRolMenu.FindControl("pantalla_ver_etiqueta_nombre");
            TextBox Dic_Pantalla_Nombre = (TextBox)fv_det_SegRolMenu.FindControl("Dic_Pantalla_Nombre");
            Dic_Pantalla_Nombre.Text = PantallaVerEtiquetaNombre.Text;
        }
    }

    void mstgv_seg_rol_menu_SelectedIndexChanged(object sender, EventArgs e)
    {
        fv_det_SegRolMenu.DefaultMode = FormViewMode.Insert;
        fv_det_SegRolMenu.ChangeMode(FormViewMode.Insert);
        gv_det_SegRolMenu.SelectedIndex = -1;     
    }

    void Btn_Seg_Rol_Menu_Rol_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SEG/SEG_ROL.aspx?Seg_Rol_Id=" +
            mstgv_seg_rol_menu.SelectedDataKey.Values["Id"]);
    }    

    void mstgv_seg_rol_menu_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SeleccionarItemEnCarga(null);
        }        
    }

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {
        if (mstgv_seg_rol_menu.Rows.Count > 0 && mstgv_seg_rol_menu.SelectedDataKey != null)
        {            
            param.Add(new DictionaryEntry("Seg_Rol_Id", mstgv_seg_rol_menu.SelectedDataKey["Id"]));            
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    protected void Grupo_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl_Grupo = (DropDownList)sender;

        ddl_Grupo.Attributes.Add("onchange", "checkSelectedValueGrupo()");

        TextBox txtGrupo = (TextBox)Fv.FindControl("Grupo");
        ddl_Grupo.SelectedValue = txtGrupo.Text;
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
        get { return typeof(Seg_Rol_Menu); }
    }

    protected override GridView Gv
    {
        get { return gv_det_SegRolMenu; }
    }

    protected override FormView Fv
    {
        get { return fv_det_SegRolMenu; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgv_det_SegRolMenu; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfv_det_SegRolMenu; }
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
        get { return "SEG_ROL_MENU"; }
    }

    [WebMethod]
    static public string[] Getcontenedor_nombre(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.SEG.BO_Seg_Rol_Elemento boContenedor = new BO_Seg_Rol_Elemento();
        List<Seg_Rol_Elemento> litContenedor = boContenedor.GetByLikeNombre("Nombre", s, contextKey, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litContenedor.Count && i < count; i++)
        {
            string value = litContenedor[i].Dic_Con_Elemento_Id + "||" +
                           litContenedor[i].Dic_Rotulo_Nombre + "||" +
                           litContenedor[i].Ver_Etiqueta_Nombre + "||" +
                           litContenedor[i].Dic_Con_Elemento_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litContenedor[i].Dic_Contenedor_Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_DicComElemento(string prefixText, int count, string contextKey)
    {

        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.SEG.BO_Seg_Rol_Elemento RolElemento = new BO_Seg_Rol_Elemento();
        List<Seg_Rol_Elemento> litRolElemento = RolElemento.GetByRolLikeEtiqueta("Nombre", s, contextKey, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litRolElemento.Count && i < count; i++)
        {
            string value = litRolElemento[i].Dic_Con_Elemento_Id + "||" +
                           litRolElemento[i].Dic_Rotulo_Nombre + "||" +
                           litRolElemento[i].Dic_Contenedor_Nombre + "||" +
                           litRolElemento[i].Dic_Con_Elemento_Nombre;                           

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litRolElemento[i].Ver_Etiqueta_Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetEtiqueta_nombre(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Pantalla boDic_Pantalla = new BO_Dic_Pantalla();
        List<Dic_Pantalla> litDic_Pantalla = boDic_Pantalla.GetByLikeEtiqueta("Nombre", s, prefixText + "%");
        List<string> opciones = new List<string>();

        for (int i = 0; i < litDic_Pantalla.Count && i < count; i++)
        {
            string value = litDic_Pantalla[i].Id + "||" +
                           litDic_Pantalla[i].Codigo + "||" +
                           litDic_Pantalla[i].Dic_Rotulo_nombre + "||" +
                           litDic_Pantalla[i].Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litDic_Pantalla[i].Ver_Etiqueta_nombre, value));
        }
        return opciones.ToArray();
    }
}
