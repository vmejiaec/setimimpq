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
using FEL.PAR;
using System.Collections.Generic;
using System.Drawing;
using System.Web.Services.Protocols; 

public partial class PAR_PAR_RAZON_SOCIAL : PaginaBaseKCG  
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fvpar_razon_social.DataBound += new EventHandler(fvpar_razon_social_DataBound);
    }

    void fvpar_razon_social_DataBound(object sender, EventArgs e)
    {
        if (fvpar_razon_social.CurrentMode == FormViewMode.Insert)
        {
            TextBox Codigo = (TextBox)fvpar_razon_social.FindControl("Codigo");
            Codigo.Text = string.Empty;
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Par_Razon_Social); }
    }

    protected override GridView Gv
    {
        get { return gvpar_razon_social; }
    }

    protected override FormView Fv
    {
        get { return fvpar_razon_social; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvpar_razon_social; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvpar_razon_social; }
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
        get { return "PAR_RAZON_SOCIAL"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    } 

    [WebMethod]
    static public string[] GetIdentificacion(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

       
        FEL.PAR.BO_Par_Tipo_Identificacion ParIdentificacion = new BO_Par_Tipo_Identificacion();
        List<Par_Tipo_Identificacion> litParIdentificacion = ParIdentificacion.GetByLikeNombre("Nombre", s, prefixText + "%");
            
        List<string> opciones = new List<string>();
        for (int i = 0; i < litParIdentificacion.Count && i < count; i++)
        {
            string value = litParIdentificacion[i].Id + "||" +
                           litParIdentificacion[i].Codigo + "||" +
                           litParIdentificacion[i].Nombre + "||" +
                           litParIdentificacion[i].Cedula;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litParIdentificacion[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void CopyButton_Click(object sender, EventArgs e)
    {
        CopiarValoresDeControles_Insert(fvpar_razon_social, TipoObjeto);
    }


}