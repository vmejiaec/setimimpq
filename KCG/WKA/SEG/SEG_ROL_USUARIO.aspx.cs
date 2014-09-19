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
using HER;

public partial class SEG_SEG_ROL_USUARIO : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga("Seg_Rol_Usuario_Id");
        //Evento del Botón
        Btn_Seg_Rol_Usuario_Sucursal.Click += new EventHandler(Btn_Seg_Rol_Usuario_Sucursal_Click);
        //Evento del GridView
        gvSegRolUsuario.DataBound += new EventHandler(gvSegRolUsuario_DataBound);
        //base.Page_Load(sender, e);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Seg_Rol_Usuario); }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return gvSegRolUsuario; }
    }

    protected override FormView Fv
    {
        get { return fvSegRolUsuario; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVSegrolUsuario; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVSegRolUsuario; }
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
        get { return "SEG_ROL_USUARIO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    void gvSegRolUsuario_DataBound(object sender, EventArgs e)
    {
        if(gvSegRolUsuario.SelectedIndex > -1)
            Btn_Seg_Rol_Usuario_Sucursal.Enabled = true;
        else
            Btn_Seg_Rol_Usuario_Sucursal.Enabled = false;
    }

    void Btn_Seg_Rol_Usuario_Sucursal_Click(object sender, EventArgs e)
    {
        string Id = gvSegRolUsuario.DataKeys[gvSegRolUsuario.SelectedIndex].Values["Id"].ToString();
        Response.Redirect("~/SEG/SEG_ROL_USUARIO_DET.aspx?Seg_Rol_Usuario_Id=" + Id);
    }
}
