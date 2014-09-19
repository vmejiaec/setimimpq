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
using FEL.SEG;
using Koala.KoalaWebControls;

public partial class SEG_SEG_MENU : PaginaBaseKCG
{
    public bool zoom = false;
    public bool aux = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlFiltro.DataBind();
            //pnlSeg_Menu.Enabled = false;
        }
        odsFvSegMenu.Selecting += new ObjectDataSourceSelectingEventHandler(odsFvSegMenu_Selecting);
        odsGvSegMenu.Selecting += new ObjectDataSourceSelectingEventHandler(odsGvSegMenu_Selecting);
        btnConsultar.Click += new EventHandler(btnConsultar_Click);
        fvSegMenu.ModeChanging += new FormViewModeEventHandler(fvSegMenu_ModeChanging);
        fvSegMenu.DataBound += new EventHandler(fvSegMenu_DataBound);

        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            zoom = true;
            aux = true;
        }

        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox SegRolId = (TextBox)fvSegMenu.FindControl("Seg_Rol_Id");
            SegRolId.Text = Seg_Rol_Id.Text;

            TextBox Int_Usuario_Id = (TextBox)fvSegMenu.FindControl("Int_Usuario_Id");
            Int_Usuario_Id.Text = ((Scope)Session["Scope"]).Int_Usuario_Id;
        }        
    }

    void fvSegMenu_DataBound(object sender, EventArgs e)
    {
        TextBox pantalla_ver_etiqueta_nombre = (TextBox)fvSegMenu.FindControl("pantalla_ver_etiqueta_nombre");
        TextBox Dic_Pantalla_Id = (TextBox)fvSegMenu.FindControl("Dic_Pantalla_Id");
        if(fvSegMenu.CurrentMode == FormViewMode.Insert)
        {
            if (zoom && aux)
            {
                //TextBox PantallaVerEtiquetaNombre = (TextBox)fvSegMenu.FindControl("pantalla_ver_etiqueta_nombre");
                TextBox Dic_Pantalla_Nombre = (TextBox)fvSegMenu.FindControl("Dic_Pantalla_Nombre");
                TextBox DicPantallaId = (TextBox)fvSegMenu.FindControl("Dic_Pantalla_Id");
                Aux_Dic_Nombre.Text = Dic_Pantalla_Nombre.Text;
                Aux_Dic_Id.Text = DicPantallaId.Text;
                //Dic_Pantalla_Nombre.Text = PantallaVerEtiquetaNombre.Text;
                aux = false;
            }
            pantalla_ver_etiqueta_nombre.Text = Aux_Dic_Nombre.Text;
            Dic_Pantalla_Id.Text = Aux_Dic_Id.Text;
        }
        //if (fvSegMenu.CurrentMode == FormViewMode.Edit)
        //{
        //    if (zoom)
        //    {
        //        TextBox PantallaVerEtiquetaNombre = (TextBox)fvSegMenu.FindControl("pantalla_ver_etiqueta_nombre");
        //        TextBox Dic_Pantalla_Nombre = (TextBox)fvSegMenu.FindControl("Dic_Pantalla_Nombre");
        //        Dic_Pantalla_Nombre.Text = PantallaVerEtiquetaNombre.Text;                
        //    }
        //}        
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Seg_Menu); }
    }

    protected override GridView Gv
    {
        get { return GvSegMenu; }
    }

    protected override FormView Fv
    {
        get { return fvSegMenu; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvSegMenu; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvSegMenu; }
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
        get { return "SEG_MENU" ; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    void btnConsultar_Click(object sender, EventArgs e)
    {
        SeleccionarGrid(null);
        //UpdatePanel1.Update();
        pnlSeg_Menu.Enabled = true;
    }

    void SeleccionarGrid(string indiceSeleccionQuery)
    {
        string idSeleccion = null;
        if (!string.IsNullOrEmpty(indiceSeleccionQuery))
            idSeleccion = Request.QueryString[indiceSeleccionQuery];

        if (string.IsNullOrEmpty(idSeleccion))
        {
            Gv.DataBind();
            if (Gv.DataKeys.Count > 0)
            {
                Gv.SelectedIndex = 0;
                AsignarParametrosDataSourceDeatailsView(Gv.SelectedDataKey.Values["Id"].ToString());
                Fv.DefaultMode = FormViewMode.ReadOnly;
                Fv.ChangeMode(FormViewMode.ReadOnly);
            }
        }
        else
        {
            AsignarParametrosDataSourceDeatailsView(idSeleccion);
            Fv.DefaultMode = FormViewMode.ReadOnly;
            SeleccionarItemGridView(idSeleccion);
        }
    }

    void odsFvSegMenu_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        // Asignación de parametros restantes
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        //e.InputParameters["Int_Usuario_Id"] = s.Int_Usuario_Id;
        e.InputParameters["par_servidor_id"] = s.Par_Servidor_Id;
    }

    void odsGvSegMenu_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        // Asignación de parametros restantes
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        e.InputParameters["Int_Usuario_Id"] = s.Int_Usuario_Id;
        e.InputParameters["par_servidor_id"] = s.Par_Servidor_Id;
    }

    void fvSegMenu_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Insert)
            GvSegMenu.SelectedIndex = -1;
    }

    protected void ddlGrupo_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlGrupo = (DropDownList)sender;
        ddlGrupo.Attributes.Add("onchange", "checkSelectedValueGrupo()");

        if (Fv.CurrentMode == FormViewMode.Edit)
        {
            TextBox Grupo = (TextBox)Fv.FindControl("Grupo");
            ddlGrupo.SelectedValue = Grupo.Text;            
        }        
    }

    [WebMethod]
    static public string[] GetRoles(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.SEG.BO_Seg_Rol boOpcionesOrigen = new FEL.SEG.BO_Seg_Rol();
        List<Seg_Rol> litOpciones = boOpcionesOrigen.GetByUsuarioLikeNombre("Nombre", s, prefixText + "%");
        List<string> opciones = new List<string>();

        for (int i = 0; i < litOpciones.Count && i < count; i++)
        {
            string value = litOpciones[i].Id;
            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litOpciones[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetPantalla(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.DIC.BO_Dic_Pantalla boOpcionesOrigen = new FEL.DIC.BO_Dic_Pantalla();
        List<Dic_Pantalla> litOpciones = boOpcionesOrigen.GetByLikeEtiqueta("Nombre", s, prefixText + "%");
        List<string> opciones = new List<string>();

        for (int i = 0; i < litOpciones.Count && i < count; i++)
        {
            string value = litOpciones[i].Id;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litOpciones[i].Ver_Etiqueta_nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetContenedor(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.SEG.BO_Seg_Rol_Elemento boSeg_Rol = new BO_Seg_Rol_Elemento();
        List<Seg_Rol_Elemento> litSeg_Rol = boSeg_Rol.GetByRol("Nombre", s, contextKey);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litSeg_Rol.Count && i < count; i++)
        {
            string value = litSeg_Rol[i].Dic_Con_Elemento_Id + "||" +
                           litSeg_Rol[i].Dic_Con_Elemento_Nombre + "||" +
                           litSeg_Rol[i].Dic_Contenedor_Codigo + "||" +
                           litSeg_Rol[i].Ver_Etiqueta_Nombre + "||" +
                           litSeg_Rol[i].Dic_Rotulo_Codigo + "||" +
                           litSeg_Rol[i].Dic_Rotulo_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litSeg_Rol[i].Dic_Contenedor_Nombre, value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] GetElemento(string prefixText, int count, string contextKey)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.SEG.BO_Seg_Rol_Elemento boOpcionesOrigen = new BO_Seg_Rol_Elemento();
        List<Seg_Rol_Elemento> litOpciones = boOpcionesOrigen.GetByRolLikeEtiqueta("Nombre", s, contextKey, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litOpciones.Count && i < count; i++)
        {
            string value = litOpciones[i].Dic_Con_Elemento_Id + "||" +
                           litOpciones[i].Dic_Con_Elemento_Nombre + "||" +
                           litOpciones[i].Dic_Contenedor_Codigo + "||" +
                           litOpciones[i].Dic_Contenedor_Nombre + "||" +
                           litOpciones[i].Dic_Rotulo_Codigo + "||" +
                           litOpciones[i].Dic_Rotulo_Nombre;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litOpciones[i].Ver_Etiqueta_Nombre, value));
        }
        return opciones.ToArray();
    }
}
