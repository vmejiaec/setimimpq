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

public partial class DIC_DIC_ROTULO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Load(sender, e);
        cargarBotones();
    }
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Rotulo); }
    }

    protected override GridView Gv
    {
        get { return gvDicRotulo; }
    }

    protected override FormView Fv
    {
        get { return fvDicRotulo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicRotulo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicRotulo; }
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
        get { return "DIC_ROTULO"; }
    }
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    private void cargarBotones()
    {
        BtnEtiqueta.Text = GetLocalResourceObject("Btn_Dic_Rotulo_EtiquetaRecursoKCG.Text").ToString();
        BtnEtiqueta.ToolTip = GetLocalResourceObject("Btn_Dic_Rotulo_EtiquetaRecursoKCG.ToolTip").ToString();
    }
    protected void BtnEtiqueta_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/VER/VER_ETIQUETA.aspx?");
    }
    protected void btConsultaEtiqueta_Click(object sender, EventArgs e)
    {
        TextBox tbDic_Rotulo_Id = (TextBox)fvDicRotulo.FindControl("Id");
        string sDic_Rotulo_Id = tbDic_Rotulo_Id.Text;        
        FEL.VER.BO_Ver_Etiqueta adp = new FEL.VER.BO_Ver_Etiqueta();
        List<Ver_Etiqueta> lista = adp.GetByDic_Rotulo_Id("Id",Scope, sDic_Rotulo_Id);
        if (lista.Count == 0)
        {
            tbEtiquetaNombre.Text = "";
            lbMensaje.Text = "Dic_Rotulo_Id: " + sDic_Rotulo_Id + "> Etiqueta no encontrada";
        }
        else
        {
            if (lista.Count > 1)
            {
                lbMensaje.Text = "Error! Hay DOS etiquetas para este rótulo. Debe borrar por DB una de ellas. Dic_Rotulo_Id: " + sDic_Rotulo_Id ;
            }
            else
            {
                lbMensaje.Text = ">";
                var o = lista[0];
                tbEtiquetaNombre.Text = o.Nombre;
            }
        }
    }
    protected void btActualizarEtiqueta_Click(object sender, EventArgs e)
    {
        TextBox tbDic_Rotulo_Id = (TextBox)fvDicRotulo.FindControl("Id");
        string sDic_Rotulo_Id = tbDic_Rotulo_Id.Text;
        FEL.VER.BO_Ver_Etiqueta adp = new FEL.VER.BO_Ver_Etiqueta();
        List<Ver_Etiqueta> lista = adp.GetByDic_Rotulo_Id("Id", Scope, sDic_Rotulo_Id);
        if (lista.Count == 0)
        {
            tbEtiquetaNombre.Text = "";
            lbMensaje.Text = "Dic_Rotulo_Id: " + sDic_Rotulo_Id + "> Etiqueta no encontrada";
        }
        else
        {
            lbMensaje.Text = ">";
            var o = lista[0];
            var n = adp.GetByDic_Rotulo_Id("Id", Scope, sDic_Rotulo_Id)[0];
            n.Nombre = tbEtiquetaNombre.Text;
            int res = adp.Update(Scope, n, o);
            if (res >0 )
                lbMensaje.Text = "Etiqueta actualizada";
            else
                lbMensaje.Text = "ERROR";
        }
    }
    protected void btCrearEtiqueta_Click(object sender, EventArgs e)
    {
        TextBox tbDic_Rotulo_Id = (TextBox)fvDicRotulo.FindControl("Id");
        string sDic_Rotulo_Id = tbDic_Rotulo_Id.Text;
        FEL.VER.BO_Ver_Etiqueta adp = new FEL.VER.BO_Ver_Etiqueta();
        Ver_Etiqueta n = new Ver_Etiqueta();
        List<Ver_Etiqueta> lista = adp.GetByDic_Rotulo_Id("Id",Scope, sDic_Rotulo_Id);
        if (lista.Count == 0)
        {
            n.Nombre = tbEtiquetaNombre.Text;
            n.Dic_Rotulo_Id = sDic_Rotulo_Id;
            n.Ver_Version_Id = Scope.Ver_Version_Id;
            string res = adp.Insert(Scope, n);
            lbMensaje.Text = "Etiqueta insertada con Ver_Etiqueta_Id: " + res;
        }
        else
        {
            lbMensaje.Text = "Error! la etiqueta ya existe para este rótulo";
        }
    }
}
